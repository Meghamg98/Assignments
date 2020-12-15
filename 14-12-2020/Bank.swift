import Foundation

enum BankOperations: String {
    case deposit
    case withdraw
    case balanceCheck
    case accountStatement
    case accountDetails
    case updatePhoneNumber
    case updateEmailId
}

enum InterestRate: Float {
    case savingInterestRate = 3.7
    case currentInterestRate = 4.9
    case fixedInterestRate = 5.5
    case recurringInterestRate = 5.3
    case vehicleLoanInterestRate = 7.8
    case homeLoanInterestRate = 9.6
    case personalInterestRate = 11.2
}

enum AccountType: String {
    case saving
    case current
    case fixed
    case recurring
    case homeLoan
    case vehicleLoan
    case personalLoan
}

class Bank {
    var name: String
    var address: String
    var ifscCode: String
    var accounts = [Account]()
    var managers = [Manager]()
    var generatedAccountNumber = 6330678420000
    
    init(name: String, address: String, ifscCode: String) {
        self.name = name
        self.address = address
        self.ifscCode = ifscCode
    }
    
    func createAccountNumber(account: Account) {
        generatedAccountNumber += 1
        print("\nHi \(account.name), your account is created successfully. \nYour Account number is \(generatedAccountNumber)")
        account.accountNumber = generatedAccountNumber
    }
    
    func addAccount(account: Account) {
        self.accounts.append(account)
    }
    
    func addManager(manager: Manager) {
        self.managers.append(manager)
    }
}

protocol DepositProtocol {
    func depositAmount(amount: Float)
}

protocol WithdrawProtocol {
    func withdrawAmount(amount: Float)
}

protocol AccountStatementProtocol {
    func accountStatement(numberOfTransations: Int)
}

class Account {
    var name: String
    var accountType: AccountType
    var initialAmount: Float
    var phoneNumber: Int? = nil
    var emailId: String? = nil
    var currentAmount: Float
    var accountNumber = 0
    var transactions = [String]()
    var transactionCount = 0
    
    init(name: String, accountType: AccountType, initialAmount: Float) {
        self.name = name
        self.accountType = accountType
        self.initialAmount = initialAmount
        self.currentAmount = initialAmount
        self.accountNumber = 0
    }
    
    func mobileNumberUpdation(phoneNumber: Int) {
        self.phoneNumber = phoneNumber
        print("\nDear \(self.name), your phone number \(phoneNumber) is updated successfully")
    }
    
    func emailUpdation(emailId: String) {
        self.emailId = emailId
        print("\nDear \(self.name), your email \(emailId) is updated successfully")
    }
    
    func currentBalance() -> Float {
        var finalAmount: Float
        
        finalAmount = currentAmount + ( currentAmount * 5.5 / 365)
        currentAmount = finalAmount
        return currentAmount
    }
    
    func accountDetails(account: Account) {
        print("\n-----Account details of \(account.name)-----")
        print("Name: \(account.name)")
        
        if let phone = account.phoneNumber {
            print("Phone Number: \(phone)")
        } else {
            print("Phone Number not updated")
        }
        if let eMail = account.emailId {
            print("E-mail ID: \(eMail)")
        }else {
            print("E-mail ID not updated")
        }
        
        print("Account number: \(account.accountNumber)")
        print("Account type: \(account.accountType)")
        print("Current balance: \(account.currentAmount)")
    }
    
    func availableAmount() -> Float {
        return currentAmount
    }
}

class CaSaAccount: Account, DepositProtocol, WithdrawProtocol, AccountStatementProtocol {
    let savingsRate = InterestRate.savingInterestRate
    let currentRate = InterestRate.currentInterestRate
    
    override func currentBalance() -> Float {
        var finalAmount: Float
        
        if(accountType == AccountType.current) {
            finalAmount = currentAmount + ( currentAmount * currentRate.rawValue / 365)
            currentAmount = finalAmount
            
            return currentAmount
        } else {
            finalAmount = currentAmount + ( currentAmount * savingsRate.rawValue / 365)
            currentAmount = finalAmount
            
            return currentAmount
        }
    }
    
    func accountStatement(numberOfTransations: Int) {
        var count = 0
        var length = transactions.count
        print("\nLast \(numberOfTransations) Transaction details for account number \(self.accountNumber) is as below:")
        while(count != numberOfTransations && length != 0) {
            print(transactions[length - 1])
            length -= 1
            count += 1
        }
    }

