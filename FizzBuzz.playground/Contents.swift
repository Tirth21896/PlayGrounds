import UIKit

// 1 to 20
// any number divisible by 3 - fizz
// any number divisible by 5 - buzz
// any number by both - fizz buzz

var numbers: [Int] = [Int]()
for i in 1...70 {
    numbers.append(i)
}

for num in numbers {
    if (num % 14 == 0) {
        print("\(num) fizzbuzz")
    } else if (num % 2 == 0) {
        print("\(num) fizz")
    } else if (num % 7 == 0) {
        print("\(num) buzz")
    } else {
        print("\(num)")
    }
}
