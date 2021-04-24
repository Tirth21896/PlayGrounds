import UIKit
import Foundation

var str = "Hello, playground from sherlock and anagram"

func sherlockAndAnagrams(s: String) -> Int {
    var tracker = [[String: Int]:Int]()
    let s = Array(s)
    for (i,_) in s.enumerated() {
        print("i is: \(i)")
        print("run i to: \(s.count - i + 1)")
        for j in 1...s.count - i + 1 {
            print("j is: \(j)")
            var key = [String: Int]()
            if (i+j <= s.count) {
                print("range is : \(s[i..<i+j])")
                s[i..<i+j].map({ (char) -> Void in
                    if let value = key[char.description] {
                        key[char.description] = value + 1
                    } else {
                        key[char.description] = 1
                    }
                })
                print("key: \(key)")
                if let value = tracker[key] {
                    tracker[key] = value + 1
                } else {
                    tracker[key] = 1
                }
                print(tracker)
            }
        }
        print("got out!")
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




