import UIKit

class Solution {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        print(nums)
        for i in 0 ..< nums.count {
            for j in i + 1 ..< nums.count {
                if abs(i - j) <= k && abs(nums[i] - nums[j]) <= t {
                    return true
                }
            }
        }
        return false
    }
}

var solution:Solution = Solution()
//var result = solution.containsNearbyAlmostDuplicate([1, 2, 3, 1], 3, 0)
//var result = solution.containsNearbyAlmostDuplicate([1, 0, 1, 1], 1, 2)
var result = solution.containsNearbyAlmostDuplicate([1, 5, 9, 1, 5, 9], 2, 3)

print(result)

if nil == nil {
    print("if successful")
}

let http404Error = (404, "Not Found")
print(http404Error.0)
print(http404Error.1)

enum hairType {
    case blackHair
    case redHair
}

class Personal {
    static var typeProperty: String? {
        return "type Property "
    }
    private var name: String = "UnKonwName"
    lazy var fingerNumber: Int8 = 10
    var hair: hairType = .redHair {
        willSet(willSetValue) {
            print("willSet \(willSetValue)")
        }
        didSet(didSetValue) {
            print("didSet \(didSetValue) ")
        }
        
//        get {
//
//        }
//        set {
//
//        }
    }
    init(hair:hairType, name:String) {
        self.hair = hair
        self.name = name
    }
    func logHair() -> Void {
        print("\(self.name) 有 \(hair) 的头发")
    }
    func logFingerNumber() {
        var funcParam: String = "funParamValue" {
            willSet {
                print(newValue)
            }
            didSet {
                print(oldValue)
            }
        }
        funcParam = "new func Param Value"
        print("\(name) 有 \(fingerNumber) 根手指")
    }
}

let person = Personal.init(hair: .blackHair, name: "Jone")
person.logHair()
person.hair = .redHair
person.logHair()

person.logFingerNumber()
person.fingerNumber = 20
person.logFingerNumber()

//Personal.typeProperty = "this is Type Propertyy"

print(Personal.typeProperty ?? "type Property Nil");


//Designated initializers must always delegate up.
//Convenience initializers must always delegate across.
class A {
    var name: String
    init(Aname name: String) {
        self.name = name
    }
}

class B: A {
    var age = 0
    
    convenience init(name Bname: String, Age age: Int) {
        self.init(Aname: Bname)
        self.age = age
    }
    deinit {
        //clear work
    }
}

let bClass = B.init(Aname: "bClassNmae")

let bClass1 = B.init(name: "cbndjcb", Age: 27)

print("\(bClass.name) \n \(bClass1.name) \(bClass1.age)")

//================================ Optional Chaining ===============================

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
    func logNumberOfRooms() {
        print("Residence Number of Rooms \(numberOfRooms)")
    }
}
let john = Person()
//let roomCount = john.residence!.numberOfRooms //this triggers a runtime error
let roomCount = john.residence?.numberOfRooms

if (roomCount == nil) {
    print("john residence is Nil")
}
john.residence?.logNumberOfRooms()

//================================== END ==================================


//================================= Error Handling ==========================

enum ErrorType: Error {
    case errorTypeEmpty
    case errorTypeLessItem
    case errorTypeMoreItem
}

class TestError {
    var memberNum: [Int] = []
    func logMemberStatus() throws -> Void {
        defer {
            //A defer statement defers execution until the current scope is exited.
            //defer在当前代码块作用域结束是执行,  *****这里当前d作用域是函数块*****
            self.memberNum = [1, 19, 3, 30]
        }
        if memberNum.count == 0 {
            throw ErrorType.errorTypeEmpty
        } else if memberNum.count <= 3 {
            throw ErrorType.errorTypeLessItem
        } else if memberNum.count > 3 {
            //如果此处声明 defer
            throw ErrorType.errorTypeMoreItem
            //将在此处执行 defer
        }
    }
}

var errorTest = TestError()

do {
    try errorTest.logMemberStatus()
} catch ErrorType.errorTypeEmpty {
    print("这里内容为空 已更改为\(errorTest.memberNum)")
} catch ErrorType.errorTypeLessItem {
    print("这里内容少于3个、属于较少范围 已更改为\(errorTest.memberNum)")
} catch ErrorType.errorTypeMoreItem {
    print("这里内容多于三个、 属于较多范围 已更改为\(errorTest.memberNum)")
}

//======================= END =========================

//====================== Type Casting (类型转换)====================
/* is(类型判断)、 as(类型转换)、 as?(尝试进行类型转换、可能失败)、 as!(强制进行类型转换、前提确保转换类型与实际类型一致) */
/* Any can represent an instance of any type at all, including function types.
   AnyObject can represent an instance of any class type. */

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

