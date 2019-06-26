
class ListNode {
    var nodeValue: Int
    var n_Node: ListNode?
    init(n_Node: ListNode?, nodeValue: Int) {
        self.n_Node = n_Node
        self.nodeValue = nodeValue
    }
    
}
class Solution {
    class func AddTwoNumber(l1: ListNode, l2: ListNode ) -> ListNode {
        logNode(listNode: l1)
        logNode(listNode: l2)
        var lNode1 = l1
        var lNode2 = l2
        var carray: Int = 0
        let resultNode: ListNode = ListNode.init(n_Node: nil, nodeValue: 0)
        var currentNode: ListNode = resultNode
        if lNode1.n_Node == nil && lNode2.n_Node == nil {
            resultNode.nodeValue = (lNode1.nodeValue + lNode2.nodeValue) % 10
            carray = (lNode1.nodeValue + lNode2.nodeValue) / 10
            if carray != 0 {
                resultNode.n_Node = ListNode.init(n_Node: nil, nodeValue: carray)
            }
            return resultNode
        }
        while lNode1.n_Node != nil || lNode2.n_Node != nil || carray != 0  {
            let sum = lNode1.nodeValue + lNode2.nodeValue + carray
            let value = (sum) % 10
            carray = (sum) / 10
            currentNode.nodeValue = value
            if !(lNode1.n_Node == nil && lNode2.n_Node == nil && carray == 0) {
                let nextNode = ListNode.init(n_Node: nil, nodeValue: 0)
                currentNode.n_Node = nextNode
                currentNode = nextNode
            }
            lNode1 = lNode1.n_Node == nil ? ListNode(n_Node: nil, nodeValue: 0) : lNode1.n_Node!
            lNode2 = lNode2.n_Node == nil ? ListNode(n_Node: nil, nodeValue: 0) : lNode2.n_Node!
        }
        return resultNode
    }
    class func logNode(listNode: ListNode) -> Void {
        var lNode = listNode
        var resultStr = ""
        while lNode.n_Node != nil {
            resultStr += "\(lNode.nodeValue) -> "
            lNode = lNode.n_Node!
        }
        resultStr += "\(lNode.nodeValue)"
        print("\(resultStr)")
    }
}

//test
// (2 -> 4 -> 3)  +  （5 -> 6 -> 4）
// 输出  7 -> 0 -> 8

let lNode11 = ListNode.init(n_Node: nil, nodeValue: 3)
let lNode12 = ListNode.init(n_Node: lNode11, nodeValue: 4)
let l1 = ListNode.init(n_Node: lNode12, nodeValue: 2)

let lNode21 = ListNode.init(n_Node: nil, nodeValue: 4)
let lNode22 = ListNode.init(n_Node: lNode21, nodeValue: 6)
let l2 = ListNode.init(n_Node: lNode22, nodeValue: 5)

let resultNode = Solution.AddTwoNumber(l1: l1, l2: l2)

Solution.logNode(listNode: resultNode)
