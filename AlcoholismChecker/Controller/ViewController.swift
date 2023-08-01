//
//  ViewController.swift
//  AlcoholismChecker
//
//  Created by KIM Hyung Jun on 2023/07/31.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!

    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet var radioButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        self.radioButtons.forEach {
            $0.addTarget(self, action: #selector(self.radioButton(_ :)), for: .touchUpInside)
        }
    }



    @IBAction func btnTapped(_ sender: UIButton) {
        startReady(topic: "알코올 중독", view: "firstView")
    }
    
        
    func configureUI() {
        firstBtn.layer.cornerRadius = 10
        firstBtn.clipsToBounds = true
        
        sexLabel.layer.cornerRadius = 10
        sexLabel.clipsToBounds = true
        
        ageLabel.layer.cornerRadius = 10
        ageLabel.clipsToBounds = true
    }
    
    func startReady(topic: String, view: String) {
        let alertController = UIAlertController(title: "자가진단", message: "\(topic) 진단을 시작 하시겠습니까?", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "시작", style: .default) { [weak self] (action) in
            DispatchQueue.main.async {
                self?.performSegue(withIdentifier: view, sender: self)
            }
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @objc private func radioButton(_ sender: UIButton) {
        print("태그 번호 : ", sender.tag)
        
        self.radioButtons.forEach {
            if $0.tag == sender.tag {
                $0.setImage(UIImage(systemName: "circle.fill"), for: .normal)
            }
            else {
                $0.setImage(UIImage(systemName: "circle"), for: .normal)
            }
        }
    }
    
}

