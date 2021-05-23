import UIKit

var str = "Hello, playground"

// Complete the freqQuery function below.
func freqQuery(queries: [[Int]]) -> [Int] {
    var freqTracker: [Int: Int] = [Int: Int]()
    var arryOutput: [Int] = [Int]()
    
    for query in queries {
        let operation = query[0]
        let element = query[1]
        switch operation {
        case 1:
            // add element one time
            if let value = freqTracker[element] {
                freqTracker[element] = value + 1
            } else {
                freqTracker[element] = 1
            }
            break
        case 2:
            // delete element one time
            if (freqTracker.keys.contains(element)) {
                if let value = freqTracker[element],
                   value > 0
                {
                    freqTracker[element] = value - 1
                }
            }
            break
        case 3:
            // check if any int has freq
            var doesMatchesFreq: Bool = false
            for freq in freqTracker {
                if (freq.value == element) {
                    doesMatchesFreq = true
                    break
                }
            }
            if (doesMatchesFreq) {
                arryOutput.append(1)
            } else {
                arryOutput.append(0)
            }
            break
        default:
            break
        }
    }

    return arryOutput
}
