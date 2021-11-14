import Foundation

public struct Queue<T> {
    
    fileprivate var array = [T]()
    
    public init() {}
    
    public var isEmpty: Bool {
        array.isEmpty
    }
    
    public var count: Int {
        array.count
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        isEmpty ? nil : array.removeFirst()
    }
    
    public var front: T? {
        array.first
    }
    
}
