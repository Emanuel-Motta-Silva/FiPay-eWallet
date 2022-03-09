//
//  ViewController.swift
//  FiPay-eWallet
//
//  Created by user212276 on 2/1/22.
//

import UIKit
import Alamofire

class InitialViewController: UIViewController {
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        
    }
    
    func configureView() {
        //button styling
        signInButton.layer.cornerRadius = 8
        createAccountButton.layer.borderColor = UIColor.white.cgColor
        createAccountButton.layer.borderWidth = 1
        createAccountButton.layer.cornerRadius = 8
    }
    
}

