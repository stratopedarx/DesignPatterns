// MARK: - CAR
protocol Car {
    func drive()
}

class LittleCar: Car {
    func drive() {
        print("drive little size cat")
    }
}


class MiddleCar: Car {
    func drive() {
        print("drive middle size cat")
    }
}

// MARK: - BUS
protocol Bus {
    func drive()
}

class LittleBus: Bus {
    func drive() {
        print("drive little size bus")
    }
}


class MiddleBus: Bus {
    func drive() {
        print("drive middle size bus")
    }
}

// MARK: - FACTORY
// у нас фабрика создает машины и автобусы маленького размера, другая - автобусы и машины большого размера
protocol Factory {
    func produceBus() -> Bus
    func produceCar() -> Car
}

class LittleSizeFactory: Factory {
    func produceBus() -> Bus {
        print("little bus is created")
        return LittleBus()
    }
    
    func produceCar() -> Car {
        print("little car is created")
        return LittleCar()
    }
}


class MiddleSizeFactory: Factory {
    func produceBus() -> Bus {
        print("middle bus is created")
        return MiddleBus()
    }
    
    func produceCar() -> Car {
        print("middle bus is created")
        return MiddleCar()
    }
}

let littleCar = LittleSizeFactory().produceCar()
let middleBus = MiddleSizeFactory().produceBus()
