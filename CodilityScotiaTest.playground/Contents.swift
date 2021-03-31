import UIKit
import Foundation



public func solution(_ N : Int) -> Int {
    let numberParts = String(N).components(separatedBy: "-")
    var isMinusValue: Bool = false
    guard var numberString: String = numberParts.last
    else {
        return N
    }
    if (numberParts.count > 1) {
        isMinusValue = true
    }
    var maxValueNumber: Int = N
    var numberIndexToChange: Int = 0
    if let element = numberString.enumerated().first(where:  {Int($0.element.description) ?? 0 < 5}) {
        numberIndexToChange = element.offset
    }
    
    if (numberIndexToChange > 0) {
        numberString.insert("5", at: numberString.index(numberString.startIndex, offsetBy: numberIndexToChange))
    } else {
        numberString.insert("5", at: numberString.index(numberString.startIndex, offsetBy: numberIndexToChange))
    }
    if (isMinusValue) {
        numberString.insert("-", at: numberString.startIndex)
    }
    if let numberValue =  Int(numberString)
    {
        maxValueNumber = numberValue
    }
    return maxValueNumber
}

solution(268)

