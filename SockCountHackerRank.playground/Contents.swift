import UIKit

//There is a large pile of socks that must be paired by color. Given an array of integers representing the color of each sock, determine how many pairs of socks with matching colors there are.
//
//Example
//
//
//There is one pair of color  and one of color . There are three odd socks left, one of each color. The number of pairs is .
//
//Function Description
//
//Complete the sockMerchant function in the editor below.
//
//sockMerchant has the following parameter(s):
//
//int n: the number of socks in the pile
//int ar[n]: the colors of each sock
//Returns
//
//int: the number of pairs
//Input Format
//
//The first line contains an integer , the number of socks represented in .
//The second line contains  space-separated integers, , the colors of the socks in the pile.
//
//Constraints
//
// where
//Sample Input
//
//STDIN                       Function
//-----                       --------
//9                           n = 9
//10 20 20 10 10 30 50 10 20  ar = [10, 20, 20, 10, 10, 30, 50, 10, 20]



import Foundation


var ar = [10, 20, 20, 10, 10, 30, 50, 10, 20,10, 20, 20, 10, 10, 30, 21, 22, 23]
// Complete the sockMerchant function below.
func sockMerchant(n: Int, ar: [Int]) -> Int {
    
    var sockCount = [Int: Int]()
    for (index,sockColor) in ar.enumerated() {
        if let count = sockCount[sockColor] {
            sockCount[sockColor] = count +  1
        } else {
            sockCount[sockColor] = 1
        }
    }
    
    var numberOfPairs: Int = 0
    for key in sockCount.keys {
        var socks: Int = sockCount[key] ?? 0
        if (socks % 2 != 0) {
            while (socks % 2 == 0) {
                socks -= 1
            }
        }
        numberOfPairs += (socks / 2)
    }
    
    return numberOfPairs
}

sockMerchant(n: 18, ar: ar)




