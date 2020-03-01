func select<T>(_ message: String = "", options: [T], transform: (_ option: T) -> String) -> T {
    options.enumerated().forEach { print("\($0 + 1). \(transform($1))") }
    print(message, terminator: " ")
    
    while true {
        guard let optionIndex = readLine().flatMap(Int.init), options.indices.contains(optionIndex - 1) else { continue }
        
        return options[optionIndex - 1]
    }
}

func select<T>(_ message: String, options: [T]) -> T {
    return select(message, options: options) { "\($0)" }
}
