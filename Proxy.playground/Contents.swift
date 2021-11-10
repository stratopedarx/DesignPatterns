
// 1) это виртуальный прокси
/*
class User {
    let id = 123
}

// определяет какие методы для прокси и сервера
protocol ServerProtocol {
    func grandAccess(user: User)
    func denyAccess(user: User)
}

class ServerSide: ServerProtocol {
    func grandAccess(user: User) {
        print("grandAccess to user with id: \(user.id)")
    }
    
    func denyAccess(user: User) {
        print("denyAccess to user with id: \(user.id)")
    }
}

class ServerProxy: ServerProtocol {
    lazy private var server: ServerSide = ServerSide()
    
    func grandAccess(user: User) {
        server.grandAccess(user: user)
    }
    
    func denyAccess(user: User) {
        server.denyAccess(user: user)
    }
}

let user = User()
let proxy = ServerProxy()
proxy.grandAccess(user: user)
proxy.denyAccess(user: user)
*/

// -------------

// 2) заoитный прокси

class User {
    let name = "Petr"
    let password = "123"
}

protocol ServerProtocol {
    func grandAccess(user: User)
}

class ServerSide: ServerProtocol {
    // сервер может только предоставить доступ
    func grandAccess(user: User) {
        print("grandAccess to user with id: \(user.name)")
    }
}

class ServerProxy: ServerProtocol {
    private var server: ServerSide!
    
    func grandAccess(user: User) {
        // нам сначала надо сделать проверку пользователя
        guard server != nil else {
            print("access can not be granted")
            return
        }
        server.grandAccess(user: user)
    }
    
    func authenticate(user: User) {
        guard user.password == "123" else { return }
        print("user authenticated")
        server = ServerSide()  // после проверки создаем сервер
    }
}

let user = User()
let proxy = ServerProxy()
proxy.grandAccess(user: user)  // access can not be granted
proxy.authenticate(user: user)
proxy.grandAccess(user: user)
