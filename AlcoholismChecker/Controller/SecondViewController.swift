//
//  SecondViewController.swift
//  AlcoholismChecker
//
//  Created by KIM Hyung Jun on 2023/07/31.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var firstAnswer: UIButton!
    @IBOutlet weak var secondAnswer: UIButton!
    @IBOutlet weak var thirdAnswer: UIButton!
    @IBOutlet weak var fourthAnswer: UIButton!
    @IBOutlet weak var fivethAnswer: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    func configureUI() {
        firstAnswer.layer.borderWidth = 2
        firstAnswer.layer.borderColor = UIColor(hexCode: "#2DDFAC").cgColor
        firstAnswer.layer.cornerRadius = 10
        firstAnswer.clipsToBounds = true
        
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
    

}
