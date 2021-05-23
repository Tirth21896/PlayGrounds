import UIKit
import Foundation

var str = "Hello, playground from sherlock and anagram"

func sherlockAndAnagrams(s: String) -> Int {
    var tracker = [[String: Int]:Int]()
    let s = Array(s)
    for (i,_) in s.enumerated() {
        for j in 1...s.count - i + 1 {
            var key = [String: Int]()
            if (i+j <= s.count) {
                s[i..<i+j].map({ (char) -> Void in
                    if let value = key[char.description] {
                        key[char.description] = value + 1
                    } else {
                        key[char.description] = 1
                    }
                })
                if let value = tracker[key] {
                    tracker[key] = value + 1
                } else {
                    tracker[key] = 1
                }
            }
        }
    }

    var counter: Int = 0
    for key in tracker.keys {
        if let value = tracker[key] {
            let i: Int = (value * (value - 1)) / 2
            counter += i
        }
    }

    return counter
}

sherlockAndAnagrams(s: "dbcfibibcheigfccacfegicigcefieeeeegcghggdheichgafhdigffgifidfbeaccadabecbdcgieaffbigffcecahafcafhcdg")




