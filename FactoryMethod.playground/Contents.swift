protocol Vehicle {
    func drive()
}

class Car: Vehicle {
    func drive() {
        print("car")
    }
}

class Truck: Vehicle {
    func drive() {
        print("trucj")
    }
}

class Bus: Vehicle {
    func drive() {
        print("bus")
    }
}

protocol VehicleFactory {
    func produce() -> Vehicle
}

class CarFactory: VehicleFactory {
    func produce() -> Vehicle {
        print("car is created")
        return Car()
    }
}


class TruckFactory: VehicleFactory {
    func produce() -> Vehicle {
        print("truck is created")
        return Truck()
    }
}


class BusFactory: VehicleFactory {
    func produce() -> Vehicle {
        print("bus is created")
        return Bus()
    }
}

let carFactory = CarFactory()
let car = carFactory.produce()

let truckFactory = TruckFactory()
let truck = truckFactory.produce()

let busFactory = BusFactory()
let bus = busFactory.produce()
