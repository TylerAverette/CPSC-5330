//
//  Question.swift
//  MyAdventure
//
//  Created by Shirley Averette on 1/25/24.
//

import Foundation

class Question {
    var question: String
    var optionOne: String
    var optionTwo: String
    
    init(question: String, optionOne: String, optionTwo: String) {
        self.question = question
        self.optionOne = optionOne
        self.optionTwo = optionTwo
    }
}
