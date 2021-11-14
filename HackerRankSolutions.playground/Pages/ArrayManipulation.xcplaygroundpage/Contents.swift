//: [Previous](@previous)

import Foundation

func arrayManipulation(n: Int, queries: [[Int]]) -> Int {
    let offsets = arrayOffsets(forQueries: queries)
    return calculateMaximumValueForArray(withSize: n, andIntervalOffsets: offsets)
}

private func arrayOffsets(forQueries queries: [[Int]]) -> [Int: Int] {
    var offsets = [Int: Int]()
    queries.forEach { let startIndex = $0[0] - 1, endIndex = $0[1], queryOffset = $0[2]
        offsets[startIndex] = (offsets[startIndex] ?? 0) + (queryOffset)
        offsets[endIndex] = (offsets[endIndex] ?? 0) - (queryOffset)
    }
    return offsets
}

private func calculateMaximumValueForArray(withSize size: Int, andIntervalOffsets intervalOffsets: [Int: Int]) -> Int {
    var array = Array(repeating: 0, count: size)
    var currentOffset = 0
    var maxValue = 0
    for index in (0..<size) {
        currentOffset += (intervalOffsets[index] ?? 0)
        array[index] += currentOffset
        if maxValue < array[index] {
            maxValue = array[index]
        }
    }
    return maxValue
}

//: [Next](@next)

let n = 10
let queries = [[1,5,3], [4,8,7],[6,9,1]]

arrayManipulation(n: n, queries: queries)
