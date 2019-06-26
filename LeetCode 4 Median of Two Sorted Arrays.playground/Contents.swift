


class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
     
        var result: Double = 0.0
        let isEven: Bool = ((nums1.count + nums2.count) % 2 == 0) //isEven == true 偶数个数  isEven == false 奇数个数
        let sumNums: Int = nums1.count + nums2.count
        let middleIndex: Int = sumNums / 2
        if nums1.count == 0 && nums2.count == 0 {
            return result
        }
        if nums1.count == 0 {
            if nums2.count == 1 {
                result = Double(nums2[0])
            } else {
                result = isEven ? Double((nums2[middleIndex] + nums2[middleIndex - 1])) / 2.0 : Double(nums2[middleIndex])
            }
        } else if nums2.count == 0 {
            if nums1.count == 1 {
                result = Double(nums1[0])
            } else {
                result = isEven ? Double((nums1[middleIndex] + nums1[middleIndex - 1])) / 2.0 : Double(nums1[middleIndex])
            }
        } else {
            var readNums: Int = 0
            var nums1Index: Int = 0
            var nums2Index: Int = 0
            while readNums < middleIndex {
                if nums1Index > nums1.count - 1  {
                    nums2Index = nums2Index + 1
                } else if nums2Index > nums2.count - 1 {
                    nums1Index = nums1Index + 1
                } else {
                    if nums1[nums1Index] > nums2[nums2Index] {
                        nums1Index = nums1Index + 1
                    } else {
                        nums2Index = nums2Index + 1
                    }
                }
                readNums = readNums + 1
            }
            if nums1Index > nums1.count - 1 {
                //中间值在num2之前，
            } else if nums2Index > nums2.count - 1 {
                //中间值在nums1之前
            } else {
                result = isEven ? Double((nums1[middleIndex] + nums1[middleIndex - 1])) / 2.0 : Double(nums1[middleIndex])
            }
            
        }
        
        
        
        return 1.0
    }

}


//Test1 :
// nums1 = [1, 3]
// nums2 = [2]
// The median is 2.0

//Test2:
// nums1 = [1, 2]
// nums2 = [3, 4]
// The median is (2 + 3) / 2 = 2.5
