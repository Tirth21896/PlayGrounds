import UIKit

var str = "Hello, Higher Order Functions"


// sorted

let number: [Int] = [0,2,1,3,0,7,4,3,2,6,9,3,8,3,55,9,4,90]
let acendingNumber = number.sorted()
let decendingNumber = number.sorted(by: >)

number
acendingNumber
decendingNumber


// map
// since array is generic you can return anything

let stringNumber = number.map { (num) -> String in
    return String(num)
}
stringNumber.sorted()
stringNumber.sorted(by: >)

let stringNumberq = number.compactMap { (num) -> String? in
    return String(num)
}
// flat map
// it does flattens the sequence.
// reduce
// foreach
// split
// contains
// many more.
