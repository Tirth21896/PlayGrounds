import UIKit

var str = "Hello, Hacker Rank New Year Chaos"

// Complete the minimumBribes function below.
func minimumBribes(q: [Int]) -> Void {
    var q: [Int] = q
    var shouldBreak: Bool = false
    if (q.count > 1) {
        var minimumBribes: Int = 0
        while (q != q.sorted()) {
            for (index,item) in q.enumerated() {
                if(item - 1 > index + 2) {
                    print("Too chaotic")
                    shouldBreak = true
                    break
                }
                if (q.count > index + 1 && item > q[index + 1]) {
                    let value: Int = q.remove(at: index + 1)
                    q.insert(value, at: index)
                    minimumBribes += 1
                }
            }
            if (shouldBreak) {
                break
            }
        }
        if (!shouldBreak) {
            print(minimumBribes)
        }
    }
}


let array: [Int] = [1, 2, 5, 3, 7, 8, 6, 4]
let array1: [Int] = [5, 1, 2, 3, 7, 8, 6, 4]
minimumBribes(q: array1)
minimumBribes(q: array)
