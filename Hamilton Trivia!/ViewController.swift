//
//  ViewController.swift
//  Hamilton Trivia!
//
//  Created by Girls Who Code on 7/10/19.
//  Copyright © 2019 Girls Who Code. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var choiceA: UIButton!
    @IBOutlet weak var choiceB: UIButton!
    @IBOutlet weak var choiceC: UIButton!
    @IBOutlet weak var choiceD: UIButton!
    
    var currentQuestion: Question?
    var currentQuestionPosition: Int = 0
    var numCorrect: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentQuestion = questions[0]
        setQuestion()
    }

    @IBAction func choiceAPressed(_ sender: Any) {
        checkAnswer(answerChoice: 1)
    }
    @IBAction func choiceBPressed(_ sender: Any) {
        checkAnswer(answerChoice: 2)
    }
    @IBAction func choiceCPressed(_ sender: Any) {
        checkAnswer(answerChoice: 3)
    }
    @IBAction func choiceDPressed(_ sender: Any) {
        checkAnswer(answerChoice: 4)
    }
    
    func checkAnswer(answerChoice: Int) {
        if (answerChoice == currentQuestion!.correctAnswer) {
            numCorrect += 1
        }
        loadNextQuestion()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "sgShowResults") {
            let vc = segue.destination as! ResultsViewController
            vc.numCorrect = numCorrect
            vc.total = questions.count
        }
    }
    
    struct Question {
        let question: String
        let correctAnswer: Int
        let choices: [String]
    }
    
    var questions: [Question] = [Question(question: "When does the song 'What'd I Miss?' take place?", correctAnswer: 3, choices: ["1776","1781","1789","1800"]), Question(question: "Who is not featured in 'Washington On Your Side'?", correctAnswer: 4, choices: ["Aaron Burr","Thomas Jefferson","James Madison","George Washington"]), Question(question: "How many songs are in the official soundtrack?", correctAnswer: 2, choices: ["45","46","47","48"]), Question(question: "Which song was a part of the Off-Broadway production, but not the Broadway one?", correctAnswer: 3, choices: ["An Open Letter","Cabinet Battle 3","Congratulations","Valley Forge"]), Question(question: "Which loyalist sang in 'Farmer Refuted'?", correctAnswer: 4, choices: ["King George III","Thomas Hutchinson","Charles Lee","Samuel Seabury"]), Question(question: "Who does not end up falling in love with Hamilton?", correctAnswer: 4, choices: ["Angelica Schulyer","Eliza Schuyler","Maria Reynolds","Peggy Schulyer"]), Question(question: "How much do you need to pay to enter the Ham4Ham Lottery?", correctAnswer: 1, choices: ["$10","$20","$30","$40"]), Question(question: "How many questions are in the daily Hamilton app trivia?", correctAnswer: 3, choices: ["1","2","3","4"]), Question(question: "Which of the following roles did Lin Manuel-Miranda NOT have the play Hamilton?", correctAnswer: 3, choices: ["Lead Actor","Composer","Director","Book Writer"]), Question(question: "Which character only appeared in Act II of Hamilton?", correctAnswer: 2, choices: ["Aaron Burr","Thomas Jefferson","Alexander Hamilton","George Washington"])]
    
    func loadNextQuestion() {
        if (currentQuestionPosition >= questions.count - 1) {
            performSegue(withIdentifier: "sgShowResults", sender: nil)
        } else {
            currentQuestionPosition += 1
            currentQuestion = questions[currentQuestionPosition]
            setQuestion()
        }
    }
    
    func setQuestion() {
        questionLabel.text = currentQuestion!.question
        choiceA.setTitle(currentQuestion!.choices[0], for: .normal)
        choiceB.setTitle(currentQuestion!.choices[1], for: .normal)
        choiceC.setTitle(currentQuestion!.choices[2], for: .normal)
        choiceD.setTitle(currentQuestion!.choices[3], for: .normal)
        progressLabel.text = "Question \(currentQuestionPosition + 1) of \(questions.count)"
    }
}

