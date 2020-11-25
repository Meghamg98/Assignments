import Foundation

protocol SendAccountManagerProtocol {
	func accountDetails(account: Account) 
	func availableAmount() -> Float
	func depositeAmount(amount: Float)
	func withdrawAmount(amount: Float)
}

class Account {
	var name: String
	var initialAmount: Float
	var currentAmount: Float
	var accountType: String
	var mobileNumber: Int? = 0
	var email: String? = nil
	var accountNumber = 0
	var transactions: String = " "
	var transactionCount = 0
    
	init(name: String, initialAmount: Float) {
		self.name = name
		self.initialAmount = initialAmount
		self.currentAmount = initialAmount
		self.accountType = " "
		self.accountNumber = 0
	}

	func mobileNumberUpdation(mobileNumber: Int) {
		self.mobileNumber = mobileNumber
		print("\nDear \(self.name), your mobile number \(mobileNumber) is updated successfully")
	}

	func emailUpdation(email: String) {
		self.email = email
		print("Dear \(self.name), your email \(email) is updated successfully")
	}

	func currentBalance() {
		let interestRate: Float = 6.7
		var finalAmount: Float
		let fdTerm = 5

		if(accountType == "SA" || accountType == "CA" || accountType == "RDA") {
			finalAmount = currentAmount + ( currentAmount * interestRate / 365)
			currentAmount = finalAmount
		} else if(accountType == "FD") {
			finalAmount = currentAmount + ((currentAmount * interestRate) / Float(fdTerm))
			currentAmount = finalAmount
		}

		print("The current balance of account \(self.accountNumber):- Rs. \(currentAmount)\n")
	}

	func accountStatement() {
		print("\nTransaction details for account number \(self.accountNumber) is as below:")
		print("\(transactions)\n")
	}

}

extension Account: SendAccountManagerProtocol {

