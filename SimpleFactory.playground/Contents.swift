
enum CarType {
    case huge, fast
}

protocol Car {
    func drive()
}

class HugeCar: Car {
    func drive() {
        print("huge car")
    }
}

class FastCar: Car {
    func drive() {
        print("fast car")
    }
}

// можно так создавать объекты, но в этом случае при добавлении инициализатора, придется пробегаться по всему коду
let hugeCar = HugeCar()
hugeCar.drive()

let fastCar = FastCar()
fastCar.drive()

// поэтому добавим фабрику
class CarFactory {
    // нет смысла использовать обычную функцию
    static func produceCar(type: CarType) -> Car {
        var car: Car
        switch type {
        case .fast: car = FastCar()
        case .huge: car = HugeCar()
        }
        return car
    }
}

let hugeCar1 = CarFactory.produceCar(type: CarType.huge)
let fastCar1 = CarFactory.produceCar(type: CarType.fast)
