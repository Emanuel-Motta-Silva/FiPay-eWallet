//
//  PurshaceCellTableViewController.swift
//  FiPay-eWallet
//
//  Created by user212276 on 2/8/22.
//

import UIKit

class PurshaceCell: UITableViewCell{
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var purshace : Purshaces!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureCell(purshace: Purshaces) {
        self.purshace = purshace
        
        descriptionLabel.text = self.purshace.descricao.capitalized
        dateLabel.text = self.purshace.dataCompra
        priceLabel.text = ("$ \(self.purshace.valor)")
    }
    
}
