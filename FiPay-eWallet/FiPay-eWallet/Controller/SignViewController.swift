//
//  SignViewController.swift
//  FiPay-eWallet
//
//  Created by user212276 on 2/1/22.
//

import UIKit
import Firebase

class SignViewController: UIViewController {
    
    @IBOutlet weak var fieldEmail: UITextField!
    @IBOutlet weak var fieldPassword: UITextField!
    @IBOutlet weak var singOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        
    }
    
    @IBAction func SignInButton(_ sender: UIButton) {
        validateEmail()
    }
    
    func configureView() {
        //button styling
        singOutlet.layer.cornerRadius = 8
    }
    
    func validateEmail() {
        //email validation
        if let email = fieldEmail.text, let password = fieldPassword.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                    self.showToast(message: "invalid information", font: .systemFont(ofSize: 12.0))
                } else {
                    self.performSegue(withIdentifier: "goToHome", sender: self)
                }
            }
        }
    }
    
    func showToast(message : String, font: UIFont) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75,
                                               y: self.view.frame.size.height-100,
                                               width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.8)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
}