    func depositAmount(amount: Float) {
        transactionCount += 1
        currentAmount += amount
        transactions += ["Transaction\(transactionCount)\t Deposit \t\t\(amount)"]
        
        print("\nYou have deposited Rs. \(amount). \nThe availble balance is Rs. \(currentAmount)")
    }
        
    func withdrawAmount(amount: Float) {
        if ((self.currentAmount - amount) >= 0) {
        transactionCount += 1
        currentAmount -= amount
        transactions += ["Transaction\(transactionCount)\t Withdrawal \t\(amount)"]
        
        print("\nYou have withdrawed Rs. \(amount).\nThe avilable balance is Rs. \(currentAmount)")
        }
    }
}

class FixedAccount: Account {
    let fixedRate = InterestRate.fixedInterestRate
    let fdTerm = 10
    
    override func currentBalance() -> Float{
        var finalAmount: Float
        
        finalAmount = currentAmount + ( currentAmount * fixedRate.rawValue * Float(fdTerm) / 365)
        currentAmount = finalAmount
        
        return currentAmount
    }
}

class RecurringAccount: Account, DepositProtocol, AccountStatementProtocol {
    let recurringRate = InterestRate.recurringInterestRate
    
    override func currentBalance() -> Float {
        var finalAmount: Float
        
        finalAmount = currentAmount + ( currentAmount * recurringRate.rawValue / 365)
        currentAmount = finalAmount
        
        return currentAmount
    }
    
    func accountStatement(numberOfTransations: Int) {
        var count = 0
        var length = transactions.count
        print("\nLast \(numberOfTransations) Transaction details for account number \(self.accountNumber) is as below:")
        while(count != numberOfTransations && length != 0) {
            print(transactions[length - 1])
            length -= 1
            count += 1
        }
    }
    
    func depositAmount(amount: Float) {
        transactionCount += 1
        currentAmount += amount
        transactions += ["Transaction\(transactionCount)\t Deposit \t\t\(amount)"]
        
        print("\nYou have deposited Rs. \(amount). \nThe availble balance is Rs. \(currentAmount)")
    }

}

class LoanAccount: Account, DepositProtocol, AccountStatementProtocol {
    let peronalLoanRate = InterestRate.personalInterestRate
    let homeLoanRate = InterestRate.homeLoanInterestRate
    let vehicleLoanRate = InterestRate.vehicleLoanInterestRate
    
    
    override func currentBalance() -> Float {
        var finalAmount: Float
        
        if(accountType == AccountType.vehicleLoan) {
            finalAmount = currentAmount + ( currentAmount * vehicleLoanRate.rawValue / 365)
            currentAmount = finalAmount
            
            return currentAmount
        } else if (accountType == AccountType.homeLoan){
            finalAmount = currentAmount + ( currentAmount * homeLoanRate.rawValue / 365)
            currentAmount = finalAmount
            
            return currentAmount
        } else if (accountType == AccountType.personalLoan) {
            finalAmount = currentAmount + ( currentAmount * peronalLoanRate.rawValue / 365)
            currentAmount = finalAmount
            
            return currentAmount
        }
        return 0.0
    }
    
    func accountStatement(numberOfTransations: Int) {
        var count = 0
        var length = transactions.count
        print("\nLast \(numberOfTransations) Transaction details for account number \(self.accountNumber) is as below:")
        while(count != numberOfTransations && length != 0) {
            print(transactions[length - 1])
            length -= 1
            count += 1
        }
    }

    func depositAmount(amount: Float) {
        transactionCount += 1
        currentAmount += amount
        transactions += ["Transaction\(transactionCount)\t Deposit \t\t\(amount)"]
        
        print("\nYou have deposited Rs. \(amount). \nThe availble balance is Rs. \(currentAmount)")
    }
}

class Manager {
    var managerName: String
    var accounts: [Account]
    var requests: [Request]
    var accountDictionary = [Int: Account]()
    
    init(managerName: String) {
        self.managerName = managerName
        self.accounts = [Account]()
        self.requests = [Request]()
        self.accountDictionary = [Int: Account]()
    }
    
    func addToDictionary(account: Account) {
        self.accountDictionary[account.accountNumber] = account
    }
    
