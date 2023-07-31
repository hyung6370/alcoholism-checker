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


    @IBAction func firstBtnTapped(_ sender: UIButton) {
        let alertController = UIAlertController(title: "자가진단", message: "알코올 중독 진단을 시작 하시겠습니까?", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "확인", style: .default) { (action) in
            self.performSegue(withIdentifier: "firstView", sender: self)
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func secondBtnTapped(_ sender: UIButton) {
        
    }
    
    func configureUI() {
        firstBtn.layer.cornerRadius = 10
        firstBtn.clipsToBounds = true
        
        secondBtn.layer.cornerRadius = 10
        secondBtn.clipsToBounds = true
    }
}

