protocol State {
    func on(printer: Printer)
    func off(printer: Printer)
    func printDocument(printer: Printer)
}

// 1) состояние включен
class OnState: State {
    func on(printer: Printer) {
        print("it is on already")
    }
    
    func off(printer: Printer) {
        print("turning printer off")
        printer.set(state: OffState())
    }
    
    // если печатаем, то переходим в другое состояние
    func printDocument(printer: Printer) {
        print("printing Document")
        printer.set(state: Print())
    }
}

// 2) состояние off
class OffState: State {
    func on(printer: Printer) {
        print("turning printer on")
        printer.set(state: OnState())
    }
    
    func off(printer: Printer) {
        print("it is off already")
    }
    
    func printDocument(printer: Printer) {
        print("it is off. Please turn printer on")
    }
}

// 3) состояние  print
class Print: State {
    func on(printer: Printer) {
        print("it is on already")
    }
    
    func off(printer: Printer) {
        print("turning printer off")
        printer.set(state: OffState())
    }
    
    // если печатаем, то переходим в другое состояние
    func printDocument(printer: Printer) {
        print("it is already print")
    }
}


class Printer {
    var state: State
    
    init() {
        self.state = OnState()
    }
    
    func set(state: State) {
        self.state = state
    }

    func turnOn() {
        state.on(printer: self)
    }
    
    func turnOff() {
        state.off(printer: self)
    }
    
    func printDocument() {
        state.printDocument(printer: self)
    }
}


let printer = Printer()
printer.printDocument()
printer.turnOn()
printer.turnOff()
printer.printDocument()
printer.turnOn()
printer.turnOn()
