import UIKit

let initialArray: [Int] = [0,1]

func fibonacciSimpleWay(numSteps: Int) -> [Int] {
    var sequence = [0,1]
    if (numSteps <= 1) {
        return sequence
    }
    for _ in 0...numSteps - 2 {
        let firstNumber = sequence[sequence.count - 2]
        let secondNumber = sequence.last!
        let numberToAdd = firstNumber + secondNumber
        sequence.append(numberToAdd)
    }
    return sequence
}

print(fibonacciSimpleWay(numSteps: 10))

func fibonacciRecursiveWayForNumberOfSteps(
    numSteps: Int,
    firstNumber: Int = 0,
    secondNumber: Int = 1
) -> [Int] {
    
    if (numSteps == 0) {
        return []
    }
    
    return [firstNumber + secondNumber] + fibonacciRecursiveWayForNumberOfSteps(
        numSteps: numSteps - 1,
        firstNumber: secondNumber,
        secondNumber: firstNumber + secondNumber
    )
    
}

initialArray + fibonacciRecursiveWayForNumberOfSteps(numSteps: 9)

