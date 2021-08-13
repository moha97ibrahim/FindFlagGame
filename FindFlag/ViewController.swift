//
//  ViewController.swift
//  FindFlag
//
//  Created by Mohammed Ibrahim on 13/8/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1 : UIButton!
    @IBOutlet weak var button2 : UIButton!
    @IBOutlet weak var button3 : UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]

        AskQuestion(actions: nil)
    }
    
    func AskQuestion(actions: UIAlertAction!){
        countries.shuffle()
        
        button1.setBackgroundImage(UIImage(named: countries[0]), for: .normal)
        button2.setBackgroundImage(UIImage(named: countries[1]), for: .normal)
        button3.setBackgroundImage(UIImage(named: countries[2]), for: .normal)
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        correctAnswer = Int.random(in: 0...2)
        
        title = countries[correctAnswer].uppercased()
    }


    @IBAction func buttonOne(_ sender: UIButton) {
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        }
        else {
            title = "Incorrect"
            score -= 1
        }
        
        let ac = UIAlertController(title: "Score", message: "Your Score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: AskQuestion))
        present(ac, animated: true)
    }
}

