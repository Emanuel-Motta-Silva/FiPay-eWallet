//
//  HomeViewController.swift
//  FiPay-eWallet
//
//  Created by user212276 on 2/2/22.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var invoiceLabel: UILabel!
    
    var purshace: [Purshaces] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        fetchPurshaces()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchPurshaces()
    }
    
    @IBAction func reloadPressed(_ sender: UIButton) {
        fetchPurshaces()
    }
    
    func setupLayout() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PurshaceCell", for: indexPath) as! PurshaceCell
        let pursh = purshace[indexPath.row]
        cell.configureCell(purshace: pursh)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return purshace.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 98
       }
    
}
