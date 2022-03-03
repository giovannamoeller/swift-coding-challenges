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
