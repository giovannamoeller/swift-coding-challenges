import UIKit
import Foundation

func camelCase(str: String) {
  let strArray = str.components(separatedBy: ";")
  
  let operation = strArray[0]
  let typeOfData = strArray[1]
  var words = strArray[2]
  
  var finalStr: String = ""
  
  switch operation {
  case "S": // Split
    switch typeOfData {
    case "M":
      for character in words {
        if character.isUppercase {
          guard let index = words.firstIndex(of: character) else { fatalError("Erro") }
          words.remove(at: index)
          words.insert(Character(character.lowercased()), at: index)
          words.insert(" ", at: index)
        }
      }
      if words.contains("()") {
        finalStr = String(words.dropLast(2))
      }
    case "C":
      for character in words {
        if character.isUppercase {
          guard let index = words.firstIndex(of: character) else { fatalError("Erro") }
          words.remove(at: index)
          words.insert(Character(character.lowercased()), at: index)
          if words.description.distance(from: index, to: words.startIndex) != 0 {
            words.insert(" ", at: index)
          }
      }
    }
    finalStr = words
  case "V":
    for character in words {
      if character.isUppercase {
        guard let index = words.firstIndex(of: character) else { fatalError("Erro") }
        words.remove(at: index)
        words.insert(Character(character.lowercased()), at: index)
        words.insert(" ", at: index)
      }
    }
    finalStr = words
  default: fatalError("Type of Data Unknown")
  }
    
case "C": // Combine
  let stringSeparatedBySpace = words.components(separatedBy: " ")
  switch typeOfData {
  case "M":
    for i in 0..<stringSeparatedBySpace.count {
      finalStr += (i != 0 ? capitalizeFirstLetterOfString(stringSeparatedBySpace[i]) : stringSeparatedBySpace[i])
    }
    finalStr += "()" // Method
  case "C":
    for i in 0..<stringSeparatedBySpace.count {
      finalStr += capitalizeFirstLetterOfString(stringSeparatedBySpace[i])
    }
  case "V":
    for i in 0..<stringSeparatedBySpace.count {
      finalStr += (i != 0 ? capitalizeFirstLetterOfString(stringSeparatedBySpace[i]) : stringSeparatedBySpace[i])
    }
  default: fatalError("Type of Data Unknown")
  }
default: fatalError("Operation Unknown!")
}
}

func capitalizeFirstLetterOfString(_ str: String) -> String {
  return str.prefix(1).uppercased() + String(str.dropFirst())
}


camelCase(str: "S;M;plasticCup()")
camelCase(str: "C;V;mobile phone")
camelCase(str: "C;C;coffee machine")
camelCase(str: "S;C;LargeSoftwareBook")
camelCase(str: "C;M;white sheet of paper")
camelCase(str: "S;V;pictureFrame")
camelCase(str: "S;V;iPad")
camelCase(str: "C;M;mouse pad")
camelCase(str: "C;C;code swarm")
camelCase(str: "S;C;OrangeHighlighter")
camelCase(str: "S;C;IAmHungry")

