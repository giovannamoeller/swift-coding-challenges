import UIKit

// Coding Challenge - Access Control

struct SwiftBank {
    private let password: String
    private var balance: Double = 0 {
        didSet {
            if balance < 100 {
                displayLowBalanceMessage()
            }
        }
    }
    static var numberOfDepositesMoreThanThousand: Int = 0
    static let depositBonusRate: Double = 0.01
    
    init(initialDeposit: Double, password: String) {
        self.password = password
        makeDeposit(ofAmount: initialDeposit)
    }
    
    private func isValid(_ enteredPassword: String) -> Bool {
        return enteredPassword == self.password
    }
    
    
    mutating private func finalDepositWithBonus(fromInitialDeposit deposit: Double) -> Double {
        if deposit >= 1000 && SwiftBank.numberOfDepositesMoreThanThousand == 0 { // only gives the deposit bonus the first time a user makes a deposit of $1000 or more.
            SwiftBank.numberOfDepositesMoreThanThousand += 1
            return deposit + (deposit * SwiftBank.depositBonusRate)
        } else {
            return deposit
        }
    }
    
    mutating func makeDeposit(ofAmount depositAmount: Double) {
        if depositAmount <= 0 {
            print("You can't make a negative or null deposit")
            return
        }
        balance += finalDepositWithBonus(fromInitialDeposit: depositAmount)
        print("Making a $\(depositAmount) deposit")
    }
    
    func displayBalance(usingPassword password: String) {
        if(!isValid(password)) {
            print("Error: Invalid Password. Cannot retrieve balance")
            return
        } else {
            print("Your current balance is $\(balance)")
        }
    }
    
    mutating func makeWithdrawal(ofAmount withdrawal: Double, usingPassword password: String) {
        if withdrawal <= 0 {
            print("You can't make a negative or null withdrawal.")
            return
        } else if withdrawal > balance {
            print("You can't make a withdrawal more than your current balance.")
            return
        }
        if(!isValid(password)) {
            print("Error: Invalid Password. Cannot make withdrawal")
            return
        } else {
            balance -= withdrawal
            print("Making a $\(withdrawal) withdrawal")
        }
    }
    
    private func displayLowBalanceMessage() {
        print("Alert: Your balance is under $100")
    }
}

var myAccount = SwiftBank(initialDeposit: 500, password: "password")
myAccount.makeDeposit(ofAmount: 50)
myAccount.makeWithdrawal(ofAmount: 60000, usingPassword: "incorrect")
myAccount.makeWithdrawal(ofAmount: 100, usingPassword: "password")
myAccount.displayBalance(usingPassword: "password")
