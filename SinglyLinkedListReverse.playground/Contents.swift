import UIKit

// Given the head of a singly linked list, reverse it in-place.

final class Node<T> {
    let payload: T
    var nextNode: Node?
    init(payload: T, nextNode: Node? = nil) {
        self.payload = payload
        self.nextNode = nextNode
    }
}

final class SinglyLinkedList<T> {
    var firstNode: Node<T>?
    init(firstNode: Node<T>? = nil) {
        self.firstNode = firstNode
    }
}

extension SinglyLinkedList {
    func reverse() {
        var previousNode: Node<T>? = nil
        var currentNode = firstNode
        var nextNode = firstNode?.nextNode
        while nextNode != nil {
            currentNode?.nextNode = previousNode
            previousNode = currentNode
            currentNode = nextNode
            nextNode = currentNode?.nextNode
        }
        currentNode?.nextNode = previousNode
        firstNode = currentNode
    }
}

extension SinglyLinkedList: CustomStringConvertible where T == Int {
    var description: String {
        var description = """
                          List \(Unmanaged.passUnretained(self).toOpaque())
                          """
        if firstNode != nil {
            description += " has nodes:\n"
            var node = firstNode
            while node != nil {
                description += (node!.payload.description + "\n")
                node = node!.nextNode
            }
            return description
        } else {
            return description + " has no nodes."
        }
    }
}


let node = Node(payload: 0) // T is Int
let list = SinglyLinkedList(firstNode: node)
var currentNode = node
var nextNode: Node<Int>
for id in 1..<100 {
    nextNode = Node(payload: id)
    currentNode.nextNode = nextNode
    currentNode = nextNode
}

list.reverse()
print(String(describing: list))
