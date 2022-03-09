//
//  Transfers.swift
//  FiPay-eWallet
//
//  Created by user212276 on 2/4/22.
//

import Foundation

struct Transfer: Codable {
    
    let quantia: Int
    let dataTransf, clienteCpfTransf: String
    
    enum CodingKeys: String, CodingKey {
        case quantia
        case dataTransf = "data_transf"
        case clienteCpfTransf = "cliente_cpf_transf"
    }
    
}
