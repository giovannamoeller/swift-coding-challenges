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
