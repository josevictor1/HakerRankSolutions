//import Foundation
//
////2. Turnstile
////A university has exactly one turnstile. It can be used either as an exit or an entrance. Unfortunately, sometimes many people want to pass through the turnstile and their directions can be different. The ith person comes to the turnstile at time[i] and wants to either exit the university if direction[i] = 1 or enter the university if direction[i] = 0.   People form 2 queues, one to exit and one to enter. They are ordered by the time when they came to the turnstile and, if the times are equal, by their indices.
////
////If some person wants to enter the university and another person wants to leave the university at the same moment, there are three cases:
////
////If in the previous second the turnstile was not used (maybe it was used before, but not at the previous second), then the person who wants to leave goes first.
////If in the previous second the turnstile was used as an exit, then the person who wants to leave goes first.
////If in the previous second the turnstile was used as an entrance, then the person who wants to enter goes first.
////Passing through the turnstile takes 1 second.
////
////For each person, find the time when they will pass through the turnstile.
////
////Function Description
////
////Complete the function getTimes in the editor below. The function must return an array of n integers where the value at index i is the time when the ith person will pass the turnstile.
////
////getTimes has the following parameters:
////
////    time:  an array of n integers where the value at index i is the time in seconds when the ith person will come to the turnstile
////
////    direction:  an array of n integers where the value at index i is the direction of the ith person
////
////Constraints
////
////1 ≤ n ≤ 105
////0 ≤ time[i] ≤ 109  for 0 ≤ i ≤ n - 1
////time[i] ≤ time[i + 1]  for 0 ≤ i ≤ n - 2
////0 ≤ direction[i] ≤ 1  for 0 ≤ i ≤ n - 1
////Input Format For Custom Testing
////Locked stub code reads input from stdin and passes it to the function.
////
////
////The first line contains an integer, n, denoting the number of persons, the number of time values and the number of direction values.
////
////Each of the next n lines contains an integer time[i].
////
////The next line contains n.
////
////Each of the next n lines contains an integer direction[i].
//
//// in 0
//// exit 1
//
//// leave goes first
//// if time[n] - time[n - 1] > 1 then turnstyle goes first
//
//// if time[n - 1] == 1 then
//// if time[n - 1] == time[n]
//// then leave goes first
//
//// if time[n - 1] == 0 then
//// if time[n - 1] == time[n]
//// then enter go first
//
//// passing through the turnstile takes 1 second
//// pass turnstile == time += 1
//
//// find the time when each pearson will pass
//
//// In |||||  -  Out |||||
//
////let time =      [0, 1 ,1, 3, 3]
////let direction = [0, 1, 0, 0, 1]
//
////At time 0, persons 0 and 1 want to pass through the turnstile. Person 0 wants to enter the university and person 1 wants to leave the university. The turnstile was not used in the previous second, so the priority is on the side of the person 1.
////At time 1, persons 0 and 2 want to pass through the turnstile. Person 2 wants to leave the university and at the previous second the turnstile was used as an exit, so the person 2 passes through the turnstile.
////At time 2, person 0 passes through the turnstile.
////At time 5, person 3 passes through the turnstile.
//
////let n = 5
//let test = [[[10],[1],[10]],
//[[0,0,0],[0,0,1],[1,2,0]],
//[[0,0,1,5],[0,1,1,0],[2,0,1,5]],
//[[0,0],[0,1],[1,0]],
//[[0,0],[1,1],[0,1]],
//[[0,0],[1,0],[0,1]],
//[[4,4],[0,1],[5,4]],
//[[0,0,0],[0,1,1],[2,0,1]],
//[[0,0,0],[0,0,0],[0,1,2]],
//[[0,0,0,0],[0,1,1,1],[3,0,1,2]],
//[[0,0,0,5],[0,1,1,1],[2,0,1,5]],
//[[0,1,1,3,3],[0,1,0,0,1],[0,2,1,4,3]],
//[[0,1,1,3,3],[0,1,1,0,1],[0,1,2,4,3]],
//[[0,1,1,6,7],[0,1,1,0,1],[0,1,2,6,7]],
//[[0,1,1,3,6],[0,1,1,0,1],[0,1,2,3,6]],
//[[0,0,1,5],[0,1,1,0],[2,0,1,5]],
//[[0,1,1,3,3],[0,1,0,0,1],[0,2,1,4,3]]]
//
//let time: [Int] = [0,1,1,3,3]
//let direction: [Int] = [0,1,1,0,1]
//
//public class Entrance {
//
//    private var enterQueue = Queue<Person>()
//    private var leaveQueue = Queue<Person>()
//    private var resultantTime: [Int] = []
//    private var currentTime: Int = 0
//
//    public init(time: [Int], direction: [Int]) {
//        resultantTime = time
//        setUpQueues(with: time, and: direction)
//    }
//
//    private func setUpQueues(with time: [Int], and direction: [Int]) {
//        time.indices.forEach { index in
//            guard let direction = Direction(rawValue: direction[index]) else { return }
//            let person = Person(time: time[index], position: index)
//            switch direction {
//            case .enter:
//                enterQueue.enqueue(person)
//            case .leave:
//                leaveQueue.enqueue(person)
//            }
//        }
//    }
//
//    public func entranceHistoryTime() -> [Int] {
//
//        print(enterQueue)
//        print(leaveQueue)
//
//        return []
//    }
//
//}
//
//func getTimes(time: [Int], direction: [Int]) -> [Int] {
//
//    let entrance = Entrance(time: time, direction: direction)
//
//    return entrance.entranceHistoryTime()
//}
//
//var testFinalResult = [Bool]()
//
//for (index, element) in test.enumerated() {
//    print()
//    print("+++++++++++++++++")
//
//    let result = getTimes(time: element[0], direction: element[1])
//    let approved = result == element[2]
//
//    print("Approved = \(approved ? "TRUE" : "FALSE")")
//
//    testFinalResult.append(approved)
//
//    if !approved {
//        print("TIME: \(element[0])")
//        print("DIRECTION: \(element[1])")
//    }
//
//    print("Result \(index): \(result), expected: \(element[2])")
//}
//print("----------")
//
//
//testFinalResult.enumerated().forEach { index,result in
//    print("Test \(index) : \(result)")
//}
//


