//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Likhit Garimella
//  Copyright © 2021 Likhit Garimella. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    
    let apiKey = "6D649FE5-5F60-43CF-8901-179E7FBBF65A"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
        
        /// Use string concatenation to add the selected currency at the end of the baseURL along with the API key.
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        
        /// Use optional binding to unwrap the URL that's created from the urlString
        if let url = URL(string: urlString) {
            
            /// Create a new URLSession object with default configuration.
            let session = URLSession(configuration: .default)
            
            /// Create a new data task for the URLSession
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    print(error!)
                    return
                }
                
                /// Format the data we got back as a string to be able to print it.
                let dataAsString = String(data: data!, encoding: .utf8)
                print(dataAsString)
                
            }
            
            /// Start task to fetch data from bitcoin average's servers.
            task.resume()
            
        }
        
    }
    
}   // #52
