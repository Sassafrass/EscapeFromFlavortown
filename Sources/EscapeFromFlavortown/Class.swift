public struct Class: Hashable, CustomStringConvertible {
    enum Kind: String, CaseIterable { 
        case barbarian, fighter, wizard, rogue, cleric, druid, ranger 
    }
    let kind: Kind
    var level: Int
    
    public var description: String {
        return "\(kind) (\(level))"
    }
}

extension Class.Kind {
    struct AttributeRequirements {
        typealias RequirementKeyPath = KeyPath<Attributes, Attributes.Attribute>
        let op: (Bool, @autoclosure () throws -> Bool) throws -> Bool
        let requirements: [RequirementKeyPath]
        
        static func any(_ requirements: RequirementKeyPath...) -> AttributeRequirements {
            return .init(op: ||, requirements: requirements)
        }
        
        static func all(_ requirements: RequirementKeyPath...) -> AttributeRequirements {
            return .init(op: &&, requirements: requirements)
        }
    }
    
    var requiredAttributesToMulticlass: AttributeRequirements {
        switch self {
        case .barbarian:
            return .any(\.strength)
        case .fighter:
            return .any(\.strength, \.dexterity)
        case .wizard:
            return .any(\.intelligence)
        case .rogue:
            return .any(\.dexterity)
        case .cleric, .druid:
            return .any(\.wisdom)
        case .ranger:
            return .all(\.dexterity, \.wisdom)
        }
    }
    
    var availableProficiencies: [Skill] {
        switch self {
        case .barbarian: return [.animalHandling, .athletics, .intimidation, .nature, .perception, .survival]
        case .fighter: return [.acrobatics, .animalHandling, .athletics, .history, .insight, .intimidation, .perception, .survival]
        case .wizard: return [.arcana, .history, .insight, .investigation, .medicine, .religion]
        case .rogue: return [.acrobatics, .athletics, .deception, .insight, .intimidation, .investigation, .perception, .performance, .persuasion, .sleightOfHand, .stealth]
        case .cleric: return [.history, .insight, .medicine, .persuasion, .religion]
        case .druid: return [.arcana, .animalHandling, .insight, .medicine, .nature, .perception, .religion, .survival]
        case .ranger: return [.animalHandling, .athletics, .insight, .investigation, .nature, .perception, .stealth, .survival]
        }
    }
    
    var startingProficiencyCount: Int {
        switch self {
        case .barbarian, .fighter, .wizard, .cleric, .druid: 
            return 2
        case .ranger:
            return 3
        case .rogue: 
            return 4
        }
    }
    
    var hitPointsAtLevelOne: Int {
        switch self {
        case .barbarian:
            return 12
        case .fighter, .wizard, .rogue, .cleric, .druid, .ranger:
            return 10
        }
    }
}
