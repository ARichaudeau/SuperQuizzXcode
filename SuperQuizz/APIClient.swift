//
//  APIClient.swift
//  SuperQuizz
//
//  Created by formation10 on 06/12/2018.
//  Copyright © 2018 formation10. All rights reserved.
//

import Foundation



class APIClient {
    
    static let instance = APIClient()
    
    private let urlServer = "http://192.168.10.154:3000/"
    private init () {}
    
    
    //Recuperer toutes les questions
    @discardableResult
    func getAllQuestionsFromServer(onSuccess:@escaping ([Question])->(), onError:@escaping (Error)->())-> URLSessionTask {
        
        //préparation de la requete
        var request = URLRequest(url: URL(string: "\(urlServer)questions")! )
        request.httpMethod = "GET"
        
        // preparation de la tache de telechargement des données
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // si j'ai de la donnée
            if let data = data {
                
                // Je la transforme en Array
                let dataArray = try! JSONSerialization.jsonObject(with: data, options: []) as! [Any]
                var questionsToreturn = [Question]()
                // pour chaque objet dans l'array
                for object in dataArray {
                    
                    let objectDictionary = object as! [String:Any]
                

                    //Je récupère le titre, réponses et bonne réponse
                    let title = objectDictionary["title"] as! String
                    let answer1 = objectDictionary["answer_1"] as! String
                    let answer2 = objectDictionary["answer_2"] as! String
                    let answer3 = objectDictionary["answer_3"] as! String
                    let answer4 = objectDictionary["answer_4"] as! String
                    let correctAnswerInt = objectDictionary["correct_answer"] as! Int
                    var correctAnswer = ""
                    
                    switch correctAnswerInt {
                    case 1:
                        correctAnswer = answer1
                    case 2:
                        correctAnswer = answer2
                    case 3:
                        correctAnswer = answer3
                    case 4:
                        correctAnswer = answer4
                    default:
                        print("Erreur")
                    }
                    
                    let answers = [answer1, answer2, answer3, answer4]
                    
                    let q  = Question(title: title, answers: answers, correctAnswer: correctAnswer)
                   
                    questionsToreturn.append(q)
                }
                onSuccess(questionsToreturn)
                
            } else  {
                onError(error!)
            }
        }
        // lance la tache
        task.resume()
        
        // revoie la tache pour pouvoir l'annuler
        return task
    }
    
    //TODO : Delete
    //Supprimer une question
    func deleteQuestionFromServer(question: Question, onSuccess:@escaping (Question)->(), onError:@escaping (Error)->())-> URLSessionTask {
        
        //préparation de la requete
        var request = URLRequest(url: URL(string: "\(urlServer)questions/id")! )
        request.httpMethod = "DELETE"
        // preparation de la tache de telechargement des données
        let task = URLSession.shared.dataTask(with: request){ (data, response, error) in
            
            if let error = error {
                onError(error)
            } else {
                onSuccess(question)
            }
        }
        
        // lance la tache
        task.resume()
        
        // revoie la tache pour pouvoir l'annuler
        return task
    }
    
    //TODO : Post
    
    
    
    //TODO : Put
    
    
}
