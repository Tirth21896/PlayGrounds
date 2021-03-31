import UIKit

var names: [String] = ["Patel","Makati","Patel","Patel","Jariwala","Makati","Makati","Makati","Makati","Makati"]

func mostCommonNameInArray(
    array: [String]
) -> String {
    
    var nameCountDictionary = [String: Int]()
    var mostCommonName: String = ""
    var bestCount = -1
    for name in array {
        if let count = nameCountDictionary[name] {
            nameCountDictionary[name] = count + 1
            if (bestCount < count + 1) {
                bestCount = count + 1
                mostCommonName = name
            }
        } else {
            nameCountDictionary[name] = 1
        }
    }
    
    return mostCommonName
}

mostCommonNameInArray(array: names)
