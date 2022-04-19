/*:
 ## Lonely Integer
 Given an array of integers, where all elements but one occur twice, find the unique element.
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
