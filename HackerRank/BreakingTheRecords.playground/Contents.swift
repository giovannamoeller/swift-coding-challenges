/*:
 ## Breaking The Records
 Maria plays college basketball and wants to go pro. Each season she maintains a record of her play. She tabulates the number of times she breaks her season record for most points and least points in a game. Points scored in the first game establish her record for the season, and she begins counting from there.
 ### Solution
 */
import UIKit

func breakingRecords(scores: [Int]) -> [Int] {
  
  var min: Int = 0
  var max: Int = 0
  
  var breakingLeastPointsRecords = 0
  var breakingMostPointsRecords = 0

  for i in 0..<scores.count {
    if i == 0 {
      min = scores[i]
      max = scores[i]
    } else if scores[i] > scores[i - 1] {
      if scores[i] > max {
        max = scores[i]
        breakingMostPointsRecords += 1
      }
    } else {
      if scores[i] < min {
        min = scores[i]
        breakingLeastPointsRecords += 1
      }
    }
  }
  return [breakingMostPointsRecords, breakingLeastPointsRecords]
  
}

breakingRecords(scores: [10, 5, 20, 20, 4, 5, 2, 25, 1])
breakingRecords(scores: [3, 4, 21, 36, 10, 28, 35, 5, 24, 42])

