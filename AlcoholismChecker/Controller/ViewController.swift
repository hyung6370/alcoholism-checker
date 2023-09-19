//
//  ViewController.swift
//  AlcoholismChecker
//
//  Created by KIM Hyung Jun on 2023/07/31.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstBtn: UIButton!

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
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        ageTextField.delegate = self
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func btnTapped(_ sender: UIButton) {
        
        guard let selectedSexButton = radioButtons.first(where: { $0.isSelected }),
              let sex = selectedSexButton.titleLabel?.text else {
            showAlert(message: "성별을 선택해주세요.")
            return
        }
        
        guard let ageText = ageTextField.text, !ageText.isEmpty else {
            showAlert(message: "나이를 입력해주세요.")
            return
        }
        
        guard let age = Int(ageText) else {
            showAlert(message: "올바른 나이를 입력해주세요.")
            return
        }
        
        startReady(topic: "알코올 중독", view: "firstView", gender: sex, age: age)
    }

    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "경고", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
        
    func configureUI() {
        firstBtn.layer.cornerRadius = 10
        firstBtn.clipsToBounds = true
        
        sexLabel.layer.cornerRadius = 10
        sexLabel.clipsToBounds = true
        
        ageLabel.layer.cornerRadius = 10
        ageLabel.clipsToBounds = true
    }
    
    func startReady(topic: String, view: String, gender: String, age: Int) {
        let alertController = UIAlertController(title: "자가진단", message: "\(topic) 진단을 시작 하시겠습니까?", preferredStyle: .alert)
            
            let confirmAction = UIAlertAction(title: "시작", style: .default) { [weak self] (action) in
                DispatchQueue.main.async {
                    self?.performSegue(withIdentifier: view, sender: (gender, age))
                }
            }
            
            let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            
            alertController.addAction(confirmAction)
            alertController.addAction(cancelAction)
            
            present(alertController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "firstView", let destinationVC = segue.destination as? FirstViewController {
            if let gender = (sender as? (String, Int))?.0,
               let age = (sender as? (String, Int))?.1 {
                destinationVC.gender = gender
                destinationVC.age = age
            }
        }
    }
    
    @objc private func radioButton(_ sender: UIButton) {
        print("태그 번호 : ", sender.tag)
        
        self.radioButtons.forEach {
            if $0.tag == sender.tag {
                $0.isSelected = true
                $0.setImage(UIImage(systemName: "circle.fill"), for: .normal)
            }
            else {
                $0.isSelected = false
                $0.setImage(UIImage(systemName: "circle"), for: .normal)
            }
        }
    }
    
    @IBAction func unwindToHome(_ segue: UIStoryboardSegue) {}
}

