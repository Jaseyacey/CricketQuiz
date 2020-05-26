//
//  ViewController.swift
//  CricketQuiz
//
//  Created by Jason Beedle on 23/05/2020.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let questions = [
        "Who is Englands lead test wicket taker?",
        "Who is Englands leading run scorer?",
        "What ground is called The Bullring?",
        "Who scored the most runs in the 438 game?",
        "What is the most important aspect of village cricket?",
        "In village cricket do you give LBW's?"
    ]
    
    let answers = [
        ["Jimmy Anderson", "Fred Trueman", "Sir Ian Botham"],
        ["Alistair Cook","Joe Root","Ben Stokes"],
        ["Wanderers", "The Oval", "Lords"],
        ["Herschelle Gibbs", "Ricky Ponting", "Jonty Rhodes"],
        ["Teas", "Tins", "Pints after the game?"],
        ["Only if he is plum", "No", "Did they give any LBW's?"],
    ]
    
        //Variables
        var currentQuestion = 0
        var rightAnswerPlacement:UInt32 = 0
        var points = 0;
        
        //Label
        @IBOutlet weak var lbl: UILabel!
        
        //Button
        @IBAction func action(_ sender: AnyObject)
        {
            if (sender.tag == Int(rightAnswerPlacement))
            {
                print ("RIGHT!")
                points += 1
            }
            else
            {
                print ("WRONG!!!!!!")
            }
            
            if (currentQuestion != questions.count)
            {
                newQuestion()
            }
            else
            {
                performSegue(withIdentifier: "showScore", sender: self)
            }
        }
        
    
    
    override func viewDidAppear(_ animated: Bool)
        {
            newQuestion()
        }
        
        //Function that displays new question
        func newQuestion()
        {
            lbl.text = questions[currentQuestion]
            
            rightAnswerPlacement = arc4random_uniform(3)+1
            
            //Create a button
            var button:UIButton = UIButton()
            
            var x = 1
            
            for i in 1...3
            {
                //Create a button
                button = view.viewWithTag(i) as! UIButton
                
                if (i == Int(rightAnswerPlacement))
                {
                    button.setTitle(answers[currentQuestion][0], for: .normal)
                }
                else
                {
                    button.setTitle(answers[currentQuestion][x], for: .normal)
                    x = 2
                }
            }
            currentQuestion += 1
        }
        
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
        }

        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }


    }

