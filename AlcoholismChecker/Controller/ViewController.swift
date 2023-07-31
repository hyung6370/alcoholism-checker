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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }



    @IBAction func btnTapped(_ sender: UIButton) {
        if sender == firstBtn {
            startReady(topic: "알코올 중독", view: "firstView")
        }
        else if sender == secondBtn {
            startReady(topic: "알코올 의존증", view: "secondView")
        }
    }
    
        
    func configureUI() {
        firstBtn.layer.cornerRadius = 10
        firstBtn.clipsToBounds = true
        
        secondBtn.layer.cornerRadius = 10
        secondBtn.clipsToBounds = true
    }
    
    func startReady(topic: String, view: String) {
        let alertController = UIAlertController(title: "자가진단", message: "\(topic) 진단을 시작 하시겠습니까?", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "시작", style: .default) { [weak self] (action) in
            // Segue를 호출하기 전에 확인 창이 닫힐 때까지 기다리도록 비동기적으로 실행합니다.
            DispatchQueue.main.async {
                self?.performSegue(withIdentifier: view, sender: self)
            }
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
}

