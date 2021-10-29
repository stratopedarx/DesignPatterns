class Account {
    var accountName: String
    var balance: Int
    
    init(accountName: String, balance: Int) {
        self.accountName = accountName
        self.balance = balance
    }
}

// определяем поведение депозита и вывода
protocol Command {
    var isComplete: Bool { get set }  // для отслеживания была ли закончена операция или нет
    func execute()
}

class Deposit: Command {
    var isComplete = false
    private var _account: Account
    private var _amount: Int  // количество денег, которые вносим или пытаемся вывести со счета
    
    init(account: Account, amount: Int) {
        self._account = account
        self._amount = amount
    }
    
    func execute() {
        _account.balance += _amount
        isComplete = true
    }
}

class Withdraw: Command {
    var isComplete = false
    private var _account: Account
    private var _amount: Int  // количество денег, которые вносим или пытаемся вывести со счета

    init(account: Account, amount: Int) {
        self._account = account
        self._amount = amount
    }

    func execute() {
        if _account.balance >= _amount {
            _account.balance -= _amount
            isComplete = true
        } else {
            print("Not enough money")
        }
    }
}

// теперь создадим менеджера транзакций
// будет одиночка, которая хранит в себе операции, которые ему надо будет выполнить
class TransactionManager {
    static let shared = TransactionManager()
    private init() {}
    
    var pendingTransactions: [Command] {  // показывает все операции, которые не закончились
        get {
            return _transactions.filter { $0.isComplete == false }
        }
    }
    // это ключевой момент этого паттерна, менеджер ничего не знает об аккаунтах, он просто знает какие команды ему надо выполнить.
    // и всё. Менеджер имеет несколько методово.
    private var _transactions: [Command] = []
    
    func addTransactions(command: Command) {
        _transactions.append(command)
    }
    
    func processingTransactions() {
        // проверить какие транзакции не закончены, и их законить
        _transactions.filter { $0.isComplete == false }.forEach { $0.execute() }
    }
}

let account = Account(accountName: "Sergey", balance: 1000)
let transactionManager = TransactionManager.shared

transactionManager.addTransactions(command: Deposit(account: account, amount: 100))
transactionManager.addTransactions(command: Withdraw(account: account, amount: 1200))
transactionManager.pendingTransactions
account.balance
transactionManager.processingTransactions()
account.balance
