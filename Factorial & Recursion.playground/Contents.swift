import UIKit

func factorial(value: UInt) -> UInt {
    // linear performance
    if (value == 0) {
        return 1
    }
    var product: UInt = 1
    for i in 1...value {
        product *= i
    }
    return product
}

factorial(value: 5)

// to make recursion work we need closing value like
// below there is a closer with 0 1
func recursiveFactorialValue(value: UInt) -> UInt {
    if (value == 0) {
        return 1
    }
    return value * recursiveFactorialValue(value: value - 1)
}


recursiveFactorialValue(value: 5)