    func process() {
        for request in requests {
            switch(request.request) {
                case BankOperations.deposit:
                    self.depositAmount(accNum: request.accNum, amount: request.amount)
                case BankOperations.withdraw:
                    self.withdrawAmount(accNum: request.accNum, amount: request.amount)
                case BankOperations.balanceCheck:
                    self.queryCurrentBalance(accNum: request.accNum)
                case BankOperations.accountStatement:
                    self.obtainAccountStatement(accNum: request.accNum, numberOfTransations: request.numberOfTrans)
                case BankOperations.accountDetails:
                    self.sendAccountDetails(accNum: request.accNum)
                case BankOperations.updatePhoneNumber:
                    self.sendMobileNumber(accNum: request.accNum, mobileNumber: request.mobileNumber)
                case BankOperations.updateEmailId:
                    self.sendMailId(accNum: request.accNum, mailId: request.mailId)
            }
        }
    }
    
    func addRequest(request: Request) {
        self.requests.append(request)
    }
    
    func emptyRequestArray() {
        self.requests.removeAll()
    }
    
    func queryCurrentBalance(accNum: Int) {
        let keyExists = accountDictionary[accNum] != nil
        if keyExists {
            if let temp = accountDictionary[accNum] {
                let account = temp
                print("\nCurrent Balance of account number \(account.accountNumber) is \(account.currentBalance())")
            }
        }else {
            print("The account number is invalid")
        }
    }
    
    func obtainAccountStatement(accNum: Int, numberOfTransations: Int) {
        let keyExists = accountDictionary[accNum] != nil
        if keyExists {
            let account = accountDictionary[accNum]
            if let temp = account as? CaSaAccount {
                temp.accountStatement(numberOfTransations: numberOfTransations)
            } else if let temp = account as? RecurringAccount {
                temp.accountStatement(numberOfTransations: numberOfTransations)
            } else if let temp = account as? LoanAccount {
                temp.accountStatement(numberOfTransations: numberOfTransations)
            }
        } else {
            print("The account number is invalid")
        }
    }

    func sendAccountDetails(accNum: Int) {
        let keyExists = accountDictionary[accNum] != nil
        if keyExists {
            if let temp = accountDictionary[accNum] {
                let account = temp
                account.accountDetails(account: account)
            }
        }else {
            print("The account number is invalid")
        }
    }
    
    func sendMailId(accNum: Int, mailId: String) {
        let keyExists = accountDictionary[accNum] != nil
        if keyExists {
            if let temp = accountDictionary[accNum] {
                let account = temp
                account.emailUpdation(emailId: mailId)
            }
        }else {
            print("The account number is invalid")
        }
    }

    func sendMobileNumber(accNum: Int, mobileNumber: Int) {
        let keyExists = accountDictionary[accNum] != nil
        if keyExists {
            if let temp = accountDictionary[accNum] {
                let account = temp
                account.mobileNumberUpdation(phoneNumber: mobileNumber)
            }
        }else {
            print("The account number is invalid")
        }
    }

    func depositAmount(accNum: Int, amount: Float) {
        let keyExists = accountDictionary[accNum] != nil
        if keyExists {
            let account = accountDictionary[accNum]
            if let temp = account as? CaSaAccount {
                temp.depositAmount(amount: amount)
            } else if let temp = account as? RecurringAccount {
                temp.depositAmount(amount: amount)
            } else if let temp = account as? LoanAccount {
                temp.depositAmount(amount: amount)
            }
        } else {
            print("The account number is invalid")
        }
    }
    
    func withdrawAmount(accNum: Int, amount: Float) {
        let keyExists = accountDictionary[accNum] != nil
        if keyExists{
            let account = accountDictionary[accNum]
            if let temp = account as? CaSaAccount {
                temp.withdrawAmount(amount: amount)
            } else {
                print("The account number is invalid")
            }
        }
    }
}

class Request {
    var request: BankOperations
    var accNum: Int
    var amount: Float = 0
    var mailId: String = " "
    var mobileNumber: Int = 0
    var numberOfTrans: Int = 0
    
    init (request: BankOperations, accNum: Int) {
        self.request = request
        self.accNum = accNum
    }
    
    init (request: BankOperations, accNum: Int, amount: Float) {
        self.request = request
        self.accNum = accNum
        self.amount = amount
    }
    
