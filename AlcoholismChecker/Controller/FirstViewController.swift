//
//  FirstViewController.swift
//  AlcoholismChecker
//
//  Created by KIM Hyung Jun on 2023/07/31.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var firstAnwser: UIButton!
    @IBOutlet weak var secondAnswer: UIButton!
    @IBOutlet weak var thirdAnswer: UIButton!
    @IBOutlet weak var fourthAnswer: UIButton!
    @IBOutlet weak var fivethAnswer: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    var surveyBrain = SurveyBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        updateUI()
    }
    

    @IBAction func choiceMade(_ sender: UIButton) {
        
        let userChoice = sender.currentTitle!
        print(userChoice)
        
        surveyBrain.checkChoice(userChoice)
        print("Score: \(surveyBrain.getScore())")
        
        surveyBrain.nextSurvey()
        
        updateUI()
    }
    
    
    func configureUI() {
        firstAnwser.layer.borderWidth = 2
        firstAnwser.layer.borderColor = UIColor(hexCode: "#2DDFAC").cgColor
        firstAnwser.layer.cornerRadius = 10
        firstAnwser.clipsToBounds = true
        
        secondAnswer.layer.borderWidth = 2
        secondAnswer.layer.borderColor = UIColor(hexCode: "#2DDFAC").cgColor
        secondAnswer.layer.cornerRadius = 10
        secondAnswer.clipsToBounds = true
        
        thirdAnswer.layer.borderWidth = 2
        thirdAnswer.layer.borderColor = UIColor(hexCode: "#2DDFAC").cgColor
        thirdAnswer.layer.cornerRadius = 10
        thirdAnswer.clipsToBounds = true
        
        fourthAnswer.layer.borderWidth = 2
        fourthAnswer.layer.borderColor = UIColor(hexCode: "#2DDFAC").cgColor
        fourthAnswer.layer.cornerRadius = 10
        fourthAnswer.clipsToBounds = true
        
        fivethAnswer.layer.borderWidth = 2
        fivethAnswer.layer.borderColor = UIColor(hexCode: "#2DDFAC").cgColor
        fivethAnswer.layer.cornerRadius = 10
        fivethAnswer.clipsToBounds = true
    }
    
    func updateUI() {
        questionLabel.text = surveyBrain.getSurveyTitle()
        progressBar.progress = surveyBrain.getProgress()
            
        firstAnwser.setTitle(surveyBrain.getChoice1(), for: .normal)
        secondAnswer.setTitle(surveyBrain.getChoice2(), for: .normal)
        thirdAnswer.setTitle(surveyBrain.getChoice3(), for: .normal)
        fourthAnswer.setTitle(surveyBrain.getChoice4(), for: .normal)
        fivethAnswer.setTitle(surveyBrain.getChoice5(), for: .normal)
    }
}

extension UIColor {
    
    convenience init(hexCode: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hexCode.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}
