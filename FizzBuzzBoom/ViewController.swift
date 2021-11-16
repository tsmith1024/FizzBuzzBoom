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
    }
    
    func pickNumber() {
        currentValue = Int.random(in: 1...Constants.maxQuestionValue)
    }
    
    @IBAction func makeGuessPressed(_ sender: UIButton) {
        guard let buttonText = sender.titleLabel?.text else {
            return
        
        let guess = GameResult.Guess(rawValue: buttonText) ?? GameResult.Guess.none
        let result = GameResult(value: currentValue, guess: guess)
        results.append(result)
        pickNumber()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.resultCellIdentifier, for: indexPath)
        let gameResult = results[indexPath.row]
        cell.textLabel = gameResult.actualDisplay
        cell.detailTextLabel?.text = gameResult.correctDisplay
        
        return cell
    }
}
