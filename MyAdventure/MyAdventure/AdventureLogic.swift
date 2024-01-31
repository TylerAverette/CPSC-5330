//
//  Questions.swift
//  MyAdventure
//
//  Created by Shirley Averette on 1/25/24.
//

import Foundation

class AdventureLogic {
    static var mutatingIndex : Int = 0
    static var currentQuestionIndex : Int = 0
    static var optionSelection : Int = 0
    static var question = [
        Question(question: "You're name Uhtred, son of bebanburg, future heir to the throne, and your kingdom has just been raided, your father killed, and you are taken as a slave. What do you do?",
                            optionOne: "Fight Back",
                            optionTwo: "Accept the role"),
        Question(question: "You have decided to fight back, how will you approach?",
                            optionOne: "Stealth Attack",
                            optionTwo: "Quickly grab a weapon and stab a viking."),
        Question(question: "You attempt to execute a stealth attack as the vikings are drinking. You successfully stab one of the vikings. Now everyone in the hall is looking at you. How will you respond?",
                            optionOne: "Continue stabbing other vikings",
                            optionTwo: "Try to run away"),
        Question(question: "You have decided to continue fighting, and the vikings are laughing as you try to fight back. One of the vikings play fights with you until he accidentally swings to hard and cuts you down.",
                            optionOne: "Not Available",
                            optionTwo: "Not Available"),
        Question(question: "You have chosen to flee, and as you run the viking stabs you through the heart.",
                            optionOne: "Not Available",
                            optionTwo: "Not Available"),
        Question(question: "You have selected to accept your fate. You grow with the vikings and become part viking. In your teens, the village is raided and your new father killed in his sleep, what will you do?",
                            optionOne: "Take revenge, kill a raider then run",
                            optionTwo: "Attempt to fight, hoping some of your people are still alive"),
        Question(question: "You have managed to kill one raider, and flee to the city of Wessex. Hoping your lineage can gain help from the the Saxon King Alfred, How will you plead?",
                            optionOne: "Announce heritage, and request assistance reclaiming bebbanburg",
                            optionTwo: "Seek Refuge"),
        Question(question: "You have chosen to fight and struck down multiple vikings in a valiant effort until dying out. Valhalla will be pleased!",
                            optionOne: "Not Available",
                            optionTwo: "Not Available"),
        Question(question: "You have decided use your heritage as a bargaining chip to increase your standing. Alfred recognizes your lineage but claims you have became a dane. How do you respond?",
                            optionOne: "Demand help by right",
                            optionTwo: "Offer your sword and knowledge to help fight vikings"),
        Question(question: "You have decided to seek refuge, and claim it as your birthright. Alfred's priest convinces him to offer you refuge as the christian bible demands. You join their ranks as a refugee.",
                            optionOne: "Not Available",
                            optionTwo: "Not Available"),
        Question(question: "You demand help by birthright. Alfred decides to imprison you because he will not be bullied by a dane. You have been imprisoned. Your story ends here.",
                            optionOne: "Not Available",
                            optionTwo: "Not Available"),
        Question(question: "You offer your sword and knowldge of viking fighting tactics to Alfred in exchange for refuge, help, and status. You are now a hired sword of Wessex with the promise of one day reclaiming Bebbanburg.",
                            optionOne: "Not Available",
                            optionTwo: "Not Available"),
    ]
    static var pathOne = [question[0], question[5]]
    
    init(){
    
    }
    
    static func getInitialQuestion() -> Question {
        return question[0]
    }
    
    static func getNextQuestion(selection: Int) -> Question {
        var nextQuestion : Question
        
        switch currentQuestionIndex {
        case 0:
            if selection == 1 {
                currentQuestionIndex = 1
            } else {
                currentQuestionIndex = 5
            }
            break;
        case 1:
            if selection == 1 {
                currentQuestionIndex = 2
            } else {
                currentQuestionIndex = 3
            }
            break;
        case 2:
            if selection == 1 {
                currentQuestionIndex = 3
            } else {
                currentQuestionIndex = 4
            }
            break;
        case 5:
            if selection == 1 {
                currentQuestionIndex = 6
            } else {
                currentQuestionIndex = 7 // End of the line
            }
            break;
        case 6:
            if selection == 1 {
                currentQuestionIndex = 11 // End of the line
            } else {
                currentQuestionIndex = 9
            }
            break;
        case 8:
            if selection == 1 {
                currentQuestionIndex = 10
            } else {
                currentQuestionIndex = 11
            }
            break;
        default:
            nextQuestion = Question(question: "Nil", optionOne: "Nil", optionTwo: "Nil")
            
        }
        nextQuestion = question[currentQuestionIndex]
        
        return nextQuestion
    }

    
}
