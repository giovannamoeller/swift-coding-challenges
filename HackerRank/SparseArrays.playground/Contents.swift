/*:
 ## Sparse Arrays
 There is a collection of input strings and a collection of query strings. For each query string, determine how many times it occurs in the list of input strings. Return an array of the results.
 ### Solution
 */
import UIKit

func matchingStrings(strings: [String], queries: [String]) -> [Int] {
  var results: [Int] = []
  
  for query in queries {
    var roundCount = 0
    
    for string in strings {
      if string == query {
        roundCount += 1
      }
    }
    results.append(roundCount)
  }

  return results
}

var strings = ["def", "de", "fgh"]
var queries = ["de", "lmn", "fgh"]

matchingStrings(strings: strings, queries: queries)
