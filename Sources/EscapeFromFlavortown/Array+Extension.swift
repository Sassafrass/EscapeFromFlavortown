extension Array {
    func inserting(_ element: Element, at index: Index) -> Array {
        var copy = self
        copy.insert(element, at: index)
        return copy
    }

    func removing(at index: Index) -> Array {
        var copy = self
        copy.remove(at: index)
        return copy
    }
}
