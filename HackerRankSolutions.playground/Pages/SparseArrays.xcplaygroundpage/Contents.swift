//: [Previous](@previous)

import Foundation

func matchingStrings(strings: [String], queries: [String]) -> [Int] {
    var counting = [String: Int]()
    strings.forEach { counting[$0] = 1 + (counting[$0] ?? 0) }
    return queries.map { counting[$0] ?? 0 }
}

let strings = ["ab", "ab", "abc"]
let queries = ["ab", "abc", "bc"]

matchingStrings(strings: strings, queries: queries)

//: [Next](@next)
