//
//  ResultsViewController.swift
//  Hamilton Trivia!
//
//  Created by Girls Who Code on 7/10/19.
//  Copyright © 2019 Girls Who Code. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var numCorrect: Int = 0
    var total: Int = 0
    var successMessages: [String] = ["Just you wait!","The world will never be the same!","What's your name, man?","Look around, look around!","History has it's eyes on you!","You're non-stop!","You're blowing us all away!","Congratulations!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var percent: Int = ((numCorrect * 100) / total)
        
        // Do any additional setup after loading the view.
        if (percent <= 25) {
            messageLabel.text = "What'd I miss? You only got"
        } else if (percent <= 50) {
            messageLabel.text = "Don't throw away your shot! You got"
        } else if (percent <= 75) {
            messageLabel.text = "Wait for it... you got..."
        } else {
            messageLabel.text = "\(successMessages.randomElement() ?? "Congratulations!") You got"
        }
        scoreLabel.text = "\(numCorrect) out of \(total) questions correct!"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
