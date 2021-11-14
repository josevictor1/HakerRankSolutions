//: [Previous](@previous)

import Foundation

func rotateLeft(d: Int, arr: [Int]) -> [Int] {
    let arrLength = arr.count
    var result = arr
    (0..<arrLength).forEach {
        let index = abs(arrLength + $0 - d) % arrLength
        result[index] = arr[$0]
    }
    return result
}

//: [Next](@next)

let numberOfRotation = 2
let sample1 = [1, 2, 3, 4, 5]

rotateLeft(d: numberOfRotation, arr: sample1)
