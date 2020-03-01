extension String.StringInterpolation {
    mutating func appendInterpolation(modifier: Int) {
        guard modifier != 0 else { return }
        
        appendInterpolation("\(modifier > 0 ? "+" : "")\(modifier)")
    }
}
