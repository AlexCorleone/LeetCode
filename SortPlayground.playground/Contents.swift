import UIKit

class ACMindModel {
    
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
    //    sortMethod(sortArray: &sortArray)
    //    print("====\(sortArray)")
    //=================================== END =========================================
    
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
    
    //    let converStrToInt = StringToInteger()
    //    var intResult: Int = converStrToInt.myAutio(str: "+564-91283472332")
    //
    //    print("========result \(intResult)")
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
    //    print("c = \(AddNumber().addTowNumber(numberLeft: 21, numberRight: 241)) == \(UInt8.max)")
    
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
    
    /*
     测试1 [] sum result []
     测试2 [5] sum result []
     测试3 [2, 7] sum 9 result [2, 7]
     测试4 [3 ,6, 9, 9, 15, 23, 32, 44] sum 24  result [(9, 15), (9, 15)]
     测试5 [1, 4, 5, 6, 7, 8, 11, 16, 44, 56, 56, 56, 56, 78, 87, 99] sum 60 result [(4, 56), (4, 56), (4, 56), (4, 56), (16, 44)]
     */
    //    let resultTuple = FindSum.init().findSumInSortAarray(sortArray: [1, 4, 5, 6, 7, 8, 11, 16, 44, 56, 56, 56, 56, 78, 87, 99], sum: 60)
    //    print("++++++++++++++++++result \(resultTuple)")
    
    //================================= END ==========================================
    
}


class ACSortModel {
    
    init() {
        len = 0
    }
    func bubbleSort(sortArray: [Int]) -> [Int] {
        //冒泡排序
        var tempSortArray = sortArray
        let sortArrayCount = sortArray.count
        for i in  0 ..< sortArrayCount {
            
            for j in   0 ..< sortArrayCount - i - 1 {
                if tempSortArray[j] > tempSortArray[j + 1]{
                    let tempValue = tempSortArray[j]
                    tempSortArray[j] = tempSortArray[j + 1]
                    tempSortArray[j + 1] = tempValue
                    print("\(tempSortArray[j]) <----> \(tempSortArray[j+1])  \(tempSortArray)")
                    
                }
            }
        }
        return tempSortArray
    }
    
    func selectionSort(sortArray: [Int]) -> [Int] {
        //选择排序
        var tempSortArray = sortArray
        let sortArrayCount = sortArray.count
        for i in 0 ..< sortArrayCount {
            var minIndex = i;
            for j in minIndex + 1 ..< sortArrayCount {
                if tempSortArray[minIndex] > tempSortArray[j]
                {
                    minIndex = j;
                }
            }
            let tempValue = tempSortArray[i]
            tempSortArray[i] = tempSortArray[minIndex];
            tempSortArray[minIndex] = tempValue
            print("\(tempSortArray[i]) <----> \(tempSortArray[minIndex])  \(tempSortArray)")
        }
        return tempSortArray
    }
    
    func insertionSort(sortArray: [Int]) -> [Int] {
        //插入排序
        var tempSortArray = sortArray
        let sortArrayCount = sortArray.count
        for i in 1 ..< sortArrayCount {
            let tempValue = tempSortArray[i]
            var insertIndex = 0
            for j in 0 ..< i {
                insertIndex = i - 1 - j;
                if tempValue > tempSortArray[insertIndex]
                {
                    insertIndex = i - j;
                    break
                }
                tempSortArray[insertIndex + 1] = tempSortArray[insertIndex];
            }
            tempSortArray[insertIndex] = tempValue;
            print("\(tempSortArray)")
        }
        return tempSortArray
    }
    
