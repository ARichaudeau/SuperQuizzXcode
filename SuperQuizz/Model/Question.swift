//
//  Question.swift
//  SuperQuizz
//
//  Created by formation10 on 04/12/2018.
//  Copyright © 2018 formation10. All rights reserved.
//

import Foundation

class Question {
    var title: String
    var answers: [String]
    var correctAnswer: String
    var userChoice: Int?
    
    init(title: String, answers: [String], correctAnswer: String){
        self.title = title
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
}
