import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var currentValueLabel: UILabel!
    
    var currentValue: Int = 0 {
        didSet {
            currentValueLabel.text = "\(currentValue)"
        }
    }
    var results: [GameResult] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickNumber()
        // Do any additional setup after loading the view.
    }
    
    func pickNumber() {
        currentValue = Int.random(in: 1...1000)
    }
    
    @IBAction func makeGuessPressed(_ sender: UIButton) {
        guard let buttonText = sender.titleLabel?.text else {
            return
        }
        
        let guess = GameResult.Guess(rawValue: buttonText) ?? GameResult.Guess.none
        let result = GameResult(value: currentValue, guess: guess)
        results.insert(result, at: 0)
        pickNumber()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameResultCell", for: indexPath)
        let gameResult = results[indexPath.row]
        cell.textLabel!.text = "\(gameResult.value) = \(gameResult.actual.rawValue)"
        cell.detailTextLabel!.text = "\(gameResult.guess.rawValue) \(gameResult.correctDisplay)"
        
        return cell
    }
    
    
}