    func shellSort(sortArray: [Int]) -> [Int] {
        //希尔排序
        var tempSortArray = sortArray
        let sortArrayCount = sortArray.count
        var gap = 1;
        //        while gap <= sortArrayCount / 3 {
        //            gap = gap * 3 + 1
        //        }
        gap = sortArrayCount / 2 + 1
        while gap > 0 {
            var i = 0
            while i < sortArrayCount {
                var j = i
                while j < sortArrayCount - gap {
                    if tempSortArray[j] > tempSortArray[j + gap] {
                        let temp = tempSortArray[j]
                        tempSortArray[j] = tempSortArray[j + gap]
                        tempSortArray[j + gap] = temp
                        print("\(tempSortArray[j]) <--> \(tempSortArray [j+gap])  === \(tempSortArray)")
                    }
                    j += gap
                }
                i += 1
            }
            gap -= 1
        }
        
        return tempSortArray
    }
    
    
    func mergeSort(sortArray: [Int]) -> [Int] {
        //归并排序
        let sortArrayCount = sortArray.count
        if sortArrayCount < 2 {
            
            return sortArray
        }
        var tempSortArray: [Int] = sortArray;
        let sortMethod = mergeSort
        let sortArrayMiddleIndex = sortArrayCount / 2 - 1
        
        let leftArray: [Int] = [Int]() + tempSortArray[0 ... sortArrayMiddleIndex]
        
        let rightArray: [Int] = [Int]() + tempSortArray[sortArrayMiddleIndex + 1 ... sortArrayCount - 1];
        
        let resultArray =  mergeArray(leftArray: sortMethod(leftArray), rightArray: sortMethod(rightArray))
        print("\(resultArray)")
        return resultArray
    }
    
    
    func mergeArray(leftArray: [Int], rightArray: [Int]) ->[Int] {
        var mergeArray = [Int]()
        var minArray = leftArray.count < rightArray.count ? leftArray : rightArray
        var maxArray = leftArray.count < rightArray.count ? rightArray : leftArray;
        var minIndex = 0, maxIndex = 0
        while minIndex < minArray.count {
            if maxIndex >= maxArray.count {
                mergeArray.append(minArray[minIndex])
                minIndex += 1
                continue
            }
            if  minArray[minIndex] < maxArray[maxIndex] {
                mergeArray.append(minArray[minIndex])
                minIndex += 1
            }else {
                mergeArray.append(maxArray[maxIndex])
                maxIndex += 1
            }
        }
        while minIndex < minArray.count {
            mergeArray.append(maxArray[minIndex])
            minIndex += 1
        }
        while maxIndex < maxArray.count {
            mergeArray.append(maxArray[maxIndex])
            maxIndex += 1
        }
        return mergeArray
    }
    
    func quickSort(sortArray: [Int]) -> [Int] {
        //快速排序
        if sortArray.count <= 1 {
            return sortArray;
        }
        var tempSortArray = sortArray
        quickSortPrivateMethod(sortArray: &tempSortArray, leftIndex: 0, rightIndex: tempSortArray.count - 1)
        return tempSortArray
    }
    
    func quickSortPrivateMethod(sortArray: inout [Int], leftIndex: Int, rightIndex: Int) -> Void {
        
        var left = leftIndex, right = rightIndex, baselineIndex = 0
        if left < right {
            baselineIndex = partition(array: &sortArray, leftIndex: leftIndex, rightIndex: rightIndex)
            print("baseline : \(baselineIndex) <---> \(sortArray[baselineIndex])")
            quickSortPrivateMethod(sortArray: &sortArray, leftIndex: leftIndex, rightIndex: baselineIndex - 1)
            quickSortPrivateMethod(sortArray: &sortArray, leftIndex: baselineIndex + 1, rightIndex: rightIndex)
        }
    }
    
    func partition(array: inout [Int], leftIndex: Int, rightIndex: Int) -> Int {
        var pivot = leftIndex, index = pivot + 1
        var i = index
        while i <= rightIndex {
            if array[i] < array[pivot] {
                swap(array: &array, leftIndex: i, rightIndex: index)
                index += 1
            }
            i += 1
        }
        swap(array: &array, leftIndex: pivot, rightIndex: index - 1)
        return index - 1
    }
    
