//
//  ViewController.swift
//  flashcard2
//
//  Created by CS on 9/9/19.
//  Copyright © 2019 CS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var QLabel: UILabel!
    @IBOutlet weak var ALabel: UILabel!
    
    @IBOutlet weak var qField: UITextField!
    @IBOutlet weak var aField: UITextField!
    
    @IBOutlet weak var inputArea: UIView!
    
    var questions: [String] = [] //Question array
    var answers: [String] = [] //Answer array
    var currentQuestionIndex: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        inputArea.isHidden = true
        QLabel.text = "No question yet."
        ALabel.text = "???"
        
        qField.delegate = self
        aField.delegate = self
    }
    
    //displayAlert(msgTitle: "Ready", msgContent: "Go")
    func displayAlert(msgTitle:String, msgContent:String){
        let alertController = UIAlertController(title: msgTitle, message: msgContent,
                                                preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }

    @IBAction func showHideInputAreaAction(_ sender: Any) {
        inputArea.isHidden = !inputArea.isHidden
    }
    
    @IBAction func nextQBtnAction(_ sender: Any) {
        if questions.count == 0 {
            displayAlert(msgTitle: "No question", msgContent: "")
            return
        }
        
        currentQuestionIndex = currentQuestionIndex + 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        QLabel.text = questions[currentQuestionIndex]
        ALabel.text = "???"
    }
    
    @IBAction func showAnswerBtnAction(_ sender: Any) {
        if answers.count == 0 {
            ALabel.text = "No answer yet"
            return
        }
        
        ALabel.text = answers[currentQuestionIndex]
    }
    
    @IBAction func deleteQABtnAction(_ sender: Any) {
        if questions.count == 0 {
            displayAlert(msgTitle: "No question to delete", msgContent: "")
            return
        }
        questions.remove(at: currentQuestionIndex)
        answers.remove(at: currentQuestionIndex)
        
        if questions.count == 0 {
            QLabel.text = "No question"
            ALabel.text = "No answer"
            return
        }
        
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        QLabel.text = questions[currentQuestionIndex]
        ALabel.text = "???"
    }
    
    @IBAction func xBtnAction(_ sender: Any) {
        inputArea.isHidden = true
        view.endEditing(true) //hide the keyboard
    }
    
    @IBAction func addQAAction(_ sender: Any) {
        //enterQ.resignFirstResponder()
        //enterA.resignFirstResponder() //hide the keyboard
        view.endEditing(true) //hide the keyboard
        
        if aField.text == "" || qField.text == "" {
            displayAlert(msgTitle: "Input Error", msgContent: "")
            return
        }
        
        questions.append(qField.text!)
        answers.append(aField.text!)
        
        qField.text = ""
        aField.text = ""
        
        displayAlert(msgTitle: "QA Saved!", msgContent: "")
    }
    
}

