import UIKit

//Given a set of distinct positive integers, find the largest subset such that every pair of elements in the subset (i, j) satisfies either i % j = 0 or j % i = 0.
//
//For example, given the set [3, 5, 10, 20, 21], you should return [5, 10, 20]. Given [1, 3, 6, 24], return [1, 3, 6, 24].

func getLargestSubSet(array: [Int]) -> [Int] {
    var arrayToReturn: [Int] = [Int]()
    for (index, item) in array.enumerated() {
        if (index != (array.count - 1) && (item % array[index + 1] == 0 || array[index + 1] % item == 0)) {
            if (!arrayToReturn.contains(item)) {
                arrayToReturn.append(item)
            }
            if (!arrayToReturn.contains(array[index + 1])) {
                arrayToReturn.append(array[index + 1])
            }
        }
    }
    arrayToReturn.sorted()
    return arrayToReturn
}

var input = [1, 3, 6, 24]

getLargestSubSet(array: input)


