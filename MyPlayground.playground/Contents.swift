import UIKit

var str = "Hello, playground"


class Point {
    var x: Int = -1
    var y: Int = -1
    
    init(
        x: Int,
        y: Int
    ) {
        self.x = x
        self.y = y
    }
}

let origin = Point(x: 0, y: 0)

var otherPoint = Point(x: 0, y: 0)
otherPoint.x += 10
otherPoint

var thirdPoint = origin
thirdPoint.x += 10
thirdPoint
origin
