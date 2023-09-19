//
//  FirstViewController.swift
//  AlcoholismChecker
//
//  Created by KIM Hyung Jun on 2023/07/31.
//
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var firstAnwser: UIButton!
    @IBOutlet weak var secondAnswer: UIButton!
    @IBOutlet weak var thirdAnswer: UIButton!
    @IBOutlet weak var fourthAnswer: UIButton!
    @IBOutlet weak var fivethAnswer: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    var surveyBrain = SurveyBrain()
    
    var gender: String?
    var age: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        updateUI()
        profile()
    }
    
    func profile() {
        if let gender = gender, let age = age {
            genderLabel.text = "성별: \(gender)"
            ageLabel.text = "나이: \(age)세"
        }
        
        if gender == "남" {
            let color = UIColor(displayP3Red: 22/255,
                                green: 210/255,
                                blue: 195/255,
                                alpha: 1)
            genderLabel.textColor = color
            ageLabel.textColor = color
        }
        else {
            let color = UIColor(displayP3Red: 218/255,
                                green: 127/255,
                                blue: 163/255,
                                alpha: 1)
            genderLabel.textColor = color
            ageLabel.textColor = color
        }
    }

    @IBAction func choiceMade(_ sender: UIButton) {
        
        let userChoice = sender.currentTitle!
        print(userChoice)
        
        surveyBrain.checkChoice(userChoice)
        print("Score: \(surveyBrain.getScore())")

        surveyBrain.nextSurvey()
        updateUI()

    }
    
    func showCompletionMessage() {
        let alertController = UIAlertController(title: "완료", message: "설문조사가 완료되었습니다.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { [weak self] _ in
            self?.dismiss(animated: true, completion: nil)
            self?.navigateToResult()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func navigateToResult() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let resultViewController = storyboard.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController {
            resultViewController.score = surveyBrain.getScore()
            resultViewController.gender = gender
            present(resultViewController, animated: true, completion: nil)
        }
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
        
        if surveyBrain.isSurveyComplete {
            showCompletionMessage()
        }
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
