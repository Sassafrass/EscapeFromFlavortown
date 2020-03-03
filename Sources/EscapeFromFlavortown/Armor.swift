public enum Armor: CustomStringConvertible {
    public enum Light: CaseIterable { case leather, studded, padded }
    public enum Medium: CaseIterable { case hide, chainShirt, scaleMail, breastPlate, halfPlate }
    public enum Heavy: CaseIterable { case ringMail, chainMail, splint, plate }
    
    case light(Light), medium(Medium), heavy(Heavy)
    
    func baseClass(dexterityModifier: Int) -> Int {
        switch self {
        case .light(.padded): return 11 + dexterityModifier
        case .light(.leather): return 11 + dexterityModifier
        case .light(.studded): return 12 + dexterityModifier
        case .medium(.hide): return 12 + min(dexterityModifier, 2)
        case .medium(.chainShirt): return 13 + min(dexterityModifier, 2)
        case .medium(.scaleMail): return 13 + min(dexterityModifier, 2)
        case .medium(.breastPlate): return 14 + min(dexterityModifier, 2)
        case .medium(.halfPlate): return 15 + min(dexterityModifier, 2)
        case .heavy(.ringMail): return 14
        case .heavy(.chainMail): return 16
        case .heavy(.splint): return 17
        case .heavy(.plate): return 18
        }
    }
    
    var requiredStrength: Int {
        switch self {
        case .heavy(.chainMail): return 13
        case .heavy(.splint), .heavy(.plate): return 15
        case .light, .medium, .heavy(.ringMail): return 0
        }
    }
    
    public var description: String {
        switch self {
        case .light(.padded): return "padded"
        case .light(.leather): return "leather"
        case .light(.studded): return "studded leather"
        case .medium(.hide): return "hide"
        case .medium(.chainShirt): return "chain shirt"
        case .medium(.scaleMail): return "scale mail"
        case .medium(.breastPlate): return "breast plate"
        case .medium(.halfPlate): return "halfplate"
        case .heavy(.ringMail): return "ringmail"
        case .heavy(.chainMail): return "chainmail"
        case .heavy(.splint): return "splint"
        case .heavy(.plate): return "plate"
        }
    }
}
