
class Node {
    var nodeValue: Int = 0
    var p_Left: Node?
    var p_Right: Node?
    init(p_Left: Node?, p_Right: Node?, value: Int) {
        self.p_Left = p_Left
        self.p_Right = p_Right
        self.nodeValue = value
    }
}

class Iterator {
    
    var nodeStack:[Node] = []
    
    init(note: Node) {
        pushAll(rootNode: note)
    }
    func next() -> Int {
        if !hasNext() {
            return 0
        }
        let node = self.nodeStack.removeLast()
        if node.p_Right != nil {
            pushAll(rootNode: node.p_Right!)
        }
        return node.nodeValue
    }
    func hasNext() -> Bool {
        return !self.nodeStack.isEmpty
    }
    func pushAll(rootNode: Node) -> Void {
        var node = rootNode
        self.nodeStack.append(node)
        while node.p_Left != nil {
            node = node.p_Left!
            self.nodeStack.append(node)
        }
    }
}

//test

let node3 = Node.init(p_Left: nil, p_Right: nil, value: 3)

let node15 = Node.init(p_Left: nil, p_Right: nil, value: 15)
let node7 = Node.init(p_Left: nil, p_Right: nil, value: 7)
let node9 = Node.init(p_Left: node7, p_Right: node15, value: 9)

let node5 = Node.init(p_Left: node3, p_Right: node9, value: 5)

let rootNode = node5

let iterator = Iterator.init(note: rootNode)
print("next: \(iterator.next())")
print("has Next: \(iterator.hasNext())")

print("next: \(iterator.next())")
print("next: \(iterator.next())")
print("has Next: \(iterator.hasNext())")

print("next: \(iterator.next())")
print("next: \(iterator.next())")

print("has Next: \(iterator.hasNext())")
print("next: \(iterator.next())")

