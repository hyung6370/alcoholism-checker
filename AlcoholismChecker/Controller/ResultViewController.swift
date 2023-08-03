//
//  ResultViewController.swift
//  AlcoholismChecker
//
//  Created by KIM Hyung Jun on 2023/08/01.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var totalScoreLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var orangeLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    
    @IBOutlet weak var restartButton: UIButton!
    
    var score: Int = 0
    var gender: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalScoreLabel.text = "\(score)점"
        configureUI()
        decideRange(totalScore: score)
    }
    
    func configureUI() {
        resultLabel.layer.cornerRadius = 15
        resultLabel.clipsToBounds = true
        
        restartButton.layer.cornerRadius = 15
        resultLabel.clipsToBounds = true
    
        firstLabel.addBottomBorder(with: UIColor.lightGray, andWidth: CGFloat(1.0))
        secondLabel.addBottomBorder(with: UIColor.lightGray, andWidth: CGFloat(1.0))
        thirdLabel.addBottomBorder(with: UIColor.lightGray, andWidth: CGFloat(1.0))
    }
    
    func decideRange(totalScore: Int) {
        
        guard let gender = gender else {
            // 성별 데이터가 없을 경우 예외 처리
            return
        }

        if gender == "남" {
            switch totalScore {
            case 0..<10:
                let color = UIColor(displayP3Red: 22/255,
                                    green: 231/255,
                                    blue: 207/255,
                                    alpha: 1)
                
                resultLabel.text = "적정음주군"
                resultLabel.backgroundColor = color
                totalScoreLabel.textColor = color
                descriptionLabel.text = "당신의 음주는 정상 수준으로 바람직한 음주를 하고 있습니다. 지금과 같은 음주습관을 유지하시되, 건강 음주 지침을 지켜주세요."
                
                
            case 10..<20:
                let color = UIColor(displayP3Red: 255/255,
                                    green: 150/255,
                                    blue: 141/255,
                                    alpha: 1)
                
                resultLabel.text = "위험음주군"
                resultLabel.backgroundColor = color
                totalScoreLabel.textColor = color
                descriptionLabel.text = "당신의 음주는 위험한 수준입니다. 지금 당장은 많은 문제가 없을지라도 습관적인 과음으로 인해 심각한 문제가 발생할 수 있습니다. 전문기관의 도움을 받아 지금 음주습관을 바로 잡으시길 권합니다."
                
            case 20...:
                let color = UIColor(displayP3Red: 255/255,
                                    green: 100/255,
                                    blue: 78/255,
                                    alpha: 1)
                
                resultLabel.text = "고위험군"
                resultLabel.backgroundColor = color
                totalScoreLabel.textColor = color
                descriptionLabel.text = "당신의 음주는 매우 위험한 수준으로, 술을 끊거나 줄일 것을 권장합니다."
                
            default:
                let color = UIColor.white
            }
            
            firstLabel.text = "0 ~ 9"
            secondLabel.text = "10 ~ 19"
            thirdLabel.text = "20 이상"
            
        } else {
            switch totalScore {
            case 0..<6:
                let color = UIColor(displayP3Red: 22/255,
                                    green: 231/255,
                                    blue: 207/255,
                                    alpha: 1)
                
                resultLabel.text = "적정음주군"
                resultLabel.backgroundColor = color
                totalScoreLabel.textColor = color
                descriptionLabel.text = "당신의 음주는 정상 수준으로 바람직한 음주를 하고 있습니다. 지금과 같은 음주습관을 유지하시되, 건강 음주 지침을 지켜주세요."
                
                
            case 6..<10:
                let color = UIColor(displayP3Red: 255/255,
                                    green: 150/255,
                                    blue: 141/255,
                                    alpha: 1)
                
                resultLabel.text = "위험음주군"
                resultLabel.backgroundColor = color
                totalScoreLabel.textColor = color
                descriptionLabel.text = "당신의 음주는 위험한 수준입니다. 지금 당장은 많은 문제가 없을지라도 습관적인 과음으로 인해 심각한 문제가 발생할 수 있습니다. 전문기관의 도움을 받아 지금 음주습관을 바로 잡으시길 권합니다."
                
            case 10...:
                let color = UIColor(displayP3Red: 255/255,
                                    green: 100/255,
                                    blue: 78/255,
                                    alpha: 1)
                
                resultLabel.text = "고위험군"
                resultLabel.backgroundColor = color
                totalScoreLabel.textColor = color
                descriptionLabel.text = "당신의 음주는 매우 위험한 수준으로, 술을 끊거나 줄일 것을 권장합니다."
                
            default:
                let color = UIColor.white
            }
            
            firstLabel.text = "0 ~ 5"
            secondLabel.text = "6 ~ 9"
            thirdLabel.text = "10 이상"
        }

    }

    @IBAction func restartBtnTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "unwindToHome", sender: self)
    }

}

extension UILabel {
    func addBottomBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        border.frame = CGRect(x: 0, y: self.frame.height - borderWidth, width: self.frame.width, height: borderWidth)
        self.addSubview(border)
    }
}
