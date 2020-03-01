struct Character: CustomStringConvertible {
    let name: String
    var title: String?
    let race: Race
    let attributes: Attributes
    var startClass: Class { return classes.first! }
    var classes: [Class]
    let background: Background
    let proficiencies: [Skill]
    var maxHitPoints: Int
    var hitPoints: Int
    var equippedArmor: Armor
    var equippedWeapon: Weapon
    var location: Location
    var armorClass: Int {
        return equippedArmor.baseClass(dexterityModifier: attributes.dexterity.modifier)
    }
    var isBloodied: Bool { return hitPoints < maxHitPoints / 2 }
    
    var level: Int { return classes.reduce(0) { $0 + $1.level } }
    
    static func random(name: String, location: Location) -> Character {
        let race = Race.allCases.randomElement()!
        let attributes = Attributes.roll().adding(race.bonusAttributes)
        let classKind = Class.Kind.allCases.randomElement()!
        let maxHitPoints = classKind.hitPointsAtLevelOne + attributes.constitution.modifier
        var availableProficiencies = classKind.availableProficiencies
        availableProficiencies.shuffle()
        let equippedArmor = [
            Armor.Light.allCases.map { Armor.light($0) },
            Armor.Medium.allCases.map { .medium($0) },
            Armor.Heavy.allCases.map { .heavy($0) }
            ].flatMap { $0 }.filter { attributes.strength.base >= $0.requiredStrength }.randomElement()!
        return (0...1.d(2)).reduce(into: .init(
            name: name,
            title: nil,
            race: race,
            attributes: attributes,
            classes: [Class(kind: classKind, level: 1)],
            background: race.availableBackgrounds.randomElement()!,
            proficiencies: availableProficiencies.suffix(classKind.startingProficiencyCount),
            maxHitPoints: maxHitPoints,
            hitPoints: maxHitPoints,
            equippedArmor: equippedArmor,
            equippedWeapon: Weapon.allCases.randomElement()!,
            location: location
        )) { character, _ in character.levelUp() }
    }
    
    mutating func levelUp() {
        maxHitPoints += 1.d(startClass.kind.hitPointsAtLevelOne) + attributes.constitution.modifier
        hitPoints = maxHitPoints
        classes[0].level += 1
        // let multiclass: Class.Kind? = level >= 3 ? classes.first {
        //   attributes >= $0.requiredAttributesToMulticlass
        // } : nil
    }
    
    mutating func rest() {
        
    }
    
    mutating func longRest() {
        
    }
    
    var description: String {
        return """
        \(name), A level \(level) \(race) \(background.name)
        \(classes.map { "\($0)" }.joined(separator: ", "))
        \(String(repeating: "-", count: name.count))
        HP: \(hitPoints)/\(maxHitPoints)
        AC: \(armorClass) (\(equippedArmor))
        \(String(repeating: "-", count: name.count))
        \(attributes)
        \(String(repeating: "-", count: name.count))
        proficient in \(proficiencies.map { "\($0)" }.joined(separator: ", "))
        """
    }
    
    func rollDice(for skill: Skill) -> Int {
        let roll = 1.d(20)
        let modifier = attributes[keyPath: skill.attributeKeyPath].modifier
        let proficiency = proficiencies.contains(skill) ? ((level / 4) + 1) * 2 : 0
        let result = roll + modifier + proficiency
        print("\(name) rolled a \(result) (\(roll)\(modifier: modifier)\(modifier: proficiency)) for \(skill)")
        return result
    }
}
