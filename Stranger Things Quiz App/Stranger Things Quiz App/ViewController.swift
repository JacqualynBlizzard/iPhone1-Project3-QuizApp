//
//  ViewController.swift
//  Stranger Things Quiz App
//
//  Created by Jacqualyn Blizzard-Caron on 1/25/19.
//  Copyright © 2019 Jacqualyn Blizzard-Caron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Part 2 - IBOutlets for labels and answer buttons
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer0: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var progressLabel: UILabel!
    
    // Part 2 - IBActions for answer buttons
    @IBAction func handleSubmitAnswer0(_ sender: Any) {
        checkAnswer(choiceNo: 0)
    }
    
    @IBAction func handleSubmitAnswer1(_ sender: Any) {
        checkAnswer(choiceNo: 1)
    }
    
    @IBAction func handleSubmitAnswer2(_ sender: Any) {
        checkAnswer(choiceNo: 2)
    }
    
    @IBAction func handleSubmitAnswer3(_ sender: Any) {
        checkAnswer(choiceNo: 3)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Part 5 setup the question and reset currentQuestion
        currentQuestion = questions[0]
        setQuestion()
    }
    

    // Part 4 - Method to setup the question
    func setQuestion() {
        questionLabel.text = currentQuestion!.question
        answer0.setTitle(currentQuestion!.answers[0], for: .normal)
        answer1.setTitle(currentQuestion!.answers[1], for: .normal)
        answer2.setTitle(currentQuestion!.answers[2], for: .normal)
        answer3.setTitle(currentQuestion!.answers[3], for: .normal)
        progressLabel.text = "Question \(currentQuestionPosition+1) of \(questions.count)"
    }
    
    // Part 4 - Method to load the next question
    func loadNextQuestion() {
        if((currentQuestionPosition + 1) == questions.count) {
            performSegue(withIdentifier: "sgShowResults", sender: nil)
        } else {
            currentQuestionPosition += 1
            currentQuestion = questions[currentQuestionPosition]
            setQuestion()
        }
    }
    
    // Part 5 - Method to check the user's answer
    func checkAnswer(choiceNo: Int) {
        if(choiceNo == currentQuestion!.correctAnswer) {
            noCorrect += 1
            loadNextQuestion()
        } else {
            loadNextQuestion()
        }
    }
    
    // Part 6 - Send results of the quiz to the results view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ResultsViewController
        vc.noCorrect = noCorrect
        vc.total = questions.count
    }
    
    // Part 3 - Struct for quiz question
    struct Question {
        let question: String
        let answers: [String]
        let correctAnswer: Int
    }
    
    // Part 3 - Instances of Question Struct that are stored in an array
    var questions: [Question] = [
        Question(question: "What decade is Stranger Things set in?", answers: ["The 60's", "The 70's", "The 80's", "The 90's"], correctAnswer: 2),
        Question(question: "What is El's favorite food?", answers: ["Nilla Wafers", "Eggo's", "Twinkies", "Pizza"], correctAnswer: 1),
        Question(question: "What is the name of the board game that Mike, Dustin, Lucas, and Will love to play?", answers: ["Dungeons and Dragons", "Magic the Gathering", "Dragon's Lair", "Chutes and Ladders"], correctAnswer: 0),
        Question(question: "What is Barb's last name?", answers: ["Beverly", "Thomas", "Holland", "Smith"], correctAnswer: 2),
        Question(question: "What is Eleven's real name?", answers: ["Ellen", "Julie", "Elizabeth", "Jane"], correctAnswer: 3),
        Question(question: "What is the name of the monster from Season 1?", answers: ["Demodog", "Demogorgon", "Demon", "Dragon"], correctAnswer: 1),
        Question(question: "What do the kids call the place where the monsters come from and Will was trapped?", answers: ["The Outer Space", "The Other Place", "The Nether", "The Upside Down"], correctAnswer: 3)
        
    ]
    // Part 3 - Variables to track current question, position in the array, and number of correct answers
    var currentQuestion: Question?
    var currentQuestionPosition: Int = 0
    var noCorrect: Int = 0
    
    
   
}