    func swap( array: inout [Int], leftIndex: Int, rightIndex: Int) -> Void {
        let temp = array[leftIndex];
        array[leftIndex] = array[rightIndex];
        array[rightIndex] = temp;
        print("\(array[leftIndex]) <---> \(array[rightIndex])  \(array)");
        
    }
    
    var len: Int
    func heapSort(sortArray: [Int]) -> [Int] {
        //堆排序
        if sortArray.count <= 1 {
            return sortArray;
        }
        var tempSortArray = sortArray
        buildMaxHeap(array: &tempSortArray)
        
        var index = tempSortArray.count - 1
        while index > 0 {
            swap(array: &tempSortArray, leftIndex: 0, rightIndex: index)
            len -= 1
            heapify(array: &tempSortArray, index: 0)
            index -= 1
            //            print("\(tempSortArray)")
        }
        return tempSortArray
    }
    
    func buildMaxHeap(array: inout [Int]) -> Void {
        len = array.count
        var i = len / 2
        while i >= 0 {
            heapify(array: &array, index: i)
            i -= 1
        }
    }
    
    func heapify(array: inout [Int], index: Int) -> Void {
        var left = 2 * index + 1, right = 2 * index  + 2, largest = index
        if left < len && array[left] > array[largest] {
            largest = left
        }
        if right < len && array[right] > array[largest] {
            largest = right
        }
        if largest != index {
            swap(array: &array, leftIndex: index, rightIndex: largest)
            heapify(array: &array, index: largest)
        }
    }
    
    
    func countingSort(sortArray: inout [Int], maxValue: Int) -> [Int] {
        //计数排序
        var bucketArray: [Int] = Array.init(repeating: 0, count: maxValue + 1 ),
        sortedIndex = 0,
        arrayLen = sortArray.count,
        bucketLen = maxValue + 1
        var i = 0
        while i < arrayLen {
            let key: Int = sortArray[i]
            
            bucketArray[key] += 1
            print("key : \(key) counting : \(bucketArray[key])")
            i += 1
        }
        var j = 0
        while j <  bucketLen {
            while bucketArray[j]  > 0 {
                sortArray[sortedIndex] = j;
                sortedIndex += 1
                bucketArray[j] -= 1
            }
            j += 1
        }
        return sortArray;
}

}

//========================== Test ==================================

var sortModel: ACSortModel = ACSortModel();
var sortArray: [Int] = [7, 6, 5, 44, 3, 6, 7, 8, 55, 3, 9, 2, 7, 4, 1, 22]


print("sortArray === \(sortArray)")
//        //冒泡排序
//        let bubbleSortArray = sortModel.bubbleSort(sortArray: sortArray);
//        print("bubble Sort Result : \(bubbleSortArray)");
//选择排序
//        let selectionSort = sortModel.selectionSort(sortArray: sortArray)
//        print("selection Sort Result : \(selectionSort)")
//        //插入排序
//        let insertionSort = sortModel.insertionSort(sortArray: sortArray)
//        print("insertion Sort Result : \(insertionSort)")
//希尔排序
//        let shellSort = sortModel.shellSort(sortArray: sortArray)
//        print("shell Sort Result : \(shellSort)")
//        //归并排序
//        let mergeSort = sortModel.mergeSort(sortArray: sortArray)
//        print("merge Sort Result : \(mergeSort)")
//        //快速排序
//        let quickSort = sortModel.quickSort(sortArray: sortArray)
//        print("quick Sort Result : \(quickSort)")
//        //堆排序
let heapSort = sortModel.heapSort(sortArray: sortArray)
print("heap Sort Result : \(heapSort)")
//        //计数排序
//        let countingSort = sortModel.countingSort(sortArray: &sortArray, maxValue: 55)
//        print("counting Sort Result : \(countingSort)")
