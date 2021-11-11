class Enemy {
    let strength = 600
}

// определяет, то что будет в цепочке
protocol MilitaryChain {
    var strength: Int { get }
    var nextRank: MilitaryChain? { get set } // от солдата к офицеру переходим. Когда дойдем до последнего звена, nextRank будет nil
    func shouldDefeatWithStrength(amount: Int) // будет пробовать победить льва
}

class Soldier: MilitaryChain {
    var strength = 100
    
    var nextRank: MilitaryChain?
    
    func shouldDefeatWithStrength(amount: Int) {
        // если сила врага меньше силы солдата
        if amount < strength {
            print("Soldier got it")
        } else {
            nextRank?.shouldDefeatWithStrength(amount: amount)
        }
    }
}

class Officer: MilitaryChain {
    var strength = 500
    
    var nextRank: MilitaryChain?
    
    func shouldDefeatWithStrength(amount: Int) {
        // если сила врага меньше силы солдата
        if amount < strength {
            print("Officer got it")
        } else {
            nextRank?.shouldDefeatWithStrength(amount: amount)
        }
    }
}

class General: MilitaryChain {
    var strength = 1000
    
    var nextRank: MilitaryChain?
    
    func shouldDefeatWithStrength(amount: Int) {
        // если сила врага меньше силы солдата
        if amount < strength {
            print("General got it")
        } else {
            print("we can not defeat this enemy")
        }
    }
}

let enemy = Enemy()
let soldier = Soldier()
let officer = Officer()
let general = General()

soldier.nextRank = officer
officer.nextRank = general

soldier.shouldDefeatWithStrength(amount: enemy.strength)  // General got it