	func accountDetails(account: Account) {
		print("\n-----Account details of \(account.name)-----")
		print("Name: \(account.name)")
		if let mobile = account.mobileNumber {
			print("Mobile Number: \(mobile)")
		} else {
			print("Mobile Number not updated")
		}
		if let eMail = account.email {
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
    
	func depositeAmount(amount: Float) {
		if (self.accountType == "CA" || self.accountType == "SA" || self.accountType == "RDA" || self.accountType == "HLA" || self.accountType == "VLA" || self.accountType == "PLA") {
			transactionCount += 1
			currentAmount += amount
			transactions += "\nTransaction\(transactionCount)   Deposit         \(amount)"

			print("\nDear \(self.name),you have deposited Rs. \(amount). \nThe availble balance is Rs. \(currentAmount)")
		} else if(self.accountType == "FDA" ) {
			print("Fixed deposit supports only one time deposition. You have already deposited Rs. \(initialAmount)")
		} else {
			print("Invalid account type")
		}
	}

	func withdrawAmount(amount: Float) {
		if (self.accountType == "CA" || self.accountType == "SA") {
			if ((self.currentAmount - amount) >= 0) {
				transactionCount += 1
				currentAmount -= amount
				transactions += "\nTransaction\(transactionCount)   Withdrawal      \(amount)"

				print("\nDear \(self.name), you have withdrawed Rs. \(amount).\nThe avilable balance is Rs. \(currentAmount)")
			}
		} else {
			print("\nCan not withdraw money from \(self.accountType) account ")
		}
	}
	
}

class AccountManager {

	var generatedAccountNumber = 6330678420000
	var listOfAccounts: [SendAccountManagerProtocol]
	var requests: [Request]
    
	init() {
		self.listOfAccounts = [SendAccountManagerProtocol]()
		self.requests = [Request]()
	}

	func createAccountNumber(account: Account) -> Int {
		generatedAccountNumber += 1
	
		print("\nHi \(account.name), your account is created successfully. \nYour Account number is \(generatedAccountNumber)")
		return generatedAccountNumber
	}

	func addAccount(account: Account) {
		self.listOfAccounts.append(account)
	}

	func queryCurrentBalance(account: Account) {
		print("Current Balance of account number \(account.accountNumber) is \(account.availableAmount())")
	}
	
	func obtainAccountStatement(account: Account) {
		account.accountStatement()
	}

	func sendAccountDetails(account: Account) {
		account.accountDetails(account: account)
		
	}

    func sendMailId(account: Account, mailId: String) {
		account.emailUpdation(email: mailId)
	}
	
	func sendMobileNumber(account: Account, mobNo: Int) {
		account.mobileNumberUpdation(mobileNumber: mobNo)
	}
	
	func depositeAmount(account: Account, amount: Float) {
		account.depositeAmount(amount: amount)
	}

	func withdrawAmount(account: Account, amount: Float) {
		account.withdrawAmount(amount: amount)
	}

	func addRequest(request: Request) {
		self.requests.append(request)
	}

	func processing() {
		for request in requests {
			switch(request.request) {
				case "Deposit": 
					self.depositeAmount(account: request.account, amount: request.cash)
				case "Withdrawal": 
					self.withdrawAmount(account: request.account, amount: request.cash)
				case "BalanceQuery": 
					self.queryCurrentBalance(account: request.account)
				case "AccountStatement":
				    self.obtainAccountStatement(account: request.account)
				case "AccountDetails":
				    self.sendAccountDetails(account: request.account)
				case "UpdateMobileNumber":
				    self.sendMobileNumber(account: request.account, mobNo: request.mobNo)
				case "UpdateEmailId":
				    self.sendMailId(account: request.account, mailId: request.mailId)
				default: 
					print("Invalid request")
			}
		}
	}
}

class Request {
	var request: String
	var account: Account
	var cash: Float = 0
	var mailId: String = " "
	var mobNo: Int = 0

	init (request: String, account: Account) {
		self.request = request
		self.account = account
	}
	
	init (request: String, account: Account, cash: Float) {
		self.request = request
		self.account = account
		self.cash = cash
	}
	
	init (request: String, account: Account, mailId: String) {
		self.request = request
		self.account = account
		self.mailId = mailId
	}
	
	init (request: String, account: Account, mobNo: Int) {
		self.request = request
		self.account = account
		self.mobNo = mobNo
	}
}


var manager1 = AccountManager()

var person1 = Account(name: "Megha", initialAmount: 5000.0)
person1.accountNumber = manager1.createAccountNumber(account: person1)
person1.currentBalance()
person1.mobileNumberUpdation(mobileNumber: 9481255247)
person1.emailUpdation(email: "megha.mg@robosoftin.com")

var person2 = Account(name: "Anitha", initialAmount: 2000.0)
person2.accountNumber = manager1.createAccountNumber(account: person2)
person2.currentBalance()
person2.mobileNumberUpdation(mobileNumber: 8970082930)
person2.emailUpdation(email: "anithashet@yahoo.com")

person1.accountType = "SA"
person2.accountType = "VLA"

manager1.addAccount(account: person1)
manager1.addAccount(account: person2)

person1.depositeAmount(amount: 5000.0)
person2.withdrawAmount(amount:1000.0)
person1.withdrawAmount(amount: 400.0)
person2.depositeAmount(amount:3000.0)
person1.depositeAmount(amount: 1400.0)
person2.withdrawAmount(amount:240.0)
person1.withdrawAmount(amount: 1300.0)
person2.depositeAmount(amount:500.0)

manager1.sendAccountDetails(account: person1)
manager1.sendAccountDetails(account: person2)

person1.currentBalance()
person1.accountStatement()

person2.currentBalance()
person2.accountStatement()

var totalNumberOfAccount = manager1.listOfAccounts.count
print("Total number of accounts in the bank: \(totalNumberOfAccount)")

manager1.depositeAmount(account: person1, amount:1000)
person1.accountStatement()

manager1.queryCurrentBalance(account: person2)


// Requests from various customers
var person3 = Account(name: "Manohar", initialAmount: 25000.0)
person3.accountNumber = manager1.createAccountNumber(account: person3)

var person4 = Account(name: "Manya", initialAmount: 1000.0)
person4.accountNumber = manager1.createAccountNumber(account: person4)
person4.accountType = "SA"

var request1 = Request(request: "BalanceQuery", account: person3)
var request2 = Request(request: "Deposit", account: person4, cash: 10500)
var request3 = Request(request: "Withdrawal", account: person4, cash: 2500)
var request4 = Request(request: "Deposit", account: person4, cash: 500)
var request5 = Request(request: "AccountStatement", account: person4)
var request6 = Request(request: "UpdateMobileNumber", account: person4, mobNo: 9113956314)
var request7 = Request(request: "UpdateEmailId", account: person4, mailId: "manya@gmail.com")
var request8 = Request(request: "AccountDetails", account: person4)


manager1.addRequest(request: request1)
manager1.addRequest(request: request2)
manager1.addRequest(request: request3)
manager1.addRequest(request: request4)
manager1.addRequest(request: request5)
manager1.addRequest(request: request6)
manager1.addRequest(request: request7)
manager1.addRequest(request: request8)
manager1.processing()
