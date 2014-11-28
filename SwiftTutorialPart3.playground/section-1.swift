import Foundation

// protocols
@objc protocol Speaker {
    func speak()
    optional func tellJoke()
}

class Vicki: Speaker {
    func speak() {
        println("Hello, I am Vicki!")
    }
    
    func tellJoke() {
        println("Q: What did Sushi A say to Sushi B?")
    }
}

class Ray: Speaker {
    func speak() {
        println("Yo, I am Ray!")
    }
    func tellJoke() {
        println("Q: What's the object-oriented way to become wealthy?")
    }
    func writeTutorial() {
        println("I'm on it!")
    }
}

class Animal {
    
}

class Dog: Animal, Speaker {
    func speak() {
        println("Woof!")
    }
}

var speaker: Speaker
speaker = Ray()
speaker.speak()
//speaker.writeTutorial()
(speaker as Ray).writeTutorial()
speaker = Vicki()
speaker.speak()

speaker.tellJoke?()
speaker = Dog()
speaker.tellJoke?()

// delegates
class DateSimulator {
    
    let a: Speaker
    let b: Speaker
    var delegate: DateSimulatorDelegate?
    
    init(a: Speaker, b: Speaker) {
        self.a = a
        self.b = b
    }
    
    func simulate() {
        /*
        println("Off to dinner...")
        a.speak()
        b.speak()
        println("walking back home...")
        a.tellJoke?()
        b.tellJoke?()
        */
        if let trueDelegate = delegate {
            trueDelegate.dateSimulatorDidStart(self, a: a, b: b)
            println("Off to dinner...")
            a.speak()
            b.speak()
            println("walking back home...")
            a.tellJoke?()
            b.tellJoke?()
            trueDelegate.dateSimulatorDidEnd(self, a: a, b: b)
        }
        // or do this
        /*
        delegate?.dateSimulatorDidStart(self, a: a, b: b)
        println("Off to dinner...")
        a.speak()
        b.speak()
        println("walking back home...")
        a.tellJoke?()
        b.tellJoke?()
        delegate?.dateSimulatorDidEnd(self, a: a, b: b)
        */
    }
}

protocol DateSimulatorDelegate {
    func dateSimulatorDidStart(sim: DateSimulator, a: Speaker, b: Speaker)
    func dateSimulatorDidEnd(sim: DateSimulator, a: Speaker, b: Speaker)
}

class LoggingDateSimulator: DateSimulatorDelegate {
    func dateSimulatorDidStart(sim: DateSimulator, a: Speaker, b: Speaker) {
        println("Date started!")
    }
    func dateSimulatorDidEnd(sim: DateSimulator, a: Speaker, b: Speaker) {
        println("Date ended!")
    }
}

let sim = DateSimulator(a: Vicki(), b: Ray())
sim.delegate = LoggingDateSimulator()
sim.simulate()

