//: [Previous](@previous)

import Foundation

func minimumSwaps(array: [Int]) -> Int {
    var arrayMutableCopy = array
    var indexReferenceDictionary = createIndexReferenceDictionary(forArray: array)
    var numberOfSwaps = 0
    (1...array.count).enumerated().forEach { (index, element)  in
        guard element != arrayMutableCopy[index] else { return }
        let currentIndex = indexReferenceDictionary[element]!
        indexReferenceDictionary.swapValues(element, arrayMutableCopy[index])
        arrayMutableCopy.swapAt(index, currentIndex)
        numberOfSwaps += 1
    }
    return numberOfSwaps
}

func createIndexReferenceDictionary(forArray array: [Int]) -> [Int: Int] {
    var indexReferenceDictionary = [Int: Int]()
    array.enumerated().forEach { (index, element) in
        indexReferenceDictionary[element] = index
    }
    return indexReferenceDictionary
}

extension Dictionary {
    
    mutating func swapValues(_ firsElementKey: Key, _ secondElementKey: Key) {
        let firstElementValue = self[firsElementKey]
        self[firsElementKey] = self[secondElementKey]
        self[secondElementKey] = firstElementValue
    }
}

let test = [4, 3, 1, 2]
minimumSwaps(array: test)
