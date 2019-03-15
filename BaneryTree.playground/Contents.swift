

//============================== Tree ======================================

extension Array {
    func subArray(range: [Int]) -> [Element] {
        var resultArray: [Element] = []
        for index in range {
            resultArray.append(self[index])
        }
        return resultArray
    }
    func subArray(fromIndex: Int, toIndex: Int) -> [Element] {
        var resultArray: [Element] = []
        for index in fromIndex ..< toIndex {
            resultArray.append(self[index])
        }
        return resultArray
    }
}

class BaneryTree {
    
    class TreeNode {
        var p_Left: TreeNode?
        var p_Right: TreeNode?
        var nodeValue: Int
        init(p_Left: TreeNode?, p_Right: TreeNode?, nodeValue: Int) {
            self.p_Left = p_Left
            self.p_Right = p_Right
            self.nodeValue = nodeValue
        }
    }
    // ******************* 构建二叉树 ********************
    //根据数组构建二叉树
    //注释: 如果这里是排序数组则构建二叉搜索树
    func buildBaneryTree(values: [Int]) -> TreeNode? {
        if values.count == 0 {
            return nil
        }
        if values.count == 1 {
            let rootNode = TreeNode.init(p_Left: nil, p_Right: nil, nodeValue: values[0])
            logNode(treeNode: rootNode)
            return rootNode
        }
        if values.count == 2 {
            let leftNode = TreeNode.init(p_Left: nil, p_Right: nil, nodeValue: values[0])
            let rootNode = TreeNode.init(p_Left: leftNode, p_Right: nil, nodeValue: values[1])
            logNode(treeNode: rootNode)
            return rootNode
        }
        if values.count == 3 {
            let leftNode = TreeNode.init(p_Left: nil, p_Right: nil, nodeValue: values[0])
            let rightNode = TreeNode.init(p_Left: nil, p_Right: nil, nodeValue: values[2])
            let rootNode = TreeNode.init(p_Left: leftNode, p_Right: rightNode, nodeValue: values[1])
            logNode(treeNode: rootNode)
            return rootNode
        }
        var middleIndex: Int = (values.count - 1) / 2
        if values.count & 1 == 0/*偶数个元素*/ {
            print("元素个数为偶数")
            //注释：这里对于偶数元素如果使用向前偏移和向后偏移则构建出完全不同的二叉树
            middleIndex = (values.count - 1) / 2
        }
        
        let leftTreeNode = buildBaneryTree(values: values.subArray(fromIndex: 0, toIndex: middleIndex))
        let rightTreeNode = buildBaneryTree(values: values.subArray(fromIndex: middleIndex + 1, toIndex: values.count))
        let rootTreeNode = TreeNode.init(p_Left: leftTreeNode, p_Right: rightTreeNode, nodeValue: values[middleIndex])
        logNode(treeNode: rootTreeNode)
        return rootTreeNode
    }
    //非排序数组构建二叉搜索树
    static var leftNodeCount: Int = 0
    static var rightNodeCount: Int = 0
    //构建二叉搜索树
    func buildBanerySearchTree(values: [Int]) -> TreeNode? {
        if values.count == 0 {
            return nil
        }
        var rootNode: TreeNode = TreeNode.init(p_Left: nil, p_Right: nil, nodeValue: values[0])
        if values.count == 1 {
            return rootNode
        }
        for index in 1 ..< values.count {
            rootNode = insertValueIntoBanerySearchTree(baneryTree: rootNode, value: values[index], isCountEnable: true)
        }
        banlanceBaneryTree(rootNode: rootNode)
        print("leftNodeCount: \(BaneryTree.leftNodeCount) rightNodeCount: \(BaneryTree.rightNodeCount)")
        BaneryTree.leftNodeCount = 0
        BaneryTree.rightNodeCount = 0
        return rootNode
    }
    //将一颗二叉树的左右节点的个数差值控制在 >= 1内
    func banlanceBaneryTree(rootNode: TreeNode) -> Void {
        print("leftNodeCount: \(BaneryTree.leftNodeCount) rightNodeCount: \(BaneryTree.rightNodeCount)")
        var isWhileEnable = true
        while isWhileEnable {
            //进行二叉树平衡处理
            if BaneryTree.leftNodeCount - BaneryTree.rightNodeCount > 1 {
                let leftMaxNode = searchLeftMaxNodeOfBaneryTree(rootNote: rootNode.p_Left!)
                print("max Left : \(leftMaxNode.nodeValue)")
                BaneryTree.leftNodeCount -= 1
                let tempValue = leftMaxNode.nodeValue
                leftMaxNode.nodeValue = rootNode.nodeValue
                rootNode.nodeValue = tempValue
                BaneryTree.rightNodeCount += 1
                if rootNode.p_Left?.p_Left != nil {
                    let nextNode = rootNode.p_Left?.p_Left
                    rootNode.p_Left = nextNode
                }
                if rootNode.p_Right != nil {
                    insertValueIntoBanerySearchTree(baneryTree: rootNode.p_Right!, value: leftMaxNode.nodeValue , isCountEnable: false)
                } else {
                    rootNode.p_Right = TreeNode.init(p_Left: nil, p_Right: nil, nodeValue: leftMaxNode.nodeValue)
                }
                
            } else if BaneryTree.rightNodeCount - BaneryTree.leftNodeCount > 1 {
                let rightMinNode = searchRightMinNodeOfBaneryTree(rootNode: rootNode.p_Right!)
                print("max Right : \(rightMinNode.nodeValue)")
                BaneryTree.rightNodeCount -= 1
                let tempValue = rightMinNode.nodeValue
                rightMinNode.nodeValue = rootNode.nodeValue
                rootNode.nodeValue = tempValue
                BaneryTree.leftNodeCount += 1
                if rootNode.p_Right?.p_Right != nil {
                    let nextNode = rootNode.p_Right?.p_Right
                    rootNode.p_Right = nextNode
                }
                if rootNode.p_Left != nil {
                    insertValueIntoBanerySearchTree(baneryTree: rootNode.p_Left!, value: rightMinNode.nodeValue , isCountEnable: false)
                } else {
                    rootNode.p_Left = TreeNode.init(p_Left: nil, p_Right: nil, nodeValue: rightMinNode.nodeValue)
                }
            } else {
                isWhileEnable = false
            }
        }
    }
    //向二叉树种插入值 (注意这里如果存在等值情况会产生歧义处理、导致生成不同的二叉树)
    func insertValueIntoBanerySearchTree(baneryTree: TreeNode, value: Int, isCountEnable: Bool) -> TreeNode {
        if value > baneryTree.nodeValue {
            if baneryTree.p_Right == nil {
                let treeNode = TreeNode.init(p_Left: nil, p_Right: nil, nodeValue: value)
                baneryTree.p_Right = treeNode
                if isCountEnable {
                    BaneryTree.rightNodeCount += 1
                }
            } else {
                if isCountEnable {
                    BaneryTree.rightNodeCount += 1
                }
                insertValueIntoBanerySearchTree(baneryTree: baneryTree.p_Right!, value: value, isCountEnable: false)
            }
        } else if value < baneryTree.nodeValue {
            if baneryTree.p_Left == nil {
                let treeNode = TreeNode.init(p_Left: nil, p_Right: nil, nodeValue: value)
                baneryTree.p_Left = treeNode
                if isCountEnable {
                    BaneryTree.leftNodeCount += 1
                }
            } else {
                if isCountEnable {
                    BaneryTree.leftNodeCount += 1
                }
                insertValueIntoBanerySearchTree(baneryTree: baneryTree.p_Left!, value: value, isCountEnable: false)
            }
        } else {
            if baneryTree.p_Left == nil {
                let treeNode = TreeNode.init(p_Left: nil, p_Right: nil, nodeValue: value)
                baneryTree.p_Left = treeNode
                if isCountEnable {
                    BaneryTree.leftNodeCount += 1
                }
            } else if baneryTree.p_Right == nil {
                let treeNode = TreeNode.init(p_Left: nil, p_Right: nil, nodeValue: value)
                baneryTree.p_Right = treeNode
                if isCountEnable {
                    BaneryTree.rightNodeCount += 1
                }
            } else {
                if isCountEnable {
                    BaneryTree.rightNodeCount += 1
                }
                insertValueIntoBanerySearchTree(baneryTree: baneryTree.p_Right!, value: value, isCountEnable: false)
            }
        }
        return baneryTree
    }
    //查找左子树的最大值、并将最大值从树移除 （这里传入子树的根节点）
    func searchLeftMaxNodeOfBaneryTree(rootNote: TreeNode) -> TreeNode {
        if rootNote.p_Right == nil {
            return rootNote
        }
        while rootNote.p_Right?.p_Right != nil {
            let _ = searchLeftMaxNodeOfBaneryTree(rootNote: rootNote.p_Right!)
        }
        let maxNode = rootNote.p_Right
        return maxNode!
    }
    //查找右子树的最小值、并将最小值从树移除 （这里传入子树的根节点）
    func searchRightMinNodeOfBaneryTree(rootNode: TreeNode) -> TreeNode {
        if rootNode.p_Left == nil {
            return rootNode
        }
        while rootNode.p_Left?.p_Left != nil {
            let _ = searchRightMinNodeOfBaneryTree(rootNode:  rootNode.p_Left!)
        }
        let minNode = rootNode.p_Left
        return minNode!
    }
    
