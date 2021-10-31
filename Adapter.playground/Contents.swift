
// 1) adaptee - это адапти, объект, который мы адаптируем
class SimpleCar {
    func sound() -> String {
        return "tr tr tr"
    }
}

// 2) target
protocol SuperCarProtocol {
    func makeNoise() -> String
}

class SuperCar: SuperCarProtocol {
    func makeNoise() -> String {
        return "wroom wroom"
    }
}

// теперь мы хотим сделать так, что бы Adaptee мог вызывать метод makeNoise.
// 3) adapter
class SuperCarAdapter: SuperCarProtocol {
    var simpleCar: SimpleCar
    
    init(simpleCar: SimpleCar) {
        self.simpleCar = simpleCar
    }
    
    func makeNoise() -> String {
        return simpleCar.sound()
    }
}


let simpleCar = SimpleCar()
let superCarAdapter = SuperCarAdapter(simpleCar: simpleCar)
superCarAdapter.makeNoise()