var movie = Movie.init(name: "Movie", director: "movie director")
var song = Song.init(name: "Song", artist: "song artist")
var library = [movie, song]

for item in library {
    if item is Movie {
        let movies = item as! Movie
        print(movies.director)
    } else if item is Song {
        let songs = item as! Song
        print(songs.artist)
    }
//    if let movies = item as? Movie {
//        print(movies.director)
//    } else if let songs = item as? Song {
//        print(songs.artist)
//    }
}

//========================= END ==================================

//========================= Nested Types (嵌套类型)=========================

//========================= END ==================================

//========================= Extensions ===========================

/*Extensions in Swift can:

Add computed instance properties and computed type properties
Define instance methods and type methods
Provide new initializers
Define subscripts
Define and use new nested types
Make an existing type conform to a protocol
      增加实例和类的计算属性
      定义实例和类方法
      提供新的初始化方法（只能提供便利初始化方法）
      定义下标访问
      定义和使用嵌套类型
      使已经存在的m类型准守某个协议
*/

extension Person {
    static var name: String = "extension Person Name"
    static func extensionLog() {
        print("person Extension Log  Person Name \(name)")
    }
}

Person.extensionLog()
//======================== END ===================================

//======================= Protocols =============================

protocol someProtocol {
    init()
}

class someSuperClass {
    init() {
        
    }
}

class someSubClass : someSuperClass, someProtocol {
    required override init() {
        
    }
}
//====================== END ====================================



//1.=========================================Quick Sort =================================================

var sortArray = [3, 23, 83, 2, 8, 45, 32, 6, 17, 24]

func sortMethod(sortArray: inout [Int]) -> Void {
    if sortArray.count <= 1 {
        return
    }
    quickSortMethod(sortArray: &sortArray, leftIndex: 0, rightIndex: sortArray.count - 1)
}

func quickSortMethod(sortArray: inout [Int], leftIndex: Int, rightIndex: Int) -> Void {
    
    let middleIndex = searchBaseLineIndex(sortArray: &sortArray, leftIndex: leftIndex, rightIndex: rightIndex)
    print("=======\(middleIndex)    \(leftIndex) \(rightIndex)")
    if middleIndex - 1 > leftIndex {
        quickSortMethod(sortArray: &sortArray, leftIndex: leftIndex, rightIndex: middleIndex - 1)
    }
    if rightIndex > middleIndex + 1 {
        quickSortMethod(sortArray: &sortArray, leftIndex: middleIndex + 1, rightIndex: rightIndex)
    }
}
func searchBaseLineIndex(sortArray: inout [Int], leftIndex: Int, rightIndex: Int) -> Int {
    let targetIndex = leftIndex
    var middlItemIndex = targetIndex + 1
    var index = middlItemIndex
    while index <= rightIndex {
        if sortArray[targetIndex] > sortArray[index] {
            swap(sortArray: &sortArray, aIndex: middlItemIndex, bIndex: index)
            middlItemIndex = middlItemIndex + 1
        }
        index = index + 1
    }
    swap(sortArray: &sortArray, aIndex: targetIndex, bIndex: middlItemIndex - 1)
    return middlItemIndex - 1
}

func swap(sortArray: inout [Int], aIndex: Int, bIndex: Int) -> Void {
    //========= 两个数交换 ========
    /*1 中间变量*/
    //    let temp = sortArray[aIndex];
    //    sortArray[aIndex] = sortArray[bIndex]
    //    sortArray[bIndex] = temp
    
    var a: Int = sortArray[aIndex]
    var b: Int = sortArray[bIndex]
    /*2 加减法 \a + b可能会越界*/
//    a = a + b //a = a + b, b = b
//    b = a - b //a = a + b, b = a
//    a = a - b //a = b, b = a
    /*3 乘除法 \ a * b 可能会越界*/
    a = a * b //a = a * b, b = b
    b = a / b // a = a * b, b = a
    a = a / b // a = b, b = a
    /*4 异或法*/
//    a = a ^ b
//    b = a ^ b
//    a = a ^ b
    sortArray[aIndex] = a
    sortArray[bIndex] = b
}

sortMethod(sortArray: &sortArray)
print("====\(sortArray)")
//=================================== END =========================================

//================================== Two Sum  (集合中的两个元素==给定的target值)=======================================
var nums = [2, 4, 9, 3, 17, 6]
var target = 8

2 + 6 == 8


//================================== END ==========================================

