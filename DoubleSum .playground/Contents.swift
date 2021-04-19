import UIKit

var str = "Hello, Double Sum"
// two consecutive array element
// otherwise done using i and j
func twoSum(
    _ nums: [Int],
    _ target: Int
) -> [Int] {
    var output: [Int] = [Int]()
    
    outerLoop: for (index,num) in nums.enumerated() {
        innerLoop: for jIndex in index + 1...nums.count - 1 {
            if (
                num + nums[jIndex] == target
            ) {
                output = [index, jIndex]
                break innerLoop
            }
        }
        if (output.count > 0) {
            break outerLoop
        }
    }
    
    return output
}


let nums = [2,7,11,15]
let target = 22
twoSum(nums, target)
