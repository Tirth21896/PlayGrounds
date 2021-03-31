import UIKit
var array: [Int] = [Int]()
for i in 1...1000 {
    array.append(i)
}
array.count
func binarySearchAlgoFind(
    array: [Int],
    elementToFind: Int
) -> Bool {
    var startIndex: Int = 0
    var endIndex: Int = array.count - 1
    while (startIndex <= endIndex) {
        let midIndex: Int = (endIndex + startIndex) / 2
        let middleValue = array[midIndex]
        if (middleValue == elementToFind) {
            return true
        }
        if (elementToFind < middleValue) {
            endIndex = midIndex - 1
        } else {
            startIndex = midIndex + 1
        }
    }
    return false
}
func searchAlgoFind(
    array: [Int],
    elementToFind: Int
) -> Bool {
    var counter = -1
    for element in array {
        counter += 1
        if (element == elementToFind) {
            return true
        }
    }
    return false
}

print(searchAlgoFind(array: array, elementToFind: 478))
print(binarySearchAlgoFind(array: array, elementToFind: 478))
