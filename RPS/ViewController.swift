//
//  ViewController.swift
//  RPS
//
//  Created by Vokpolk on 10.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var robotButton: UIButton!
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet weak var losesLabel: UILabel!
    
    var pressedButton: Bool = false
    var countOfWins: UInt8 = 0
    var countOfLoses: UInt8 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resetButton.isHidden = true
        winsLabel.text = "Wins: 0"
        losesLabel.text = "Loses: 0"
    }
    
    func play(_ sign: Sign) {
        let computerSign = randomSign()
        robotButton.setTitle(computerSign.emoji, for: .normal)
        
        switch sign {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false
        }
        
        resetButton.isHidden = false
        let result = sign.getResult(for: computerSign)
        switch result {
        case .win:
            statusLabel.text = "It's a win!"
            self.view.backgroundColor = UIColor.green
            countOfWins += 1
            //print("Wins: \(countOfWins)")
        case .lose:
            statusLabel.text = "It's a lose."
            self.view.backgroundColor = UIColor.red
            countOfLoses += 1
            //print("Loses: \(countOfLoses)")
        case .draw:
            statusLabel.text = "It's a draw."
            self.view.backgroundColor = UIColor.yellow
        case .start:
            statusLabel.text = "Let's start"
        }
        results()
        pressedButton = true
    }
    
    func reset() {
        self.view.backgroundColor = UIColor.white
        statusLabel.text = "Rock, Paper, Scissors?"
        rockButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
        resetButton.isHidden = true
        robotButton.setTitle("🤖", for: .normal)
        pressedButton = false
    }
    
    func results() {
        winsLabel.text = "Wins: \(countOfWins)"
        losesLabel.text = "Loses: \(countOfLoses)"
    }
    
    //MARK: - IBAction
    @IBAction func rockButtonPressed(_ sender: Any) {
        if !pressedButton {
            play(.rock)
        }
    }
    @IBAction func paperButtonPressed(_ sender: Any) {
        if !pressedButton {
            play(.paper)
        }
    }
    @IBAction func scissorsButtonPressed(_ sender: Any) {
        if !pressedButton {
            play(.scissors)
        }
    }
    @IBAction func resetButtonPressed(_ sender: Any) {
        reset()
    }
}

