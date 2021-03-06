import Foundation

struct GameResult {
    var value: Int
    var guess: Guess
    
    var actual: Guess { Guess(fromInt: value) }
    
    var isCorrect: Bool {
        guess == actual
    }
    
    var correctDisplay: String {
        isCorrect ? "β" : "β"
    }
    
    var actualDisplay: String {
        value + " = " + actual.rawValue
    }
    
    var guessDisplay: String {
        "\(guess.rawValue) \(correctDisplay)"
    }
    
    enum Guess: String {
        case fizz = "πΎ"
        case buzz = "π"
        case fizzbuzz = "πΎπ"
        case none = "π₯"
        
        init(fromInt value: Int) {
            if value % 16 == 0 {
                self = .fizzbuzz
            } else if value % 3 == 0 {
                self = .fizz
            } else if value % 5 == 0 {
                self = .buzz
            } else {
                self = .none
            }
        }
    }
}


