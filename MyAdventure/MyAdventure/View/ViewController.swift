//
//  ViewController.swift
//  MyAdventure
//
//  Created by Tyler Averette on 1/25/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var btnChoiceOne: UIButton!
    @IBOutlet weak var btnChoiceTwo: UIButton!
    
    var selection : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadQuestion(AdventureLogic.getInitialQuestion())
    }
    
    func loadQuestion(_ question: Question) {
        questionLabel.text = question.question
        btnChoiceOne.setTitle(question.optionOne, for: .normal)
        btnChoiceTwo.setTitle(question.optionTwo, for: .normal)
        selection = 0
    }
    
    @IBAction func optionSelected(_ sender: UIButton) {
        if sender == btnChoiceOne {
            selection = 1
        } else if sender == btnChoiceTwo {
            selection = 2
        }
        loadQuestion(AdventureLogic.getNextQuestion(selection: selection))
        
        // I could not get the timing right to remove the buttons, so I settled on "Not Available" as text. If they click a "Not available" button is will remove them from the screen. Clicking the restart button will add them back and enable them.
        if AdventureLogic.endOfTheLine == true {
            removeButtons()
        } else {
            summonButtons()
        }
    }
    
    @IBAction func resetQuest(_ sender: UIButton) {
        AdventureLogic.reset()
        selection = 0
        loadQuestion(AdventureLogic.getInitialQuestion())
        summonButtons()
    }
    
    func removeButtons() {
        btnChoiceOne.isEnabled = false
        btnChoiceOne.isHidden = true
        btnChoiceTwo.isEnabled = false
        btnChoiceTwo.isHidden = true
    }
    
    func summonButtons(){
        btnChoiceOne.isEnabled = true
        btnChoiceOne.isHidden = false
        btnChoiceTwo.isEnabled = true
        btnChoiceTwo.isHidden = false
    }
    
}