    init (request: BankOperations, accNum: Int, mailId: String) {
        self.request = request
        self.accNum = accNum
        self.mailId = mailId
    }
    
    init (request: BankOperations, accNum: Int, mobileNumber: Int) {
        self.request = request
        self.accNum = accNum
        self.mobileNumber = mobileNumber
    }
    
    init (request: BankOperations, accNum: Int, numberOfTrans: Int) {
        self.request = request
        self.accNum = accNum
        self.numberOfTrans = numberOfTrans
    }
}

var canara = Bank(name: "Canara", address: "Udupi", ifscCode: "CNRB0024")
var manager1 = Manager(managerName: "Mr. Ram")

canara.addManager(manager: manager1)

var account1 = CaSaAccount(name: "Megha", accountType: AccountType.saving, initialAmount: 10000.0)
canara.createAccountNumber(account: account1)
var account2 = LoanAccount(name: "Manya", accountType: AccountType.homeLoan, initialAmount: 20000.0)
canara.createAccountNumber(account: account2)

canara.addAccount(account: account1)
canara.addAccount(account: account2)

manager1.addToDictionary(account: account1)
manager1.addToDictionary(account: account2)

var request1 = Request(request: BankOperations.balanceCheck, accNum: 6330678420001)
var request2 = Request(request: BankOperations.withdraw,accNum: 6330678420001, amount: 300)
var request3 = Request(request: BankOperations.deposit,accNum: 6330678420001, amount: 5000)
var request4 = Request(request: BankOperations.withdraw,accNum: 6330678420001, amount: 200)
var request5 = Request(request: BankOperations.deposit,accNum: 6330678420001, amount: 1000)
var request6 = Request(request: BankOperations.withdraw,accNum: 6330678420001, amount: 300)
var request7 = Request(request: BankOperations.deposit,accNum: 6330678420001, amount: 7500)
var request8 = Request(request: BankOperations.withdraw,accNum: 6330678420001, amount: 1500)
var request9 = Request(request: BankOperations.updatePhoneNumber,accNum: 6330678420001, mobileNumber: 9481255247)
var request10 = Request(request: BankOperations.updateEmailId,accNum: 6330678420001, mailId: "megha@gmail.com")
var request11 = Request(request: BankOperations.accountDetails,accNum: 6330678420001)
var request12 = Request(request: BankOperations.accountStatement,accNum: 6330678420001, numberOfTrans: 5)

manager1.addRequest(request: request1)
manager1.addRequest(request: request2)
manager1.addRequest(request: request3)
manager1.addRequest(request: request4)
manager1.addRequest(request: request5)
manager1.addRequest(request: request6)
manager1.addRequest(request: request7)
manager1.addRequest(request: request8)
manager1.addRequest(request: request9)
manager1.addRequest(request: request10)
manager1.addRequest(request: request11)
manager1.addRequest(request: request12)

manager1.process()
manager1.emptyRequestArray()

var request13 = Request(request: BankOperations.balanceCheck,accNum: 6330678420002)
var request14 = Request(request: BankOperations.withdraw,accNum: 6330678420002, amount: 300)
var request15 = Request(request: BankOperations.deposit,accNum: 6330678420002, amount: 5000)
var request16 = Request(request: BankOperations.withdraw,accNum: 6330678420002, amount: 200)
var request17 = Request(request: BankOperations.deposit,accNum: 6330678420002, amount: 1000)
var request18 = Request(request: BankOperations.updatePhoneNumber,accNum: 6330678420002, mobileNumber: 9113956314)
var request19 = Request(request: BankOperations.updateEmailId,accNum: 6330678420002, mailId: "manya@gmail.com")
var request20 = Request(request: BankOperations.accountDetails,accNum: 6330678420002)
var request21 = Request(request: BankOperations.accountStatement,accNum: 6330678420002, numberOfTrans: 4)

manager1.addRequest(request: request13)
manager1.addRequest(request: request14)
manager1.addRequest(request: request15)
manager1.addRequest(request: request16)
manager1.addRequest(request: request17)
manager1.addRequest(request: request18)
manager1.addRequest(request: request19)
manager1.addRequest(request: request20)
manager1.addRequest(request: request21)

manager1.process()
manager1.emptyRequestArray()


var request22 = Request(request: BankOperations.updatePhoneNumber,accNum: 6330, mobileNumber: 9113956314)
manager1.addRequest(request: request22)

manager1.process()
