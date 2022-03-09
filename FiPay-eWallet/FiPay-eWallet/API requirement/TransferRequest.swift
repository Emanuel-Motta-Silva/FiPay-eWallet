//
//  Transfer Request.swift
//  FiPay-eWallet
//
//  Created by user212276 on 2/7/22.
//

import Foundation
import Alamofire

extension TransactionsViewController {
    
    func postTransfer() {
        
        let params: Parameters = [
            "quantia": Int(fieldValeu.text!)!,
            "data_transf": fieldDate.text!,
            "cliente_cpf_transf": fieldTransfer.text!
        ]
        
        Alamofire.request("https://squad1-banco.herokuapp.com/fazer_transferencia/", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 299).responseJSON { AFdata in
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: AFdata.data!) as? [String: Any] else {
                    print("Error: Cannot convert data to JSON object")
                    return
                }
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                    print("Error: Cannot convert JSON object to Pretty JSON data")
                    return
                }
                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                    print("Error: Could print JSON in String")
                    return
                }
                
                print(prettyPrintedJson)
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }
    }
    
}
