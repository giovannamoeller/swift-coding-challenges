import UIKit

func timeConversion(s: String) -> String {
  
  let lastTwoCharacteres = s.suffix(2)
  let firstTwoCharacteres = s.prefix(2)
  
  let fullStringWithoutTwoFirstAndLastCharacteres = s.suffix(s.count - 2).dropLast(2)
      
  var hour = Int(firstTwoCharacteres)!
  
  if lastTwoCharacteres == "PM" {
    if hour != 12 {
      hour += 12
      if hour == 24 {
        hour = 0
      }
    }
    
  } else if lastTwoCharacteres == "AM" {
    if hour == 12 {
      hour = 0
    }
  }
  
  let str = hour < 10 ? "0\(hour)\(fullStringWithoutTwoFirstAndLastCharacteres)" : "\(hour)\(fullStringWithoutTwoFirstAndLastCharacteres)"
  
  return str
  
}


timeConversion(s: "12:00:00AM")
timeConversion(s: "10:05:45PM")
timeConversion(s: "02:05:45PM")
timeConversion(s: "05:05:45AM")
timeConversion(s: "08:05:45AM")
timeConversion(s: "12:05:45PM")
timeConversion(s: "07:05:45PM")




