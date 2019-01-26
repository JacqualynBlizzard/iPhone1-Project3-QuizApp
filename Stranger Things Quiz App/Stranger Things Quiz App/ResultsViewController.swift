//
//  ResultsViewController.swift
//  Stranger Things Quiz App
//
//  Created by Jacqualyn Blizzard-Caron on 1/25/19.
//  Copyright © 2019 Jacqualyn Blizzard-Caron. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultsMessageLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var noCorrect: Int = 0
    var total: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "You got \(noCorrect) out of \(total)!"
        // Extension 5
        // resultsMessageLabel.text = "Hey Stranger Things Fan"
        var percentRight = (Double(noCorrect) / Double(total))*100
        var message = ""
        if(percentRight < 40) {
            message = "That was awful!"
        } else if(percentRight < 75) {
            message = "Not bad."
        } else {
            message = "Great job!"
        }
        resultsMessageLabel.text = message
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
