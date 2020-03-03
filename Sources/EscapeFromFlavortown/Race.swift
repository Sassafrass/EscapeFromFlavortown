public enum Race: String, CaseIterable {
    case human, elf, dwarf, halfOrc, halfElf, halfling, tiefling, gnome
}

extension Race {
    var availableBackgrounds: [Background] {
        var backgrounds = Background.Kind.allCases.map { Background(kind: $0) }
        switch self {
        case .human:
            break
        case .elf, .dwarf, .halfOrc, .halfling, .tiefling, .gnome, .halfElf:
            backgrounds.removeAll { $0.kind == .diplomat }
        }
        return backgrounds
    }
}

extension Race {
    var bonusAttributes: [Attributes.Bonus] {
        switch self {
        case .human: return [
            (\.strength, 1),
            (\.dexterity, 1),
            (\.constitution, 1),
            (\.intelligence, 1),
            (\.wisdom, 1),
            (\.charisma, 1),
            ]
        case .elf: return [
            (\.dexterity, 2)
            ]
        case .dwarf: return [
            (\.constitution, 2),
            ]
        case .halfOrc: return [
            (\.constitution, 1),
            (\.strength, 2),
            ]
        case .halfElf: return [
            (\.charisma, 2),
            (\.dexterity, 1)
            ]
        case .halfling: return [
            (\.dexterity, 2)
            ]
        case .tiefling: return [
            (\.charisma, 2),
            (\.intelligence, 1)
            ]
        case .gnome: return [
            (\.intelligence, 2)
            ]
        }
    }
}
