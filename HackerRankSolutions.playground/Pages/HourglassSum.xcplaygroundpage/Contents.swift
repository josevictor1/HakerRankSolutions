//: [Previous](@previous)

import Foundation

func hourglassSum(arr: [[Int]]) -> Int {
    var maximumValue = Int.min
    for row in 0...3 {
        for column in 0...3 {
            let calculatedValue = calculateHourGlass(for: row, and: column, array: arr)
            if calculatedValue > maximumValue {
                maximumValue = calculatedValue
            }
        }
    }
    return maximumValue
}

func calculateHourGlass(for row: Int, and column: Int, array: [[Int]]) -> Int {
    let firstLine = array[row][column] + array[row][column + 1] + array[row][column + 2]
    let secondLine = array[row + 1][column + 1]
    let thirdLine = array[row + 2][column] + array[row + 2][column + 1] + array[row + 2][column + 2]
    return firstLine + secondLine + thirdLine
}

//: [Next](@next)
