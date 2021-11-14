import Foundation


public func createQueues(from time: [Int], and direction: [Int]) -> (enter: [Int], leave: [Int]) {
    
    var leaveQueue = [Int]()
    var enterQueue = [Int]()
    
    for index in time.indices {
        if direction[index] == 0 {
            enterQueue.append(index)
        } else {
            leaveQueue.append(index)
        }
    }
    
    return (enterQueue, leaveQueue)
}

public func solution1(time: [Int], direction: [Int]) -> [Int] {
    
    var resultantTime = time
    
    let queues = createQueues(from: time, and: direction)
    
    var enterQueue = queues.enter
    var leaveQueue = queues.leave
    
    var currentDirection: Direction = .leave
    
    var currentTime = 0
    
    if let firstEnter = enterQueue.first, let firstLeave = leaveQueue.first {
        currentTime = min(resultantTime[firstEnter], resultantTime[firstLeave])
    }
    
    func increaseTime(at index: Int) {
        if resultantTime[index] <= currentTime {
            resultantTime[index] = currentTime
        } else if currentTime < resultantTime[index] {
            currentTime = resultantTime[index]
        }
    }
    
    func isPersonArraived(person: Int) -> Bool {
        resultantTime[person] == currentTime ? true : false
    }
    
    while !enterQueue.isEmpty || !leaveQueue.isEmpty {
        
        if !enterQueue.isEmpty && leaveQueue.isEmpty {
            enterQueue.removeFirst()
            guard let index = enterQueue.first else { break }
            currentTime += 1
            increaseTime(at: index)
        } else if enterQueue.isEmpty && !leaveQueue.isEmpty {
            leaveQueue.removeFirst()
            guard let index = leaveQueue.first else { break }
            currentTime += 1
            increaseTime(at: index)
        } else if resultantTime[enterQueue.first!] == resultantTime[leaveQueue.first!] {
            switch currentDirection {
            case .enter:
                enterQueue.removeFirst()
                let leaveIndex = leaveQueue.first!
                currentTime += 1
                increaseTime(at: leaveIndex)
                if let enterIndex = enterQueue.first, resultantTime[enterIndex] <= currentTime {
                    increaseTime(at: enterIndex)
                }
            case .leave:
                leaveQueue.removeFirst()
                let index = enterQueue.first!
                currentTime += 1
                increaseTime(at: index)
                if let leaveIndex = leaveQueue.first, resultantTime[leaveIndex] <= currentTime {
                    increaseTime(at: leaveIndex)
                }
            }
        } else if resultantTime[enterQueue.first!] < resultantTime[leaveQueue.first!] {
            enterQueue.removeFirst()
            let index = leaveQueue.first!
            currentTime += 1
            if isPersonArraived(person: index) {
                increaseTime(at: index)
            }
            if let enterIndex = enterQueue.first, resultantTime[enterIndex] <= currentTime {
                increaseTime(at: enterIndex)
            }
            currentDirection = .enter
        } else {
            leaveQueue.removeFirst()
            let index = enterQueue.first!
            currentTime += 1
            if isPersonArraived(person: index) {
                increaseTime(at: index)
            }
            if let leaveIndex = leaveQueue.first, resultantTime[leaveIndex] <= currentTime {
                increaseTime(at: leaveIndex)
            }

            currentDirection = .leave
        }
        
    }

    return resultantTime
}
