/*:
 ## Plus Minus
 Given an array of integers, calculate the ratios of its elements that are positive, negative, and zero. Print the decimal value of each fraction on a new line with 6 places after the decimal.
 ### Solution
 */
import UIKit

func lonelyInteger(a: [Int]) -> Int {
 
  var lonelyValue: Int = 0
  var b: [Int] = []
  
  for i in 0..<a.count {
    for j in (i + 1)..<a.count {
      if a[i] == a[j] {
        b.append(a[i])
      }
    }
  }
  
  for number in a {
    if !(b.contains(number)) { lonelyValue = number }
  }
  
  return lonelyValue
}

lonelyInteger(a: [1, 2, 3, 4, 3, 2, 1])
lonelyInteger(a: [1, 2, 3, 3, 5, 2, 2, 5, 7, 3, 1])


import UIKit

func plusMinus(arr: [Int]) -> Void {
    // Write your code here
    
    var positive = 0
    var negative = 0
    var zero = 0
    
    for integer in arr {
        switch integer {
            case let value where value > 0:
                positive += 1
            case let value where value < 0:
                negative += 1
            default: zero += 1
        }
    }
    
    calculateResult(for: positive, arr.count)
    calculateResult(for: negative, arr.count)
    calculateResult(for: zero, arr.count)

}

func calculateResult(for type: Int, _ count: Int) {
    let result = Double(type) / Double(count)
    print(roundNumber(result))
}

func roundNumber(_ number: Double) -> Double {
    return Double(round(1000000 * number) / 1000000)
}

plusMinus(arr: [-4, 3, -9, 0, 4, 1])
plusMinus(arr: [-1, 1, 0, -1, -1])
