//
//  CreateOrEditQuestionViewController.swift
//  SuperQuizz
//
//  Created by formation10 on 05/12/2018.
//  Copyright © 2018 formation10. All rights reserved.
//

import UIKit

protocol CreateOrEditQuestionDelegate : AnyObject {
    func userDidEditQuestion(q : Question) -> ()
    func userDidCreateQuestion(q : Question) -> ()
}

class CreateOrEditQuestionViewController: UIViewController {
    
    var questionToEdit: Question?
    weak var delegate : CreateOrEditQuestionDelegate?
    
    @IBOutlet weak var answerTextField1: UITextField!
    @IBOutlet weak var answerTextField2: UITextField!
    @IBOutlet weak var answerTextField3: UITextField!
    @IBOutlet weak var answerTextField4: UITextField!
    
    @IBOutlet weak var questionTitleTextField: UITextField!
    
    @IBOutlet weak var answerSwitch1: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func userDidValidate(_ sender: Any) {
        if let question = questionToEdit {
            // TODO edit la question
            delegate?.userDidEditQuestion(q: question)
        } else {
            //TODO creer une nouvelle question
            let title = questionTitleTextField.text!
            let answer1 = answerTextField1.text!
            let answer2 = answerTextField2.text!
            let answer3 = answerTextField3.text!
            let answer4 = answerTextField4.text!
            let correctAnswer = answerTextField1.text!
            let answers = [answer1, answer2, answer3, answer4]
           
            let q = Question(title: title, answers: answers, correctAnswer: correctAnswer)
            delegate?.userDidCreateQuestion(q: q)
        }
    }

    
    func createOrEditQuestion () {
      
    }
    
}
