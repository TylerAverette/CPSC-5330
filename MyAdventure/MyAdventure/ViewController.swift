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
    }
    
    
}

