//被除数和除数均为 32 位有符号整数。
//除数不为 0。
//假设我们的环境只能存储 32 位有符号整数，其数值范围是 [−231,  231 − 1]。本题中，如果除法结果溢出，则返回 231 − 1。

class Solution {
    //dividend : 被除数    divisor : 除数
    func divide(_ dividend: Int32, _ divisor: Int32) -> Int32 {
        print("=======dividend:\(dividend), divisor:\(divisor)")
        var dividend_inside = dividend
        var divisor_inside = divisor
        let sign = ((dividend > 0) && (divisor > 0)) || ((dividend < 0) && (divisor < 0));
        if dividend > 0 {
            dividend_inside = -dividend
        }
        if divisor > 0 {
            divisor_inside = -divisor
        }
        if divisor_inside == 0 || dividend_inside > divisor_inside {
            return 0
        }
        if dividend_inside == Int32.min && divisor == -1 {
            return Int32.max
        }
        if dividend_inside - divisor_inside > divisor_inside {
            return sign ? 1 : 0 - 1
        }
        var result: Int32 = -1
        var reduce: Int32 = 0
        var current_max = divisor_inside
        while true {
            if Int32.min - current_max > current_max {
                //越界
                print("\\\\\\\\\\\\\\current_max 越界")
                break
            }
            current_max += current_max
            if current_max >= dividend_inside {
                result += result
                reduce = dividend_inside - current_max
            }
            if current_max <= dividend_inside {
                break

            }
        }
        
        return sign ? (0 - (result - divide(reduce, divisor_inside))) : result - divide(reduce, divisor_inside)
    }
}

//
let divident: Int32 = Int32.max
let divisor: Int32 = -1

print("--===-0--3-i230-4230423=======\(Int32.max)  \(Int32.min)")

print("----------- \(Solution.init().divide(divident, divisor))")
print("----------- \(divident / divisor)")
