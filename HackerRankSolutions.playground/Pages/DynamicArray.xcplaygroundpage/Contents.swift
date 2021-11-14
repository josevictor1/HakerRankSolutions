//: [Previous](@previous)

import Foundation

func dynamicArray(n: Int, queries: [[Int]]) -> [Int] {
    var array = Array(repeating: [Int](), count: n)
    var lastAnswer = 0
    var result = [Int]()
    queries.forEach { query in
        if query.first == 1 {
            let index = calculateIndex(size: n, lastAnswer: lastAnswer, input: query[1])
            array[index].append(query[2])
        } else {
            let index = calculateIndex(size: n, lastAnswer: lastAnswer, input: query[1])
            let length = array[index].count
            let secondIndex = query[2] % length
            lastAnswer = array[index][secondIndex]
            result.append(lastAnswer)
        }
    }
    return result
}

func calculateIndex(size: Int, lastAnswer: Int, input: Int) -> Int {
    (input ^ lastAnswer) % size
}

let queries = [[1, 0, 5],
               [1, 1, 7],
               [1, 0, 3],
               [2, 1, 0],
               [2, 1, 1]]

dynamicArray(n: 2, queries: queries)

//: [Next](@next)
