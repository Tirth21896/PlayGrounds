import UIKit

var sampleString: String = "I am ironman, I am cooler than you think I am because you don't know."
func reverseEveryOtherWord(
    string: String
) -> String {
    let parts = string.components(separatedBy: " ")
    var newString = ""
    for (index,word) in parts.enumerated() {
        if (newString != "") {
            newString += " "
        }
        if (index % 2 == 1) {
            newString.append(String(word.reversed()))
        } else {
            newString += word
        }
    }

    return newString
}

reverseEveryOtherWord(string: sampleString)
