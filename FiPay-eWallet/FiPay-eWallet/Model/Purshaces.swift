//
//  Purshaces.swift
//  FiPay-eWallet
//
//  Created by user212276 on 2/3/22.
//

import Foundation


struct Purshaces: Codable {
    
    let valor: Int
    let descricao, dataCompra, clienteCpfCompra: String
    
    enum CodingKeys: String, CodingKey {
        case valor, descricao
        case dataCompra = "data_compra"
        case clienteCpfCompra = "cliente_cpf_compra"
    }
    
}
