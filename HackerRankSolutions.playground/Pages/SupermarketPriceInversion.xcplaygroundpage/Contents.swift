// A subsequence is created by deleting zero or more elements from a list while maintaining the order. For example, the subsequences of [1,2,3] are [1], [2],[1,2], [1,3], [2,3], [1,2,3]. AJ has a list of prices in an array. He considers an inversion to be any time there is a strictly decreasing subsequance of length 3.
// More formally, given an array, p = [p[0], p[1], …, p[n-1]], he considers an inversion in the array to be any time some p[i] > p[j] > p[k] and i < j < k .

// Easy solution: (We will have time out here)
//
//let stdout = [4, 1, 3, 2, 5, 0]
let stdout = [5, 8, 6, 1, 4, 5]
//
//func maxInversions(prices: [Int]) -> Int {
//    var inversionsAmount = 0
//
//    for i in (0..<prices.count) {
//        for j in (i+1..<prices.count) {
//            for k in (j+1..<prices.count) {
//                if prices[i] > prices[j] && prices[j] > prices[k]{
//                    inversionsAmount += 1
//                }
//            }
//        }
//    }
//
//    return inversionsAmount
//}
//
//print(maxInversions(prices: stdout))

// Better solution

func maxInversions(prices: [Int]) -> Int {
    
    var inversionsAmount = 0
    let pricesLength = prices.count
    
    for priceIndex in (0..<pricesLength) {
        
        var smallerElements = 0
        var greatterElements = 0
        
        for index in (priceIndex + 1..<pricesLength) {
            if prices[priceIndex] > prices[index] {
                smallerElements += 1
            }
        }
        
        for index in stride(from: priceIndex - 1, through: 0, by: -1) {
            if prices[priceIndex] < prices[index] {
                greatterElements += 1
            }
        }
        
        inversionsAmount += greatterElements * smallerElements
    }
    
    return inversionsAmount
}

maxInversions(prices: stdout)
