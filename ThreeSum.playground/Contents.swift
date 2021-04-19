import UIKit

var str = "Hello, Three Sum"

//Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.
//
//Notice that the solution set must not contain duplicate triplets.

//Example 1:
//
//Input: nums = [-1,0,1,2,-1,-4]
//Output: [[-1,-1,2],[-1,0,1]]

//Example 2:
//
//Input: nums = []
//Output: []

//Example 3:
//
//Input: nums = [0]
//Output: []


func threeSum(_ nums: [Int]) -> [[Int]] {
    var output: [[Int]] = [[Int]]()
    var takenIndexes: [Int] = [Int]()
    
    for (index, number) in nums.enumerated() {
        var one = [Int]()
        one.append(number)
        for (jIndex, jNumber) in nums.enumerated() {
            if (number + jNumber) {
                
            }
        }
    }
    
    return output
}

 
