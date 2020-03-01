struct Room {
    let size = Int.random(in: 0...40) + 40
    
    var randomLocation: Location {
        return .init(rawValue: Int.random(in: 0..<size))
    }
}

struct Location {
    var rawValue: Int
    
    func distance(to location: Location, in room: Room) -> Int {
        var difference = abs(rawValue - location.rawValue)
        if difference > room.size / 2 {
            difference = room.size - difference
        }
        return difference
    }
}
