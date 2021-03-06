public struct Room {
    let size: Int

    public init(size: Int = Int.random(in: 0...40) + 40) {
        self.size = size
    }
    
    public var randomLocation: Location {
        return .init(rawValue: Int.random(in: 0..<size))
    }
}

public struct Location {
    var rawValue: Int
    
    func distance(to location: Location, in room: Room) -> Int {
        var difference = abs(rawValue - location.rawValue)
        if difference > room.size / 2 {
            difference = room.size - difference
        }
        return difference
    }
}
