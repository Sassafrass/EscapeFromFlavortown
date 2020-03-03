public enum Skill: CaseIterable {
    case athletics
    case acrobatics, sleightOfHand, stealth
    case arcana, history, investigation, nature, religion
    case animalHandling, insight, medicine, perception, survival
    case deception, intimidation, performance, persuasion
}

// level 1-4 (+2)

extension Skill {
    var attributeKeyPath: WritableKeyPath<Attributes, Attributes.Attribute> {
        switch self {
        case .athletics: return \.strength
        case .acrobatics: return \.dexterity
        case .sleightOfHand: return \.dexterity
        case .stealth: return \.dexterity
        case .arcana: return \.intelligence
        case .history: return \.intelligence
        case .investigation: return \.intelligence
        case .nature: return \.intelligence
        case .religion: return \.intelligence
        case .animalHandling: return \.wisdom
        case .insight: return \.wisdom
        case .medicine: return \.wisdom
        case .perception: return \.wisdom
        case .survival: return \.wisdom
        case .deception: return \.charisma
        case .intimidation: return \.charisma
        case .performance: return \.charisma
        case .persuasion: return \.charisma
        }
    }
}
