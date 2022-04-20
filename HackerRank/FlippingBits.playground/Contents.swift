/*:
 ## Flipping Bits
 You will be given a list of 32 bit unsigned integers. Flip all the bits (1 -> 0) and (0 -> 1) and return the result as an unsigned integer.
 ### Solution
 */
import UIKit

func flippingBits(n: Int) -> Int {
  let binary: String = convertDecimalToBinary(n)
  let binary32: String = convertTo32(binary)
  let invertedBinary: String = invertBinary(binary32)
  return convertBinaryToDecimal(invertedBinary)
}

func convertDecimalToBinary(_ n: Int) -> String {
  var number: Int = n
  var result: Int = 1
  var rest: Int = 0
  var bit: String = ""
  while result != 0 {
    rest = number % 2
    result = number / 2
    bit += String(rest)
    number = result
  }
  return String(bit.reversed())
}

func convertTo32(_ binary: String) -> String {
  var binaryString = binary
  while binaryString.count < 32 {
    binaryString.insert("0", at: binaryString.startIndex)
  }
  return binaryString
}

func invertBinary(_ binary: String) -> String {
  var newBinary: String = ""
  for b in binary {
    if b == "0" { newBinary.append("1") }
    else if b == "1" { newBinary.append("0") }
  }
  return newBinary
}

func convertBinaryToDecimal(_ binary: String) -> Int {
  var decimalValue: Int = 0
  var currentCharactere: String = ""
  for i in 0..<binary.count {
    currentCharactere = String(binary[binary.index(binary.startIndex, offsetBy: i)])
    guard let currentBinaryValue = Int(currentCharactere) else { return 0 }
    decimalValue += currentBinaryValue * Int(pow(Double(2), Double((binary.count - 1) - i)))
  }
  return decimalValue
}

flippingBits(n: 4)
flippingBits(n: 67108864)
flippingBits(n: 256)
