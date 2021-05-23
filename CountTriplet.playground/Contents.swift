import UIKit

var str = "Hello, playground count triplet"

// find: number of triplets of indices
// -> elements at those indices are in / geometric progression for a given common ratio r and i<j<k.
func countTriplets(arr: [Int], r: Int) -> Int {
    // arr is array of integer
    // r is common ratio
    var numberOfTriplets: Int = 0
    // so we are going to use two dictionaries
    // one for tracking element's count in array
    // for example - how many times 9 repeats in array
    // another for tracking element's participation time in triplets
    // for example - how many times 9 was a part of one of the triplets
    var dictionary = [Int: Int]()
    var dictionaryPairs = [Int: Int]()
    
    // reversing the array will inscrese probablity of
    // getting higher value first and lower value last
    // as it can get easir if you have i*r of all of the value's
    // recorded first and then log through the part of it in
    // triplets
    for i in arr.reversed() {
        // started looping through elements
        print("i : \(i)")
        print("i * r : \(i*r)")
        // we are checking if there is i * r
        // availabe in dictionary because if it is
        // we can count it as a triple form as
        // the dictionaryPairs already has parked something
        // which forms a triplet with this combination
        if (dictionaryPairs.keys.contains(i*r)) {
            if let value = dictionaryPairs[i*r] {
                numberOfTriplets += value
                print("numberOfTriplets updated to : \(numberOfTriplets)")
            }
        }
        
        // here we are going to check if there is possibility
        // this i's i*r being contained in dictionary so that
        // we can park it in dictionaryPairs to form i*r with
        // another one of i's element
        if (dictionary.keys.contains(i*r)) {
            if let value1 = dictionary[i*r] {
                if let value = dictionaryPairs[i] {
                    dictionaryPairs[i] = value + value1
                } else {
                    dictionaryPairs[i] = value1
                }
            }
            print("dictionaryPairs updated :  \(dictionaryPairs)")
        }
        // to know that i exist as a member of this
        // array and is avaliable for future search
        // that hey there is i if you are looking for it
        // in case i is some other element's i*r
        if let value = dictionary[i] {
            dictionary[i] = value + 1
        } else {
            dictionary[i] = 1
        }
        print("dictionary updated :  \(dictionary)")
    }
    return numberOfTriplets
}

let arr: [Int] = [1,3,9,9,27,81]
var arr1 = [Int]()

for _ in 1...100 {
    arr1.append(1)
}

countTriplets(arr: arr, r: 3)
