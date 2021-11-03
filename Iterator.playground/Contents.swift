class Driver {
    let isGood: Bool
    let name: String
    
    init(isGood: Bool, name: String) {
        self.isGood = isGood
        self.name = name
    }
}

class Car {
    var goodDriverIterator: GoodDriverIterator {
        return GoodDriverIterator(drivers: drivers)
    }
    var badDriverIterator: BadDriverIterator {
        return BadDriverIterator(drivers: drivers)
    }
    
    private let drivers = [Driver(isGood: true, name: "Mark"),
                           Driver(isGood: false, name: "Ivan"),
                           Driver(isGood: true, name: "Maria"),
                           Driver(isGood: false, name: "Morgan")]
}

extension Car: Sequence {
    func makeIterator() -> GoodDriverIterator {
        return GoodDriverIterator(drivers: drivers)
    }
}

// базовый протокол для порядка
protocol BasicIterator: IteratorProtocol {
    init(drivers: [Driver])
    func allDrivers() -> [Driver]
}


// Ниже отдельный класс итератора
// IteratorProtocol - стандартный протокол, который мы реализуем, что бы создать итератор
class GoodDriverIterator: BasicIterator {
    private let drivers: [Driver]
    private var current = 0

    required init(drivers: [Driver]) {
        self.drivers = drivers.filter { $0.isGood }
    }
    
    func next() -> Driver? {
        defer { current += 1 }  // в самом конце выполняем эту инструкцию
        return drivers.count > current ? drivers[current] : nil
    }
    
    func allDrivers() -> [Driver] {
        return drivers
    }
}

class BadDriverIterator: BasicIterator {
    typealias Element = Driver
    private var current = 0
    private var drivers: [Driver]
    
    required init(drivers: [Driver]) {
        self.drivers = drivers.filter { $0.isGood == false }
    }

    func next() -> Driver? {
        defer { current += 1 }
        return drivers.count > current ? drivers[current] : nil
    }
    
    func allDrivers() -> [Driver] {
        return drivers
    }
}

// это если работать без протокола Sequence
//let car = Car()
//let goodDriverIterator = car.goodDriverIterator.next()

// если мы говорим про коллекции, где есть метода makeIterator
// к примеру, array имеет реализацию протокола Sequence

let car = Car()
var goodDriverIteratorViaSequence = car.makeIterator().next()
var goodDriver = car.makeIterator().allDrivers()

let car1 = Car()
let iterator = car.badDriverIterator.next()
