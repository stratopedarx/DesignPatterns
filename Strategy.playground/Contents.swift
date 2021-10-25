// MARK: Swim
protocol SwimBehavior {
    func swim()
}

class ProfessionalSwimmer: SwimBehavior {
    func swim() {
        print("professional swim")
    }
}

class NewbieSwimmer: SwimBehavior {
    func swim() {
        print("newbie swim")
    }
}

class NonSwimmer: SwimBehavior {
    func swim() {
        print("Non swim")
    }
}

// ---

// MARK: Dive
protocol DiveBehavior {
    func dive()
}

class ProfessionalDiver: DiveBehavior {
    func dive() {
        print("profeccional dive")
    }
}

class NewbieDiver: DiveBehavior {
    func dive() {
        print("newbie dive")
    }
}

class NonDiver: DiveBehavior {
    func dive() {
        print("non dive")
    }
}

// ---
class Human {
    private var diveBehavior: DiveBehavior!  // протокол - это тоже тип, только нет инциализатор.
    private var swimBehavior: SwimBehavior!  // ! значит, что в инициализаторе не будем задавать сюда значение

    init(swimBehavior: SwimBehavior = NewbieSwimmer(), diveBehavior: DiveBehavior = NewbieDiver()) {
        self.swimBehavior = swimBehavior
        self.diveBehavior = diveBehavior
    }
    
    func performSwim() {
        swimBehavior.swim()
    }
    
    func performDive() {
        diveBehavior.dive()
    }

    // эта функция для всех одинаковая
    func run() {
        print("run")
    }

    func setSwimBehavior(swimBehavior: SwimBehavior) {
        self.swimBehavior = swimBehavior
    }

    func setDiveBehavior(diveBehavior: DiveBehavior) {
        self.diveBehavior = diveBehavior
    }
}

let human = Human()
human.setDiveBehavior(diveBehavior: ProfessionalDiver())
human.setSwimBehavior(swimBehavior: ProfessionalSwimmer())
human.performSwim()
human.performDive()

let human2 = Human()
print(human2)
human2.performDive()
human2.performSwim()

/*
// это не удобный вариант так делать. Тут как раз будет проблема
class Human {
    func swim() {
        print("swim")
    }

    func dive() {
        print("dive")
    }

    func run() {
        print("run")
    }
}
 
 let human = Human()
 human.dive()
*/
