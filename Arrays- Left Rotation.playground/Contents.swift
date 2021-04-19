import UIKit

var str = "Hello, HackerRank Array: Left Rotation"

// Complete the rotLeft function below.
func rotLeft(a: [Int], d: Int) -> [Int] {
    var returnArray: [Int] = a
    for _ in 1...d {
        if let firstElement = returnArray.first {
            returnArray.removeFirst()
            returnArray.insert(firstElement, at: returnArray.count)
        }
    }

    return returnArray
}

let arrayInput: [Int] = [1, 2, 3, 4, 5]
rotLeft(a: arrayInput, d: 4)

