//3. Longest Substring Without Repeating Characters

/*
 Given a string, find the length of the longest substring without repeating characters.
 
 Example 1:
 
 Input: "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:
 
 Input: "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:
 
 Input: "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 */

let inputString = "abcabcbb" //"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

class Solution {
    class func longestSubstringWithoutRepeating(inputString: String) -> Int {
        let tempString: Substring = Substring(inputString)
        if tempString.isEmpty {
            return 0
        }
        let maxUnicoe: Int = Int(String("z").utf8.first!)
        let minUnicoe: Int = Int(String("A").utf8.first!)
        var minIndex = 0, maxIndex = 0
        var charArray: [Int] = Array.init(repeating: -1, count: Int(maxUnicoe + 1 - minUnicoe))
        print("space: \(charArray.count)")
        var index = 0
        var maxlength = 0
        
        while index < tempString.count {
            let char = tempString[.init(encodedOffset: index)]
//            print("index: \(index) charater: \(String(char).utf8CString.first!)")
            let charIndex: Int = Int(String(char).utf8CString.first!) - minUnicoe
            print("char: \(char) charIndex: \(charIndex)")
            if charArray[charIndex] == -1 {
                charArray[charIndex] = index
                maxIndex = index
            } else {
                maxlength = maxIndex + 1 - minIndex
                minIndex = charIndex + 1
                charArray[charIndex] = charIndex + 1
            }
            index += 1
        }
        return maxIndex + 1 - minIndex
    }
}


let result = Solution.longestSubstringWithoutRepeating(inputString: inputString)

print("result:  \(result)")


