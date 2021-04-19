import UIKit

/*
Your previous Plain Text content is preserved below:

# Given an array of integers (populated by a random number generator) and a target value, return true if two numbers picked from the array can be added to be the target value
# Example: [1,3,5,6,-1,1,4], target: 8, return should be true (3+5 == 8)


 */

let array: [Int] = [1,3,5,6,-1,1,4]

func checkSum(array: [Int], target: Int) -> Bool {
    var wasAbleToSumToTarget: Bool = false
    
    for (index, item) in array.enumerated() {
        if (index + 1 < array.count) {
            for jIndex in index + 1...array.count - 1 {
                if (item + array[jIndex] == target) {
                    wasAbleToSumToTarget = true
                    break
                }
            }
        }
    }
    
    return wasAbleToSumToTarget
}

checkSum(array: array, target: 12)
