import Foundation

public struct Person {
    
    var time: Int
    let position: Int
    
    public init(time: Int, position: Int) {
        self.time = time
        self.position = position
    }
    
    mutating func increaseTime() {
        self.time += 1
    }
}
