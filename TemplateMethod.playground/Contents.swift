protocol DriveVehicle {
    func startVehicle()
    func closeTheDoor()
    func haveASeat()
    func useProtection()
    func lookAtTheMirror()
    func turnSignal()
    func driveForward()
}

extension DriveVehicle {

    func startVehicle() {
        haveASeat()
        closeTheDoor()
        useProtection()
        lookAtTheMirror()
        turnSignal()
        driveForward()
    }
    
    func haveASeat() {
        // когда вызовется метод, у нас будет ошибка. Это типа notEmplementedError
        preconditionFailure("This method should be overriden")
    }
    
    func closeTheDoor() {
        // empty
        print("closeTheDoor: empty")
    }
    
    // должны пристегнуться
    func useProtection() {
        // когда вызовется метод, у нас будет ошибка. Это типа notEmplementedError
        preconditionFailure("This method should be overriden")
    }
    
    // смотрим в зеркало
    func lookAtTheMirror() {
        // когда вызовется метод, у нас будет ошибка. Это типа notEmplementedError
        preconditionFailure("This method should be overriden")
    }
    
    // включаем поворотник
    func turnSignal() {
        // когда вызовется метод, у нас будет ошибка. Это типа notEmplementedError
        preconditionFailure("This method should be overriden")
    }
    
    // едем прямо
    func driveForward() {
        // когда вызовется метод, у нас будет ошибка. Это типа notEmplementedError
        preconditionFailure("This method should be overriden")
    }
}

//let v = DriveVehicle()
//v.startVehicle()  // так мы получим ошибку, потому что методы не реализованы, мы должны реализовать подкласса.


class Bicycle: DriveVehicle {
    
    // мы не переопределеяем startVehicle, потому что это шаблонный метод
    
    func haveASeat() {
        print("haveASeat: seat down on bicycle seat")
    }
    
    // должны пристегнуться
    func useProtection() {
        print("useProtection: wear a helmet")
    }
    
    // смотрим в зеркало
    func lookAtTheMirror() {
        print("lookAtTheMirror: look at the little mirror")
    }
    
    // включаем поворотник
    func turnSignal() {
        print("turnSignal: show left hand")
    }
    
    // едем прямо
    func driveForward() {
        print("driveForward: pedal")
    }
}

class Car: DriveVehicle {
    func haveASeat() {
        print("haveASeat: seat down on car seat")
    }
    
    func closeTheDoor() {
        // тут определяем его. Для велосипеда не нужен
        print("closeTheDoor: if we have the door so close it")
    }
    
    // должны пристегнуться
    func useProtection() {
        print("useProtection: fasten seat belt")
    }
    
    // смотрим в зеркало
    func lookAtTheMirror() {
        print("lookAtTheMirror: look at the car mirror")
    }
    
    // включаем поворотник
    func turnSignal() {
        print("turnSignal: turn on left turn light")
    }
    
    // едем прямо
    func driveForward() {
        print("driveForward: push pedal")
    }
}

let car = Car()
let bicycle = Bicycle()
car.startVehicle()
print("-----")
bicycle.startVehicle()
