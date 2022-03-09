//
//  CreateViewController.swift
//  FiPay-eWallet
//
//  Created by user212276 on 2/1/22.
//

import UIKit
import Firebase

class CreateViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var cpf: UITextField!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var street: UITextField!
    @IBOutlet weak var createButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        setupLayout()
        
    }
    
    @IBAction func createAccountPressed(_ sender: UIButton) {
        createUser()
        postRegister()
    }
    
    func configureView() {
        //button styling
        createButton.layer.cornerRadius = 8
        createButton.isEnabled = false
        
    }
    
    //field delegates
    func setupLayout() {
        fullName.delegate = self
        email.delegate = self
        password.delegate = self
        cpf.delegate = self
        country.delegate = self
        state.delegate = self
        city.delegate = self
        street.delegate = self
    }
    
    //function to map field event
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        validateFields()
        return true
    }
    
    func createUser() {
        if let email = email.text, let password = password.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: "registerToHome", sender: self)
                }
            }
        }
    }
    
    func showToast(message : String, font: UIFont) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75,
                                               y: self.view.frame.size.height-140,
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
    
    func validateFields() {
        if fullName.text != "" &&
            email.text!.isValidEmail &&
            password.text != "" &&
            cpf.text!.isValidCPF &&
            country.text != "" &&
            state.text != "" &&
            city.text != "" &&
            street.text != "" {
            
            createButton.isEnabled = true
            
        } else {
            createButton.isEnabled = false
        }
    }
    
}


//Regex
extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}

//Function to validate cpf
extension Collection where Element == Int {
    var digitoCPF : Int {
        var number = count + 2
        let digit = 11 - reduce(into: 0) {
            number -= 1
            $0 += $1 * number
        } % 11
        return digit > 9 ? 0 : digit
    }
}

extension StringProtocol {
    var isValidCPF : Bool {
        let numbers = compactMap(\.wholeNumberValue)
        guard numbers.count == 11 && Set(numbers).count != 1 else { return false }
        return numbers.prefix(9).digitoCPF == numbers[9] &&
        numbers.prefix(10).digitoCPF == numbers[10]
    }
}