//func fizzBuzz(n: Int) -> Void {
//    // Write your code here
//
//    for i in 1...n {
//        let threeMultiple = i % 3 == 0
//        let fiveMultitple = i % 5 == 0
//
//
//        if  threeMultiple && fiveMultitple  {
//            print("FizzBuzz")
//        } else if fiveMultitple {
//            print("Buzz")
//        } else if threeMultiple {
//            print("Fizz")
//        } else {
//            print(i)
//        }
//    }
//
//
//}
//
//fizzBuzz(n: 7)


//func newPassword(a: String, b: String) -> String {
//
//    guard !a.isEmpty else { return b }
//    guard !b.isEmpty else { return a }
//
//    var listA : [Character] = Array(a).reversed()
//    var listB : [Character] = Array(b).reversed()
//
//    var newPassword: [Character] = []
//
//    while !listA.isEmpty || !listB.isEmpty {
//
//        if let lastA = listA.popLast() {
//            newPassword.append(lastA)
//        }
//
//        if let lastB = listB.popLast() {
//            newPassword.append(lastB)
//        }
//    }
//
//    return String(newPassword)
//}
//
//newPassword(a: "hackerrank", b: "mountain") == "hmaocuknetrariannk"

//
//func getMin(s: String) -> Int {
//    let convertedS = Array(s)
//
//    var counter: Int = 0
//
//
//    convertedS.forEach { parenteses in
//        if parenteses == ")" {
//            counter += 1
//        } else {
//            counter -= 1
//        }
//    }
//
//    return counter
//}
//
//getMin(s: "()))")


var ateste = ""

var completion: () -> Void = { 
    print(ateste)
}

ateste = "asdf"
completion()

//
//var result = 1
//
//result -= 1
