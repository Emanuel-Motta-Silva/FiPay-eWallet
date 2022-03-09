//
//  ConversionViewController.swift
//  FiPay-eWallet
//
//  Created by user212276 on 2/3/22.
//

import UIKit

class ConversionViewController: UIViewController {
    
    @IBOutlet weak var viewAll: UIView!
    @IBOutlet weak var viewFrom: UIView!
    @IBOutlet weak var viewTo: UIView!
    @IBOutlet weak var buttonCheck: UIButton!
    @IBOutlet weak var btnFrom: UIButton!
    @IBOutlet weak var btnTo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        
    }
    
    @IBAction func buttonFrom(_ sender: UIButton) {
        btnFrom.changesSelectionAsPrimaryAction = true
        btnFrom.showsMenuAsPrimaryAction = true
    }
    
    @IBAction func buttonTo(_ sender: UIButton) {}
    
    func configureView () {
        viewAll.layer.borderWidth = 1
        viewAll.layer.borderColor = UIColor.purple.cgColor
        viewAll.layer.cornerRadius = 8
        
        viewFrom.layer.borderWidth = 1
        viewFrom.layer.borderColor = UIColor.purple.cgColor
        viewFrom.layer.cornerRadius = 8
        
        viewTo.layer.borderWidth = 1
        viewTo.layer.borderColor = UIColor.purple.cgColor
        viewTo.layer.cornerRadius = 8
        
        buttonCheck.layer.cornerRadius = 8
    }
    
}
