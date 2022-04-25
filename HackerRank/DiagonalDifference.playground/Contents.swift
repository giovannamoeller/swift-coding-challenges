/*:
 ## Diagonal Difference
 Given a square matrix, calculate the absolute difference between the sums of its diagonals.
 ### Solution
 */

import Foundation

func diagonalDifference(arr: [[Int]]) -> Int {
  
  var firstDiagonalSum = 0
  var secondDiagonalSum = 0
  let n = arr.count - 1
  
  for i in 0..<arr.count {
    for j in 0..<arr.count {
      if i == j {
        firstDiagonalSum += arr[i][j]
      }
    }
  }
  
  for k in stride(from: n, to: -1, by: -1) {
    // k = 2 -> arr[2][0] - 3 1
    // k = 1 -> arr[1][1] - 2 2
    // k = 0 -> arr[0][2] - 1 3
    secondDiagonalSum += arr[k][n - k]
  }
    
  return abs(firstDiagonalSum - secondDiagonalSum)
}

diagonalDifference(arr: [[1, 2, 3], [4, 5, 6], [9, 8, 9]])
diagonalDifference(arr: [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]])