    // **************** 二叉树遍历 ************************
    //前序遍历 (Preorder Traversal (DLR))
    func preorderTraversalBaneryTree(rootMode: TreeNode?) -> Void {
        preorderTraversalBaneryTree(rootMode: rootMode, leftNode: rootMode?.p_Left, rightNode: rootMode?.p_Right)
    }
    func preorderTraversalBaneryTree(rootMode: TreeNode?, leftNode: TreeNode?, rightNode: TreeNode?) -> Void {
        print("rootTreeNode : \(String(describing: rootMode?.nodeValue))")
        if leftNode != nil {
            preorderTraversalBaneryTree(rootMode: leftNode, leftNode: leftNode?.p_Left, rightNode: leftNode?.p_Right)
        }
        if rightNode != nil {
            preorderTraversalBaneryTree(rootMode: rightNode, leftNode: rightNode?.p_Left, rightNode: rightNode?.p_Right)
        }
    }
    //中序遍历 (Inorder Traversal (LDR))
    func inorderTraversalBaneryTree(rootMode: TreeNode?) -> Void {
        inorderTraversalBaneryTree(rootMode: rootMode, leftNode: rootMode?.p_Left, rightNode: rootMode?.p_Right)
    }
    func inorderTraversalBaneryTree(rootMode: TreeNode?, leftNode: TreeNode?, rightNode: TreeNode?) -> Void {
        if leftNode != nil {
            inorderTraversalBaneryTree(rootMode: leftNode, leftNode: leftNode?.p_Left, rightNode: leftNode?.p_Right)
        }
        print("rootTreeNode : \(String(describing: rootMode?.nodeValue))")
        if rightNode != nil {
            inorderTraversalBaneryTree(rootMode: rightNode, leftNode: rightNode?.p_Left, rightNode: rightNode?.p_Right)
        }
    }
    //后序遍历 (Postorder Traversal (LRD))
    func postorderTraversalBaneryTree(rootMode: TreeNode?) -> Void {
        postorderTraversalBaneryTree(rootMode: rootMode, leftNode: rootMode?.p_Left, rightNode: rootMode?.p_Right)
    }
    func postorderTraversalBaneryTree(rootMode: TreeNode?, leftNode: TreeNode?, rightNode: TreeNode?) -> Void {
        if leftNode != nil {
            postorderTraversalBaneryTree(rootMode: leftNode, leftNode: leftNode?.p_Left, rightNode: leftNode?.p_Right)
        }
        if rightNode != nil {
            postorderTraversalBaneryTree(rootMode: rightNode, leftNode: rightNode?.p_Left, rightNode: rightNode?.p_Right)
        }
        print("rootTreeNode : \(String(describing: rootMode?.nodeValue))")
    }
    func logNode(treeNode: TreeNode) -> Void {
        print("leftTreeNode : \(String(describing: treeNode.p_Left?.nodeValue)) rootTreeNode : \(treeNode.nodeValue)    rightTreeNode : \(String(describing: treeNode.p_Right?.nodeValue))")
    }
}

