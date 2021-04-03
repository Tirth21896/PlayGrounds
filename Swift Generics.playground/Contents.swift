import UIKit

var str = "Hello, Swift Generics"

func addInts(x: Int, y: Int) -> Int {
  return x + y
}

let intSum = addInts(x: 1, y: 2)

func addDoubles(x: Double, y: Double) -> Double {
  return x + y
}

let doubleSum = addDoubles(x: 1.0, y: 2.0)

// Arrays are generic why? because it has defined like that.
// so it can adapt any value.

let numbers = [1, 2, 3]

let firstNumber = numbers[0]

// because Dictionaries are the same
// generics

let countryCodes = ["Arendelle": "AR", "Genovia": "GN", "Freedonia": "FD"]
let countryCode = countryCodes["Freedonia"]

// syntax of creating an optional string below

let optionalName = Optional<String>.some("Princess Moana")
if let name = optionalName {}

// It’s T time!


enum MagicError: Error {
  case spellFailure
}

func cast(_ spell: String) -> Result<String, MagicError> {
  switch spell {
  case "flowers":
    return .success("💐")
  case "stars":
    return .success("✨")
  default:
    return .failure(.spellFailure)
  }
}

let result1 = cast("flowers") // .success("💐")
let result2 = cast("avada kedavra") // .failure(.spellFailure)


// Writing a Generic Data Structure

// Queen wants queue give her a queue
struct Queue<Element: Equatable> {
    private var elements: [Element] = []
    
    mutating func enqueue(newElement: Element) {
      elements.append(newElement)
    }

    mutating func dequeue() -> Element? {
      guard !elements.isEmpty else { return nil }
      return elements.remove(at: 0)
    }
}

var q = Queue<Int>()

q.enqueue(newElement: 4)
q.enqueue(newElement: 2)

q.dequeue()
q.dequeue()
q.dequeue()
q.dequeue()

func pairs<Key, Value>(from dictionary: [Key: Value]) -> [(Key, Value)] {
  return Array(dictionary)
}

let somePairs = pairs(from: ["minimum": 199, "maximum": 299])
// result is [("maximum", 299), ("minimum", 199)]

let morePairs = pairs(from: [1: "Swift", 2: "Generics", 3: "Rule"])
// result is [(1, "Swift"), (2, "Generics"), (3, "Rule")]

func mid<T: Comparable>(array: [T]) -> T? {
  guard !array.isEmpty else { return nil }
  return array.sorted()[(array.count - 1) / 2]
}

mid(array: [3, 5, 1, 2, 4]) // 3

// summable is generic solution for types that are summabale
// this can include string too.

protocol Summable { static func +(lhs: Self, rhs: Self) -> Self }
extension Int: Summable {}
extension Double: Summable {}

func add<T: Summable> (x: T, y: T) -> T {
    return x + y
}


let addIntSum = add(x: 1, y: 2) // 3
let addDoubleSum = add(x: 1.0, y: 2.0) // 3.0

// exteding a generic type
extension Queue {
  func peek() -> Element? {
    return elements.first
  }
}

q.enqueue(newElement: 5)
q.enqueue(newElement: 3)
q.peek() // 5


// royal challange
// make a function to find out if all the elements are homogeneous
// follow equatable to compare elements
extension Queue {
    func isHomogeneous() -> Bool {
        guard let first = elements.first else { return true }
        return !elements.contains { $0 != first }
    }
}

var h = Queue<Int>()
h.enqueue(newElement: 4)
h.enqueue(newElement: 4)
h.isHomogeneous() // true
h.enqueue(newElement: 2)
h.isHomogeneous() // false


// just making it comparable
struct Person: Comparable {
    
    var id: Int
    var name: String
    var age: Int
    
    init (
        id: Int,
        name: String,
        age: Int
    ) {
        self.id = id
        self.name = name
        self.age = age
    }
    
    static func < (lhs: Person, rhs: Person) -> Bool {
        if (lhs.id < rhs.id) {
            return true
        } else {
            return false
        }
    }
    
    static func > (lhs: Person, rhs: Person) -> Bool {
        if (lhs.id > rhs.id) {
            return true
        } else {
            return false
        }
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        if (lhs.id == rhs.id) {
            return true
        } else {
            return false
        }
    }
    
}


let tirth = Person(id: 111, name: "Tirth", age: 24)
let mihir = Person(id: 112, name: "Mihir", age: 26)
let appu = Person(id: 113, name: "Appu", age: 26)

if (mihir < appu) {
    print("bapu it worked")
}

// Subclassing a generic class
class Box<T> {
    
}

class Gift<T>: Box<T> {
    // By default, a gift box is wrapped with plain white paper
      func wrap() {
        print("Wrap with plain white paper.")
      }
}

class Rose {
  // Flower of choice for fairytale dramas
}

class ValentinesBox: Gift<Rose> {
  // A rose for your valentine
    override func wrap() {
      print("Wrap with ♥♥♥ paper.")
    }
}

class Shoe {
  // Just regular footwear
}

class GlassSlipper: Shoe {
  // A single shoe, destined for a princess
}

class ShoeBox: Box<Shoe> {
  // A box that can contain shoes
}


enum Reward<T> {
  case treasureChest(T)
  case medal

  var message: String {
    switch self {
    case .treasureChest(let treasure):
      return "You got a chest filled with \(treasure)."
    case .medal:
      return "Stand proud, you earned a medal!"
    }
  }
}

