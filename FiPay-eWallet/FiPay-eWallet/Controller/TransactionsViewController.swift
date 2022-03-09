//
//  TransactionsViewController.swift
//  FiPay-eWallet
//
//  Created by user212276 on 2/2/22.
//

import UIKit
import Alamofire

class TransactionsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var switchDeposits: UISwitch!
    @IBOutlet weak var switchPurchases: UISwitch!
    @IBOutlet weak var switchTransfers: UISwitch!
    @IBOutlet weak var validateButton: UIButton!
    
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var viewBottom: UIView!
    @IBOutlet weak var viewValue: UIView!
    @IBOutlet weak var viewDate: UIView!
    @IBOutlet weak var viewTransfer: UIView!
    
    @IBOutlet weak var fieldValeu: UITextField!
    @IBOutlet weak var fieldDate: UITextField!
    @IBOutlet weak var fieldDescription: UITextField!
    @IBOutlet weak var fieldTransfer: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        setupLayout()
        
    }
    
    //field delegates
    func setupLayout() {
        fieldValeu.delegate = self
        fieldDate.delegate = self
        fieldTransfer.delegate = self
        fieldDescription.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        validateField()
        
        return true
    }
    
    @IBAction func validateClicked(_ sender: UIButton) {
        if switchDeposits.isOn {
            postDeposit()
        } else if switchPurchases.isOn {
            postPurshace()
        } else {
            postTransfer()
        }
    }
    
    @IBAction func mySwitchDeposits(_ sender: UISwitch) {
        switchPurchases.isEnabled = false
        switchTransfers.isEnabled = false
        
        if switchDeposits.isOn {
            validateButton.isEnabled = true
        } else {
            validateButton.isEnabled = false
            switchPurchases.isEnabled = true
            switchTransfers.isEnabled = true
        }
    }
    
    @IBAction func mySwitchPurchases(_ sender: UISwitch) {
        switchDeposits.isEnabled = false
        switchTransfers.isEnabled = false
        
        if switchPurchases.isOn {
            validateButton.isEnabled = true
        } else {
            validateButton.isEnabled = false
            switchDeposits.isEnabled = true
            switchTransfers.isEnabled = true
        }
    }
    
    @IBAction func mySwitchTransfers(_ sender: UISwitch) {
        switchDeposits.isEnabled = false
        switchPurchases.isEnabled = false
        
        if switchTransfers.isOn {
            validateButton.isEnabled = true
        } else {
            validateButton.isEnabled = false
            switchDeposits.isEnabled = true
            switchPurchases.isEnabled = true
        }
    }
    
    func validateField() {
        
        if fieldDate.text != "" &&
            fieldValeu.text != "" &&
            fieldTransfer.text!.isValidCPF &&
            fieldDescription.text != "" {
            
            validateButton.isEnabled = true
            
        } else {
            validateButton.isEnabled = false
        }
        
    }
    
    func configureView() {
        viewTop.layer.borderWidth = 1
        viewTop.layer.borderColor = UIColor.gray.cgColor
        viewTop.layer.cornerRadius = 8
        
        viewBottom.layer.borderWidth = 1
        viewBottom.layer.borderColor = UIColor.blue.cgColor
        viewBottom.layer.cornerRadius = 8
        
        viewValue.layer.borderWidth = 1
        viewValue.layer.borderColor = UIColor.blue.cgColor
        viewValue.layer.cornerRadius = 8
        
        viewDate.layer.borderWidth = 1
        viewDate.layer.borderColor = UIColor.blue.cgColor
        viewDate.layer.cornerRadius = 8
        
        viewTransfer.layer.borderWidth = 1
        viewTransfer.layer.borderColor = UIColor.blue.cgColor
        viewTransfer.layer.cornerRadius = 8
        
        validateButton.layer.cornerRadius = 8
        
        switchTransfers.setOn(false, animated: false)
        switchDeposits.setOn(false, animated: false)
        switchPurchases.setOn(false, animated: false)
    }
    
}