//输入 []
//输出 nil

//输入 [1, 2, 3, 4, 5, 6]
//输出        3
//         /    \
//       2        5
//     /        /   \
//    1        4     6

//输入 [1, 2, 3, 4, 5, 6, 7]
//输出        4
//         /    \
//       2        6
//     /   \    /    \
//    1     3  5      7

//输入 [3, 4, 6, 12, 7, 3, 15, 2, 7, 1, 9]
//输出                3
//                /     \
//             6            7
//           /   \        /   \
//         4       7     2     9
//       /        /    /      /
//      3       12    15    1
let B_tree = BaneryTree()
var rootNode = B_tree.buildBaneryTree(values: [3, 4, 6, 12, 7, 3, 15, 2, 7, 1, 9])

print("============================================================")
////前序遍历 (Preorder Traversal (DLR))
//B_tree.preorderTraversalBaneryTree(rootMode: rootNode)
////中序遍历 (Inorder Traversal (LDR))
//B_tree.inorderTraversalBaneryTree(rootMode: rootNode)
////后序遍历 (Postorder Traversal (LRD))
//B_tree.postorderTraversalBaneryTree(rootMode: rootNode)

//非排序数组实现二叉搜索树
//输入 [4, 7, 6, 5, 1, 2, 3]
//输出        4
//         /    \
//       2        6
//     /   \    /    \
//    1     3  5      7
//输入 [3, 4, 6, 12, 7, 3, 15, 2, 7, 1, 9]
//    [1, 2, 3, 3, 4, 6, 7, 7, 9, 12, 15]
//输出                 6
//                /       \
//              3            9
//            /   \        /   \
//          3       4     7     15
//        /              /      /
//       2              7      12
//      /
//     1
//？？？？？二叉树中如果存在相等的值对于等值的处理不通可能产生不同的树
//rootNode = B_tree.buildBanerySearchTree(values: [3, 4, 6, 12, 7, 3, 15, 2, 7, 1, 9])
//B_tree.inorderTraversalBaneryTree(rootMode: rootNode)

//========================== END ==============================


























