//
//  Deposits.swift
//  FiPay-eWallet
//
//  Created by user212276 on 2/4/22.
//

import Foundation


struct Deposits: Codable {
    
    let quantia: Int
    let dataDep: String
    let clienteCpfDep: String?
    let idDep: String?
    
    enum CodingKeys: String, CodingKey {
        case quantia
        case dataDep = "data_dep"
        case clienteCpfDep = "cliente_cpf_dep"
        case idDep = "id_dep"
    }
    
}
