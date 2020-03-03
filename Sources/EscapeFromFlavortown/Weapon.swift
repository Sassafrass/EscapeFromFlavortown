enum DamageType {
    case slashing, bludgening, piercing, necrotic, poison, acid, cold, fire, force, lightning, psychic, radiant, thunder
    
    var attackVerb: String {
        switch self {
        case .slashing:
            return "swings"
        case .piercing:
            return "stabs"
        case .bludgening:
            return "slams"
        case .necrotic, .poison, .acid, .cold, .fire, .force, .lightning, .psychic, .radiant, .thunder:
            return "casts"
        }
    }
}

public enum Weapon: CaseIterable {
    enum Kind {
        case simple, martial
    }
    
    case handAxe, dagger
    
    var meleeRange: ClosedRange<Int>? {
        switch self {
        case .handAxe, .dagger: 
            return 0...5
        }
    }
    
    var rangedRange: ClosedRange<Int>? {
        switch self {
        case .handAxe:
            return nil
        case .dagger:
            return 20...60
        }
    }
    
    var damageType: DamageType {
        switch self {
        case .handAxe:
            return .slashing
        case .dagger:
            return .piercing
        }
    }
    
    var damage: Roll {
        switch self {
        case .handAxe: return 1.d(6)
        case .dagger: return 1.d(4)
        }
    }
    
    var kind: Kind {
        switch self {
        case .handAxe, .dagger: 
            return .simple
        }
    }
    
    var hasFinesse: Bool {
        switch self {
        case .handAxe:
            return false
        case .dagger:
            return true
        }
    }
    
    var isRanged: Bool {
        switch self {
        case .handAxe, .dagger:
            return false
        }
    }
    
    func attackModifier(attributes: Attributes) -> Int {
        var modifierKeyPaths: [KeyPath<Attributes, Attributes.Attribute>] {
            switch (hasFinesse, isRanged) {
            case (true, _): return [\.strength, \.dexterity]
            case (false, true): return [\.dexterity]
            case (false, false): return [\.strength]
            }
        }
        return modifierKeyPaths.map { attributes[keyPath: $0].modifier }.max() ?? 0
    }
}

extension Weapon: CustomStringConvertible {
    public var description: String {
        switch self {
        case .handAxe:
            return "hand axe"
        case .dagger:
            return "dagger"
        }
    }
}
