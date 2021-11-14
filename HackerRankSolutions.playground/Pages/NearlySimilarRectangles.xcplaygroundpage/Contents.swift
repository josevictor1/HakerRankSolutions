//: [Previous](@previous)

import Foundation

func nearlySimilarRectangles(sides: [[Int]]) -> Int {
    guard !sides.isEmpty, sides.count >= 2 else { return 0 }
    let ending = sides.count - 1
    var firstRectangleIndex = 0
    var secondRectangleIndex = 1
    var numberOfSimilarRectangles = 0
    while firstRectangleIndex != secondRectangleIndex && firstRectangleIndex < ending {
        if checkRectangleSimiarity(for: sides[firstRectangleIndex], and: sides[secondRectangleIndex]) {
            numberOfSimilarRectangles += 1
        }
        if secondRectangleIndex < ending {
            secondRectangleIndex += 1
        } else {
            firstRectangleIndex += 1
        }
    }
    return numberOfSimilarRectangles
}

func checkRectangleSimiarity(for firstRectangle: [Int], and secondRectangle: [Int]) -> Bool {
    (firstRectangle[0] % secondRectangle[0]) == (firstRectangle[1] % secondRectangle[1])
}


//: [Next](@next)
