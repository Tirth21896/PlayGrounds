import UIKit

var str = "Hello, playground"

/*
 Starting with a 1-indexed array of zeros and a list of operations, for each operation add a value to each the array element between two given indices, inclusive. Once all operations have been performed, return the maximum value in the array.

 Example


 Queries are interpreted as follows:

     a b k
     1 5 3
     4 8 7
     6 9 1
 Add the values of  between the indices  and  inclusive:

 index->     1 2 3  4  5 6 7 8 9 10
     [0,0,0, 0, 0,0,0,0,0, 0]
     [3,3,3, 3, 3,0,0,0,0, 0]
     [3,3,3,10,10,7,7,7,0, 0]
     [3,3,3,10,10,8,8,8,1, 0]
 The largest value is  after all operations are performed.

 Function Description

 Complete the function arrayManipulation in the editor below.

 arrayManipulation has the following parameters:

 int n - the number of elements in the array
 int queries[q][3] - a two dimensional array of queries where each queries[i] contains three integers, a, b, and k.
 Returns

 int - the maximum value in the resultant array
 Input Format

 The first line contains two space-separated integers  and , the size of the array and the number of operations.
 Each of the next  lines contains three space-separated integers ,  and , the left index, right index and summand.

 Constraints

 Sample Input

 5 3
 1 2 100
 2 5 100
 3 4 100
 Sample Output

 200
 Explanation

 After the first update the list is 100 100 0 0 0.
 After the second update list is 100 200 100 100 100.
 After the third update list is 100 200 200 200 100.

 The maximum value is .
 
*/

// Complete the arrayManipulation function below.


// solution 1
// func arrayManipulation(
//     n: Int,
//     queries: [[Int]]
// ) -> Int {
//     var maxNumberSoFar: Int = 0
//     var array = [Int: Int]()
//
//     for query in queries {
//         let a: Int = query[0]
//         let b: Int = query[1]
//         let k: Int = query[2]
//
//         for index in a...b {
//             var currentVal = k
//             if let value = array[index - 1] {
//                 array[index - 1] = value + k
//                 currentVal = value + k
//             } else {
//                 array[index - 1] = k
//             }
//             if (currentVal >= maxNumberSoFar) {
//                 maxNumberSoFar = currentVal
//             }
//         }
//
//     }
//
//     return maxNumberSoFar
// }

// solution 2 in python
//def arrayManipulation(n, queries):
//    acc = {}
//    for [a, b, k] in queries:
//        acc[a] = (acc[a] if a in acc else 0) + k
//        acc[b+1] = (acc[b+1] if b+1 in acc else 0) - k
//
//    last = 0
//    m = 0
//    for i in range(1,n+1):
//        curr = acc[i] if i in acc else 0
//        last = last + curr
//        if (last > m):
//            m = last
//
//    return m

// solution 2 in swift
//func arrayManipulation(
// n: Int,
// queries: [[Int]]
//) -> Int {
//    var maxNumberSoFar: Int = 0
//    var array = [Int: Int]()
//
//    for query in queries {
//        let a: Int = query[0]
//        let b: Int = query[1]
//        let k: Int = query[2]
//
//        if let avalue = array[a] {
//            array[a] = avalue + k
//        } else {
//            array[a] = k
//        }
//
//        if let bvalue = array[b + 1] {
//            array[b + 1] = bvalue - k
//        } else {
//            array[b + 1] = 0 - k
//        }
//    }
//
//    print(array)
//    var last: Int = 0
//    for i in 1 ... n + 1 {
//        let current: Int = array[i]  ?? 0
//        last = last + current
//        if (last >= maxNumberSoFar) {
//            maxNumberSoFar = last
//        }
//    }
//
//    return maxNumberSoFar
//}


// solution 2 in swift
func arrayManipulation(
 n: Int,
 queries: [[Int]]
) -> Int {
    var maxNumberSoFar: Int = 0
    var array = [Int: Int]()

    for query in queries {
        let a: Int = query[0]
        let b: Int = query[1]
        let k: Int = query[2]

        if let avalue = array[a] {
            array[a] = avalue + k
        } else {
            array[a] = k
        }

        if let bvalue = array[b + 1] {
            array[b + 1] = bvalue - k
        } else {
            array[b + 1] = 0 - k
        }
    }
    
    let sortedArray = array.sorted(by: { $0.key < $1.key })
    var last: Int = 0
    for element in sortedArray {
        print(element)
        let current: Int = element.value
        last = last + current
        if (last >= maxNumberSoFar) {
            maxNumberSoFar = last
        }
    }

    return maxNumberSoFar
}

arrayManipulation(
    n: 5,
    queries:
    [[1, 2, 100],
    [2, 5, 100],
    [3, 4, 100]]
)
