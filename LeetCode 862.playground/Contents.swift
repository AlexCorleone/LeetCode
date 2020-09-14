
/*
 862. 和至少为 K 的最短子数组
 
 返回 A 的最短的非空连续子数组的长度，该子数组的和至少为 K 。
 如果没有和至少为 K 的非空子数组，返回 -1 。
 
 提示：
 1 <= A.length <= 50000
 -10 ^ 5 <= A[i] <= 10 ^ 5
 1 <= K <= 10 ^ 9
 
 **/

class Solution {
    func shortestSubarray(_ A: [Int], _ K: Int) -> Int {
        if A.count == 0 {
            return -1
        }
        var left = 0
        var right = left
        var plusValue = A[left]
        var length = A.count + 1
        
        while right < A.count && left < A.count {
            if plusValue >= K {
                let tempLength = right - left + 1
                if tempLength < length {
                    length = tempLength
                }
                print("========left: \(left) right: \(right) length: \(length)")
            }
            right = right + 1;
            if right == A.count {
                //right 到数组尾端 left + 1 重新开始
                left = left + 1
                right = left
                if left < A.count {
                    plusValue = A[left]
                }
            } else {
                plusValue = plusValue + A[right];
            }
        }
        return length == A.count + 1 ? -1 : length
    }
}

print("----1-----    \(Solution.init().shortestSubarray([17,85,93,-45,-21], 150))")

print("----2-----    \(Solution.init().shortestSubarray([1], 1))")

print("----3-----    \(Solution.init().shortestSubarray([1, 2], 4))")
//
print("----4-----    \(Solution.init().shortestSubarray([2, -1, 2], 3))")
