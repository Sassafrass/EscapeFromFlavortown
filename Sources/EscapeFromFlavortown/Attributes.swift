struct Attributes {
    var strength: Attribute
    var dexterity: Attribute
    var constitution: Attribute
    var intelligence: Attribute
    var wisdom: Attribute
    var charisma: Attribute
}

extension Attributes {
    struct Attribute: CustomStringConvertible {
        var base: Int
        var modifier: Int {
            return (base - 10) / 2
        }
        
        var description: String { 
            return modifier != 0 
                ? "\(base) (\(modifier: modifier))" 
                : "\(base)" 
        }
    }
}

extension Attributes {
    static func roll() -> Attributes {
        func roll() -> Attribute {
            return .init(base: Int(4.d(6).keep(3)))
        }
        
        return .init(
            strength: roll(),
            dexterity: roll(),
            constitution: roll(),
            intelligence: roll(),
            wisdom: roll(),
            charisma: roll()
        )
    }
    
    static func >= (lhs: Attributes, rhs: Class.Kind.AttributeRequirements) -> Bool {
        return rhs.requirements
            .map { lhs[keyPath: $0].base >= 13 }
            .reduce(true) { (try? rhs.op($0, $1)) ?? false }
    }
}

extension Attributes {
    typealias Bonus = (keyPath: WritableKeyPath<Attributes, Attribute>, amount: Int)
    
    func adding(_ bonuses: [Bonus]) -> Attributes {
        var attributes = self
        for bonus in bonuses {
            attributes[keyPath: bonus.keyPath].base += bonus.amount
        }
        return attributes
    }
}

extension Attributes: CustomStringConvertible {
    var description: String {
        return """
        STR: \(strength)
        DEX: \(dexterity)
        CON: \(constitution)
        INT: \(intelligence)
        WIS: \(wisdom)
        CHA: \(charisma)
        """
    }
}
