import Foundation

protocol Subject {
    func add(observer: PropertyObserver)
    func remove(observer: PropertyObserver)
    func notify(withString string: String)
}

class Teacher: Subject {
    // NSMutableSet - нам нужна коллекция, которую мы можем изменять и все элементы в одном экземпляре
    var observerCollection = NSMutableSet()
    // мы хотим, что бы задание, которые дает учитель тоже было записано. Чтобы автоматически вызывать потом notify
    var homeTask = "" {
        didSet {
            notify(withString: homeTask)
        }
    }
    
    func add(observer: PropertyObserver) {
        observerCollection.add(observer)
    }
    
    func remove(observer: PropertyObserver) {
        observerCollection.remove(observer)
    }
    
    // уведомляем все наблюдателей о новом задании
    func notify(withString string: String) {
        for observer in observerCollection {
            // (observer as! PropertyObserver) нужно,чтобы мы могли обратиться к методу, который реализован в протоколе PropertyObserver
            (observer as! PropertyObserver).didGet(newTask: string)
        }
    }
}


// протокол, который будут реализовывать все наши наблюдатели
protocol PropertyObserver {
    // когда наблюдатель получает какое-то уведомление, он сразу должен что-то с ним сделать
    func didGet(newTask task: String)
}

// наследуемся от NSObject, что бы могли поместить в коллекцию NSMutableSet
class Pupil: NSObject, PropertyObserver {
    var homeTask = ""

    func didGet(newTask task: String) {
        homeTask = task
        print("new homewok to be done. Pupil is \(String(describing: self))")
    }
}

let teacher = Teacher()

let pupil1 = Pupil()
let pupil2 = Pupil()
let pupil3 = Pupil()

teacher.add(observer: pupil1)
teacher.add(observer: pupil2)
teacher.add(observer: pupil3)

teacher.homeTask = "Task 1"
// pupil1.homeTask
