//
//  ViewController.swift
//  SwiftFundamentals
//
//  Created by Francesco Panico on 21/03/24.
//

import UIKit

class ViewController: UIViewController {
    
    var listOfWords = ["buccaneer", "swift", "glorious", "incandescent", "bug", "program"];
    let incorrectMovesAllowed = 7;
    
    var totalWins = 0 {
        didSet{
            newRound()
        }
    }
    var totalLosses = 0{
        didSet{
            newRound()
        }
    }
    
    var currentGame: Game!

    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var correctWorldLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!

    @IBOutlet var letterButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound();
    }

    @IBAction func letterButtonPressed(_ sender: UIButton) {
        //print(sender.isEnabled)
        sender.isEnabled = false;
        let letterString = sender.configuration!.title!;
        let letter = Character(letterString.lowercased());
        currentGame.playerGuessd(letter: letter)
        updateGameState()
    }
    
    
    func newRound(){
        if !listOfWords.isEmpty{
            let newWord = listOfWords.removeFirst();
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: []);
            enableLetterButtons(true)
            updateUI()
        } else {
            enableLetterButtons(false)
            updateUI()
        }

    }
    
    func updateUI(){
        var letters = [String]()
        for letter in currentGame.formatterWord{
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWorldLabel.text = wordWithSpacing;
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)";
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    func updateGameState(){
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formatterWord{
            totalWins += 1
        } else {
            updateUI()
        }
    }
    
    func enableLetterButtons(_ enable: Bool){
        for button in letterButtons{
            button.isEnabled = enable
        }
    }
    
}

