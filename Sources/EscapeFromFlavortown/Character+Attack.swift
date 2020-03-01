enum AttackResult {
    case hit(damage: Int, isCritical: Bool)
    case miss
}

extension Character {
    func attack(_ target: inout Character, with weapon: Weapon) {
        print("\(name) \(weapon.damageType.attackVerb) their \(weapon) at \(target.name)")
        var result: AttackResult {
            let modifier = weapon.attackModifier(attributes: attributes)
            let attackRoll = 1.d(20)
            print("\(attackRoll)\(modifier: modifier) vs \(target.armorClass) AC")
            guard attackRoll + modifier >= target.armorClass else { return .miss }
            
            let isCritical = Int(attackRoll) == 20
            let roll = weapon.damage
            let critRoll = isCritical ? Int(weapon.damage) : 0
            if critRoll > 0 {
                print("CRIT damage!: (\(roll) + \(critRoll))\(modifier: modifier)")
            } else {
                print("damage: \(roll)\(modifier: modifier)")
            }
            return .hit(damage: roll + critRoll + modifier, isCritical: isCritical)
        }
        switch result {
        case let .hit(damage, isCritical):
            target.hitPoints -= damage
            print("\(target.name) is struck for \(damage)")
            if isCritical {
                let reaction = [
                    "'s eyes widen in horror",
                    " screams like a little bitch",
                    " squeals like a scared pig",
                    " yells out, 'PLEASE, NO!'",
                    ].randomElement()!
                let (bodyPart, result) = [
                    ("head", "A gaping laceration drips blood."),
                    ("left arm", "A severed finger thuds against the floor."),
                    ("right arm", "A loud crack is heard as their elbow inverts."),
                    ("foot", "\(target.name) falls to the ground in agony."),
                    ("chest", "*slice* blood squirts out as a nipple flies across the room."),
                    ("ear", "It is lopped in half and flys across the room.")
                    ].randomElement()!
                print("\(target.name)\(reaction) as the \(weapon) descends on their \(bodyPart). \(result)")
            }
            if target.hitPoints <= 0 {
                print("\(target.name) goes unconscious")
            }
        case .miss:
            print("\(name)'s strike barely misses.")
        }
        print("------------------")
    }
}
