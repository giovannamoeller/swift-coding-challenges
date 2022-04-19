/*:
 ## Mini-Max Sum
 Given five positive integers, find the minimum and maximum values that can be calculated by summing exactly four of the five integers. Then print the respective minimum and maximum values as a single line of two space-separated long integers.
 ### Solution
 */
import UIKit

func miniMaxSum(arr: [Int]) -> Void {
  
  var maxArray: [Int] = []
  var minArray: [Int] = []
  
  minArray = arr.sorted { a, b in
    a > b
  }
  
  maxArray = arr.sorted { a, b in
    a < b
  }
  
  var minSum: Int = 0
  var maxSum: Int = 0
  
  for i in 0..<minArray.count - 1 {
    minSum += minArray[i]
  }
  
  for i in 0..<maxArray.count - 1 {
    maxSum += maxArray[i]
  }
  
  print(maxSum, minSum)
    
  var maxValue = 0
  var minValue = Int.max
  
  var i = 0
  
  for element in arr {
    if i < arr.count - 1 {
      if element > arr[i + 1] && element > maxValue {
        maxValue = element
      } else if arr[i + 1] > element && arr[i + 1] > maxValue {
        maxValue = arr[i + 1]
        if minValue > element {
          minValue = element
        }
      }
    }
    i += 1
  }
  
  print(maxValue, minValue)
  // or: arr.max(), arr.min()
}

miniMaxSum(arr: [1, 3, 5, 7, 9])
miniMaxSum(arr: [10, 15, 13, 14, 19, 3, 2, 38, 10])

