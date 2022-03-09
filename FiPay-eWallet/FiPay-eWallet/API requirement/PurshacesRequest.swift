//
//  PurshacesRequest.swift
//  FiPay-eWallet
//
//  Created by user212276 on 2/7/22.
//

import Foundation
import Alamofire

extension TransactionsViewController {
    
    func postPurshace() {
        
        let params: Parameters = [
            "valor": Int(fieldValeu.text!)!,
            "descricao": fieldDescription.text!,
            "data_compra": fieldDate.text!,
            "cliente_cpf_compra": fieldTransfer.text!
            ]
            
            Alamofire.request("https://squad1-banco.herokuapp.com/fazer_compra/", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 299).responseJSON { AFdata in
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

extension HomeViewController {
    
    func fetchPurshaces() {
            Alamofire .request("https://squad1-banco.herokuapp.com/fazer_compra/")
                .responseJSON { (response) in
                    let decoder = JSONDecoder()
                    let purshaces: [Purshaces] = try! decoder.decode([Purshaces].self, from: response.data!)
                    //print(purshaces)
                    self.purshace = purshaces
                    let totalValeu = self.purshace.map{$0.valor}.reduce(0, +)
                    self.invoiceLabel.text =  "$ " + String(totalValeu)
                    self.tableView.reloadData()
                }
        }
    
}

