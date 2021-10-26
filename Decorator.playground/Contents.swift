protocol Porche {
    func getPrice() -> Double
    func getDescription() -> String
}

// это конкретный автомобиль на который будем навешивать декоратор
class Boxter: Porche {
    func getPrice() -> Double {
        return 120
    }
    
    func getDescription() -> String {
        return "Porshe Boxter"
    }
}

// это абстрактный класс. От него будут наследоваться дальше
class PorcheDecorator: Porche {
    // сюда передается тот автомобиль для которого мы испольуем дополнительные опции
    private let decoratedPorshe: Porche
    
    // наследники обязаны реализовать инициализатор
    required init(decoratedPorshe: Porche) {
        self.decoratedPorshe = decoratedPorshe
    }

    func getPrice() -> Double {
        return decoratedPorshe.getPrice()
    }
    
    func getDescription() -> String {
        return decoratedPorshe.getDescription()
    }
}

// класс для опции музыка
class PremiumAudioSystem: PorcheDecorator {
    required init(decoratedPorshe: Porche) {
        super.init(decoratedPorshe: decoratedPorshe)
    }

    override func getPrice() -> Double {
        return super.getPrice() + 30
    }

    override func getDescription() -> String {
        return super.getDescription() + " with premium audio system"
    }
}

// класс для опции крыша
class PanoramicSunroof: PorcheDecorator {
    required init(decoratedPorshe: Porche) {
        super.init(decoratedPorshe: decoratedPorshe)
    }

    override func getPrice() -> Double {
        return super.getPrice() + 20
    }

    override func getDescription() -> String {
        return super.getDescription() + " with panoramic sunroof"
    }
}

// теперь пример. Здесь надо использовать : Porche. Это делается для того, что бы мы могли использовать данный паттерн
var porsheBoxter: Porche = Boxter()
porsheBoxter.getDescription()
porsheBoxter.getPrice()

porsheBoxter = PremiumAudioSystem(decoratedPorshe: porsheBoxter)
porsheBoxter.getPrice()
porsheBoxter.getDescription()

porsheBoxter = PanoramicSunroof(decoratedPorshe: porsheBoxter)
porsheBoxter.getDescription()
porsheBoxter.getPrice()
