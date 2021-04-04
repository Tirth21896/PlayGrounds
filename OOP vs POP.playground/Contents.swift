import UIKit

var str = "Hello, Obejct Oriented Programming vs Protocol Oriented Programming"

protocol Bird: CustomStringConvertible {
  var name: String { get }
  var canFly: Bool { get }
}

protocol Flyable {
  var airspeedVelocity: Double { get }
}

struct FlappyBird: Bird, Flyable {
  let name: String
  let flappyAmplitude: Double
  let flappyFrequency: Double

  var airspeedVelocity: Double {
    3 * flappyFrequency * flappyAmplitude
  }
}

struct Penguin: Bird {
  let name: String
}

struct SwiftBird: Bird, Flyable {
  var name: String { "Swift \(version)" }
  let version: Double
  private var speedFactor = 1000.0
  
  init(version: Double) {
    self.version = version
  }

  // Swift is FASTER with each version!
  var airspeedVelocity: Double {
    version * speedFactor
  }
}

extension Bird {
  // Flyable birds can fly!
  var canFly: Bool { self is Flyable }
}


enum UnladenSwallow: Bird, Flyable {
  case african
  case european
  case unknown
  
  var name: String {
    switch self {
    case .african:
      return "African"
    case .european:
      return "European"
    case .unknown:
      return "What do you mean? African or European?"
    }
  }
  
  var airspeedVelocity: Double {
    switch self {
    case .african:
      return 10.0
    case .european:
      return 9.9
    case .unknown:
      fatalError("You are thrown from the bridge of death!")
    }
  }
}

// you can basically override the default implementation
// developer via bird that if it is flyable
// can fly is true but when it is unknown you still want to return
// false.
extension UnladenSwallow {
  var canFly: Bool {
    self != .unknown
  }
}


UnladenSwallow.unknown.canFly         // false
UnladenSwallow.african.canFly         // true
Penguin(name: "King Penguin").canFly  // false


extension CustomStringConvertible where Self: Bird {
  var description: String {
    canFly ? "I can fly" : "Guess I'll just sit here :["
  }
}

UnladenSwallow.african


// you can see another way to access a variable like that in slice
// it will provide you with only the indexs that you need (i guess it has to be in a sequential order)
let numbers = [10, 20, 30, 40, 50, 60]
let slice = numbers[1...3]
let reversedSlice = slice.reversed()

let answer = reversedSlice.map { $0 * 10 }
print(answer) // [400, 300, 200]


class Motorcycle {
  init(name: String) {
    self.name = name
    speed = 200.0
  }

  var name: String
  var speed: Double
}

// we are proting every single of them to racer
// now they are ready to do race

// 1
protocol Racer {
  var speed: Double { get }  // speed is the only thing racers care about
}

// 2
extension FlappyBird: Racer {
  var speed: Double {
    airspeedVelocity
  }
}

extension SwiftBird: Racer {
  var speed: Double {
    airspeedVelocity
  }
}

extension Penguin: Racer {
  var speed: Double {
    42  // full waddle speed
  }
}

extension UnladenSwallow: Racer {
  var speed: Double {
    canFly ? airspeedVelocity : 0.0
  }
}

extension Motorcycle: Racer {}

// 3
let racers: [Racer] =
  [UnladenSwallow.african,
   UnladenSwallow.european,
   UnladenSwallow.unknown,
   Penguin(name: "King Penguin"),
   SwiftBird(version: 5.1),
   FlappyBird(name: "Felipe", flappyAmplitude: 3.0, flappyFrequency: 20.0),
   Motorcycle(name: "Giacomo")]

// top speed of racer


func topSpeed(of racers: [Racer]) -> Double {
  racers.max(by: { $0.speed < $1.speed })?.speed ?? 0.0
}

// we are making this function generic
// below is the generic version
// making it generic helps you passing anuything at all I LITERALLY mean anything at all
// 1
func topSpeed<RacersType: Sequence>(of racers: RacersType) -> Double
    /*2*/ where RacersType.Iterator.Element == Racer
{
  // 3
  racers.max(by: { $0.speed < $1.speed })?.speed ?? 0.0
}

// if you wanna make it more generic for the project it self
// here is another solution which is creating an extensoion to the Sequence

extension Sequence where Iterator.Element == Racer {
    func topSpeed() -> Double {
        self.max(by: { $0.speed < $1.speed })?.speed ?? 0.0
    }
}

// this is testing our functions
topSpeed(of: racers) // 5100
topSpeed(of: racers[1...2])

// this is testing our extension
racers.topSpeed()
racers[1...2].topSpeed()

// *********
// Protocol Comparator

protocol Score: Comparable {
  var value: Int { get }
}

struct RacingScore: Score {
  let value: Int
  
  static func <(lhs: RacingScore, rhs: RacingScore) -> Bool {
    lhs.value < rhs.value
  }
}

RacingScore(value: 150) >= RacingScore(value: 130) // true

// mutating functions
// cheat all day everyday

protocol Cheat {
  mutating func boost(_ power: Double)
}

// providing an ability to cheat
extension SwiftBird: Cheat {
  mutating func boost(_ power: Double) {
    speedFactor += power
  }
}

var swiftBird = SwiftBird(version: 5.0)
swiftBird.boost(3.0)
swiftBird.airspeedVelocity // 5015
swiftBird.boost(3.0)
swiftBird.airspeedVelocity // 5030