//2. ================================== String to Integer ============================
/*
 "42" -> 42
 "     -42" -> -42
 "4139 with words" -> 4139
 "words and 987" -> 0
 "-91283472332" -> -2147483648 越界输出边界值
 */
class StringToInteger {
    
    func myAutio(str: String) -> Int {
        if str.count == 0 {
            return 0
        }
        var charArray: [Character] = []
        var negative = 1
        
        for item in str {
            if charArray.count == 0 {
                if item == " " {
                    continue
                } else  if item == "-" {
                    negative = -1
                    continue
                }  else  if item == "+" {
                    negative = 1
                    continue
                }
            } else {
                if item >= "0" && item <= "9" {
                    charArray += [item]
                } else {
                    break
                }
            }
        }
        if charArray.count == 0 {
            return 0
        }
        var resultStr: String = ""
        
        for item in charArray {
            resultStr += String(item)
        }
        if Int32(resultStr) == nil {
            if -1 == negative {
                return Int(INT32_MAX * Int32(negative) + -1)
            }
            return Int(INT32_MAX)
        }
        let autioResult: Int = Int(resultStr)! * Int(negative)
        return autioResult
    }
}

let converStrToInt = StringToInteger()
var intResult: Int = converStrToInt.myAutio(str:"+564-91283472332")

print("========result \(intResult)")
//================================== END ==========================================


//3. ============================ 非加减乘除实现两个数相加 ========================

class AddNumber {
    func addTowNumber(numberLeft: UInt8, numberRight: UInt8) -> UInt8 {
        var a: UInt8 = numberLeft
        var b: UInt8 = numberRight
        while true {
            let z: UInt8 = a ^ b
            let w: UInt8 = (a & b) << 1
            if (a & b) >= 128/*这里UInt8最多到2的6次方、第七位标识u符号位*/ {
                return UInt8.max
            }
            if (a & b) == 0 {
                return z | w
            }
            a = z
            b = w
        }
    }
}

print("c = \(AddNumber().addTowNumber(numberLeft: 21, numberRight: 241)) == \(UInt8.max)")

//================================== END ==========================================

//4. ======================== 找出有序数组中和为目标值的数据， ==============================
//如何在有序数组中找出和等于给定值的两个元素？
class FindSum {
    func findSumInSortAarray(sortArray: [Int], sum: Int) -> [(Int, Int)] {
        var findTuples: [(Int, Int)] = []
        if sortArray.count <= 1 || sum - sortArray[0] <= 0{
            return findTuples
        }
        for index in 0 ..< sortArray.count - 1 {
            print("\(index) \(sortArray.count - 1)")
            let firstAddNumber = sortArray[index]
            let reduceNumber = sum - firstAddNumber
            var leftIndex = index + 1
            var rightIndex = sortArray.count - 1
            var isEndSearch: Bool = true

            while isEndSearch {
                if leftIndex == rightIndex {
                    if reduceNumber == sortArray[rightIndex] {
                        findTuples.append((firstAddNumber, sortArray[rightIndex]))
                        print("-------/////----\(findTuples)")
                    }
                    isEndSearch = false
                } else if rightIndex == leftIndex + 1  {
                    if reduceNumber == sortArray[rightIndex] {
                        findTuples.append((firstAddNumber, sortArray[rightIndex]))
                        print("-------/////----\(findTuples)")
                    }
                    if reduceNumber == sortArray[leftIndex] {
                        findTuples.append((firstAddNumber, sortArray[leftIndex]))
                        print("-------/////----\(findTuples)")
                    }
                    isEndSearch = false
                } else {
                    let middleIndex = (leftIndex + rightIndex) / 2
                    let middleValue = sortArray[middleIndex]
                    if reduceNumber < middleValue {
                        rightIndex = middleIndex
                    } else if reduceNumber > middleValue {
                        leftIndex = middleIndex
                    } else {
                        leftIndex = middleIndex
                        rightIndex = middleIndex
                        var isEndIndexSearch: Bool = true
                        while isEndIndexSearch {
                            if rightIndex + 1 <= sortArray.count && reduceNumber == sortArray[rightIndex + 1] {
                                rightIndex = rightIndex + 1
                            }
                            if leftIndex - 1 >= 0 && reduceNumber == sortArray[leftIndex - 1] {
                                leftIndex = leftIndex - 1
                            }
                            if leftIndex == rightIndex {
                                findTuples.append((firstAddNumber, sortArray[leftIndex]))
                                print("=========================\(findTuples)")
                                isEndIndexSearch = false
                            } else if (rightIndex + 1 > sortArray.count || reduceNumber < sortArray[rightIndex + 1])
                                  && (leftIndex - 1 < 0 || reduceNumber > sortArray[leftIndex - 1]) {
                                for index in leftIndex ... rightIndex {
                                    let item = sortArray[index]
                                    findTuples.append((firstAddNumber, item))
                                    print("============///\\////=============\(findTuples)")

                                }
                                isEndIndexSearch = false
                            }
                        }

                        isEndSearch = false
                        break
                    }
                }
            }
        }
        return findTuples
    }
}

