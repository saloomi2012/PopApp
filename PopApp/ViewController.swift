//
//  ViewController.swift
//  PopApp
//
//  Created by Suliman Alsaid on 2/18/19.
//  Copyright © 2019 Suliman Alsaid & Morgan Forester. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func click(_ sender: Any) {
        let ans = Int(input.text!)
        
        if(ans == calculate(ques1)) {
            s.correct = s.correct + 1
        } else {
            s.incorrect = s.incorrect + 1
        }
        
        
        input.text = ""
        ques1 = generateQuestion()
        updateQuestion(ques1)
        updateScore(s)
        
    }
    @IBOutlet weak var firstNum: UILabel!
    
    @IBOutlet weak var op: UILabel!
    
    @IBOutlet weak var secondNum: UILabel!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var submit: UIButton!
    
    @IBOutlet weak var score: UILabel!
    
    var s = Score(correct: 0, incorrect: 0)
    var ques1: Question!
    
    
    override func viewDidLoad() {
        ques1 = generateQuestion()
        updateQuestion(ques1)
        updateScore(s)
        

    }
    
    
    func calculate(_ question: Question) -> Int {
        switch(question.op) {
        case "+":
            return question.num1 + question.num2
        case "-":
            return question.num1 - question.num2
        case "*":
            return question.num1 * question.num2
        case "/":
            return question.num1 / question.num2
        default:
            return -1111
        }
    }
    
    struct Question {
        var num1 : Int
        var num2 : Int
        var op : String
    }
    
    struct Score {
        var correct : Int
        var incorrect : Int
    }
    
    func updateQuestion(_ questtt: Question) {
        firstNum.text = "\(questtt.num1)"
        op.text = questtt.op
        secondNum.text = "\(questtt.num2)"
    }
    
    func updateScore(_ sc : Score) {
        score.text = "\(sc.correct)/\(sc.incorrect)"
    }
    func generateQuestion() -> Question {
        let num1 = Int.random(in: 1...100)
        let num2 = Int.random(in: 1...100)
        var op: String!
        switch(Int.random(in: 1...4)) {
        case 1:
            op = "+"
            break
        case 2:
            op = "-"
            break
        case 3:
            op = "*"
            break
        case 4:
            op = "/"
            break
        default:
            break
        }
        
        return Question(num1: num1, num2: num2, op: op)
        
    }
}

