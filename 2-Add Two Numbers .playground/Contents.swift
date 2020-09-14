
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }

 class Solution {
     func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard var lNode1 = l1 else {
            guard let lNode2 = l2 else {
                return nil
            }
            return lNode2
        }
        guard var lNode2 = l2 else {
            return lNode1
        }
        logNode(listNode: lNode1)
        logNode(listNode: lNode2)
        var carray: Int = 0
        let resultNode: ListNode = ListNode.init(0, nil)
        var currentNode: ListNode = resultNode
        while true {
            let sum = lNode1.val + lNode2.val + carray
            let value = (sum) % 10
            carray = (sum) / 10
            currentNode.val = value
            if lNode1.next != nil || lNode2.next != nil || carray != 0 {
                let nextNode = ListNode.init(0, nil)
                currentNode.next = nextNode
                currentNode = nextNode
            } else {
                break;
            }
            lNode1 = lNode1.next == nil ? ListNode.init(0, nil) : lNode1.next!
            lNode2 = lNode2.next == nil ? ListNode.init(0, nil) : lNode2.next!
        }
        return resultNode
     }
    
    func logNode(listNode: ListNode) -> Void {
        var lNode = listNode
        var resultStr = ""
        while lNode.next != nil {
            resultStr += "\(lNode.val) -> "
            lNode = lNode.next!
        }
        resultStr += "\(lNode.val)"
        print("----\(resultStr)")
    }
 }


//test
// (2 -> 4 -> 3)  +  （5 -> 6 -> 4）
// 输出  7 -> 0 -> 8

let lNode11 = ListNode.init(3, nil)
let lNode12 = ListNode.init(4, lNode11)
let l1: ListNode? = ListNode.init(2, lNode12)

let lNode21 = ListNode.init(4, nil)
let lNode22 = ListNode.init(6, lNode21)
let l2: ListNode? = ListNode.init(5, lNode22)

//let lNode12 = ListNode.init(8, nil)
//let l1: ListNode? = ListNode.init(1, lNode12)
//
//let l2: ListNode? = ListNode.init(0, nil)

let resultNode = Solution().addTwoNumbers(l1, l2)

Solution().logNode(listNode: resultNode!)



