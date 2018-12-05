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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func createOrEditQuestion () {
        if let question = questionToEdit {
            // TODO edit la question
            delegate?.userDidEditQuestion(q: question)
        } else {
            //TODO creer une nouvelle question
            //let question = Question(title: <#T##String#>, answers: <#T##[String]#>, correctAnswer: <#T##String#>)
            //delegate?.userDidCreateQuestion(q: question)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
}
