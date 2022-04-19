/*:
 ## Divisible Sum Pairs
 Given an array of integers and a positive integer k, determine the number of (i, j) pairs where i < j and ar[i] + ar[j] is divisible by k.
 ### Solution
 */
import UIKit

func divisibleSumPairs(n: Int, k: Int, ar: [Int]) -> Int {
  
  // n -> length of array ar
  // ar -> array
  // k -> k
  
  var validPairs = 0
  
  var pair: (Int, Int) = (0, 0)
  
  for i in 0..<ar.count {
    for j in 0..<ar.count {
      if (ar[i] + ar[j]) % k == 0 && j > i {
        pair = (i, j)
        print(pair)
        validPairs += 1
      }
    }
  }
  return validPairs
}

var ar = [1, 3, 2, 6, 1, 2]
var k = 3

divisibleSumPairs(n: ar.count, k: k, ar: ar)


