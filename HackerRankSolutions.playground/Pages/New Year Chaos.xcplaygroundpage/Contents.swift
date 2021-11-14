// Based on editorial
// - TODO: See Inversions

let test = [2, 1, 5, 3, 4]
let test1 = [2, 5, 1, 3, 4]

func minimumBribes(forPersons persons: [Int]) {
    let numberOfPersons = persons.count
    var mutablePersonsCollection = persons
    var comparisonCounter: Int = 0
    
    for index in stride(from: numberOfPersons - 1, through: 0, by: -1) {
        let currentPersonNumber = index + 1
        guard mutablePersonsCollection[index] != currentPersonNumber else { continue }
        if index - 1 >= 0,
           mutablePersonsCollection[index - 1] == currentPersonNumber {
            comparisonCounter += 1
            mutablePersonsCollection.swapAt(index - 1, index)
        } else if index - 2 >= 0,
                  mutablePersonsCollection[index - 2] == currentPersonNumber {
            comparisonCounter += 2
            mutablePersonsCollection[index - 2] = mutablePersonsCollection[index - 1]
            mutablePersonsCollection[index - 1] = mutablePersonsCollection[index]
            mutablePersonsCollection[index] = currentPersonNumber
        } else {
            return print("Too chaotic")
        }
    }
    print(comparisonCounter)
}

minimumBribes(forPersons: test)
minimumBribes(forPersons: test1)
