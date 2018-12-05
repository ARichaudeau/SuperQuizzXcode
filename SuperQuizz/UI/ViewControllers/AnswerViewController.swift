//
//  ViewController.swift
//  SuperQuizz
//
//  Created by formation10 on 04/12/2018.
//  Copyright © 2018 formation10. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    
    @IBOutlet weak var uiLabelQuestionTitle: UILabel!
    
    @IBOutlet weak var uiButtonAnswer1: UIButton!
    
    @IBOutlet weak var uiButtonAnswer2: UIButton!
    
    @IBOutlet weak var uiButtonAnswer3: UIButton!
    
    @IBOutlet weak var uiButtonAnswer4: UIButton!
    
    var question: Question!
    private var onQuestionAnswered : ((_ q: Question, _ isCorrectAnswer : Bool)->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        uiLabelQuestionTitle.text = question.title
        uiButtonAnswer1.setTitle(question.answers[0], for: .normal)
        uiButtonAnswer2.setTitle(question.answers[1], for: .normal)
        uiButtonAnswer3.setTitle(question.answers[2], for: .normal)
        uiButtonAnswer4.setTitle(question.answers[3], for: .normal)
    
        
    }
    
    func setOnReponseAnswered(closure : @escaping (_ question: Question,_ isCorrectAnswer :Bool)->()) {
        onQuestionAnswered = closure
    }
    
    func userDidChooseAnswer(isCorrectAnswer : Bool){
        // TO DO : faire les animations de réussite / échec
        self.dismiss(animated: true, completion: nil)
        onQuestionAnswered?(question, isCorrectAnswer)
    }


}

