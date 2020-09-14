class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for index_i in 0 ..< nums.count {
            for index_j in index_i + 1 ..< nums.count {
                if (target - nums[index_i]) == nums[index_j] {
                    return [index_i, index_j]
                }
            }
        }
        return []
    }
}
var nums: [Int] = [2, 5, 1, 22, 9, 6, 10, 33]
let result: [Int] = Solution().twoSum(nums, 10)

print(result)
