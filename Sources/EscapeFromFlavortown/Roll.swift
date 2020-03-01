extension Int {
    func d(_ diceSides: Int) -> Roll {
        return Roll(values: (0..<self).map { _ in Int.random(in: 1...diceSides) })
    }
    
    static func ...(lhs: Int, rhs: Roll) -> ClosedRange<Int> {
        return lhs...Int(rhs)
    }
    
    // static func +(lhs: Int, rhs: Roll) -> Int {
    //   return rhs + lhs
    // }
    
    init(_ roll: Roll) {
        self = roll.values.reduce(0, +)
    }
}

struct Roll: CustomStringConvertible {
    let values: [Int]
    
    var description: String {
        return "\(Int(self))"
    }
    
    static func +(lhs: Roll, rhs: Int) -> Int {
        return Int(lhs) + rhs
    }
    
    func keep(_ n: Int) -> Roll {
        var values = self.values
        values.sort()
        return Roll(values: Array(values.suffix(n)))
    }
}
