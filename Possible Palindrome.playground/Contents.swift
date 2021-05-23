import UIKit

var str = "Hello, playground find all possible string that are palindrome"
print(str)

func allPalinfromPartitions(
    string: String
){
    let n = string.count
    // to store palindromic partition
    var allParts: [String] = [String]()
    // to store current palindromic partition
    var currentParts: [String] = [String]()
    // calling recursive function to store
    // all palindromic parts in all parts
    allPalindromePartUtils(
        allParts: &allParts,
        currentParts: &currentParts,
        start: 0,
        n: n,
        string: string
    )
    
    for i in 0..<allParts.count {
        let arri = Array(allParts[i])
        print("\(arri) ")
    }
    
}


// below function is recursive function to find
// all of the palindrome partition of string[start...n-1]
// allParts: all of the possible parts of the particular string itself.
// currentParts: a vector of the string to store the current partition
func allPalindromePartUtils(
    allParts: inout [String],
    currentParts: inout [String],
    start: Int,
    n: Int,
    string: String
) {
    let stringArray = Array(string)
    // If start has reached the length
    if (start >= n) {
        allParts.append(contentsOf: currentParts)
        return
    }
    
    // picking all possible ending point for the sub string
    for i in start..<n {
        if (isPalindrome(string: string, low: start, high: i)) {
            if (i + 1 < string.count) {
                var appendString: String = ""
                for i in stringArray[start..<i+1] {
                    appendString += String(i)
                }
                // add the substring to result
                currentParts.append(appendString)
                // recur for remaining remaining substring
                allPalindromePartUtils(
                    allParts: &allParts,
                    currentParts: &currentParts,
                    start: i + 1,
                    n: n,
                    string: string
                )
                // remove substring str[start...i]
                // from current partition remove that string
                currentParts.popLast()
            } else if (i + 1 == string.count) {
                // try to recur for remaining remaining substring
                allPalindromePartUtils(
                    allParts: &allParts,
                    currentParts: &currentParts,
                    start: i + 1,
                    n: n,
                    string: string
                )
            }
        }
    }
}


// a function to check
// wether the string is palindrome
// or not.
func isPalindrome(
    string: String,
    low: Int,
    high: Int
) -> Bool {
    let string = Array(string)
    var low = low
    var high = high
    while (low < high) {
        if (string[low] != string[high]) {
            return false
        }
        low += 1
        high -= 1
    }
    return true
}


allPalinfromPartitions(string: "nitin")