print("-----------------------")
/*
 测试1 [] sum result []
 测试2 [5] sum result []
 测试3 [2, 7] sum 9 result [2, 7]
 测试4 [3 ,6, 9, 9, 15, 23, 32, 44] sum 24  result [(9, 15), (9, 15)]
 测试5 [1, 4, 5, 6, 7, 8, 11, 16, 44, 56, 56, 56, 56, 78, 87, 99] sum 60 result [(4, 56), (4, 56), (4, 56), (4, 56), (16, 44)]
 */
let resultTuple = FindSum.init().findSumInSortAarray(sortArray: [1, 4, 5, 6, 7, 8, 11, 16, 44, 56, 56, 56, 56, 78, 87, 99], sum: 60)
print("++++++++++++++++++result \(resultTuple)")

//================================= END ==========================================


//============================== 字符串翻转 ======================================
//将一个字符串进行d反转，如“12345678” 输出 “87654321”

class ReverseString {
    func reverseString(string: inout String) -> Void {
        if !(string.count <= 1) {
            var index: Int = 0
            while index < (string.count / 2) {
                let leftIndex = string.index(string.startIndex, offsetBy: index)
                let rightIdnex = string.index(string.startIndex, offsetBy: (string.count - 1) - index)
                let leftStr = string[leftIndex]
                let rightStr = string[rightIdnex]
                string.remove(at: leftIndex)
                string.insert(rightStr, at: leftIndex)
                string.remove(at: rightIdnex)
                string.insert(leftStr, at: rightIdnex)
                index += 1
            }
        }
    }
}

var testString: String = "12345B6789"

print("====\(testString)")
ReverseString().reverseString(string: &testString)
print("====\(testString)")

//测试 输入 “12345B6789” 输出结果 “9876B54321”
//================================ END =========================================

//================================ 剪绳子 =======================================
//给一根长度为n的绳子，把绳子剪成m段(m,n都是整数 n > 1 并且m > 1)，
//每段绳子的长度记为K[0],K[1],K[2], ..... K[m]。求K[0] * K[1] * K[2] ...... * k[m]的最大乘积？
//如 当绳子长度是8时，我们把它剪成长度为2、3、3的三段，此时得到的最大乘积是18.
class SeparatRepo {
    func TheProductOfSeparatRepo(repoLenth: Int) -> Int {
        if repoLenth <= 1 {
            return 0
        }
        if repoLenth == 2 {
            return 1 * 1
        }
        if repoLenth == 3 {
            return 1 * 2
        }
        return getMaxProductOfNumber(number: repoLenth)
    }
    func getMaxProductOfNumber(number: Int) -> Int {
        var max: Int = 0
        var products: [Int] = [Int].init(repeating: 0, count: number + 1)
        products[0] = 0
        products[1] = 1
        products[2] = 2
        products[3] = 3

        for i in 4 ... number {
            max = 0
            for j in 1 ... i / 2 {
                let product = products[j] * products[i - j]
                print("product: \(product) = \(products[j]) * \(products[i - j])")
                if max < product {
                    max = product
                }
                products[i] = max
                print("Max: \(products[i])")
            }
            max = products[number]
        }
        return max
    }
}

let number = 7

print("\(number)的最大分割乘积为: \(SeparatRepo().TheProductOfSeparatRepo(repoLenth: number))")

//================================ END ========================================

//============================ 二进制中 1 的个数 =================================
//实现函数输入一个整数、输出该数二进制z表示中1 的个数。 如输入 9(1001) 则输出2

class Numbers {
    func ASSICCOneOfNumber(number: inout Int8) -> Int {
        var count: Int = 0
////        是否加符号位的1、如果加上符号位的1
//        if number < 0 {
//            print("change Number \(number)")
//            number = number & Int8.min
//            count += 1
//            print("change Number \(number)")
//        }
//        while number != 0 {
//            count += 1
//            number = (number - 1) & number
//        }
        return count
    }
}

var digit: Int8 = -1

print("\(digit)的二进制中含有 \(Numbers.init().ASSICCOneOfNumber(number: &digit))个1")
//=============================== END ======================================


