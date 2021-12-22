//
//  NetworkManager.swift
//  Trackio
//
//  Created by Harun Gunes on 22/12/2021.
//

import Foundation

class NetworkManager {
  static let shared = NetworkManager()
  
  let address = "https://disease.sh/v3/covid-19/countries/"
  
  private init() {}
  
  func getCountryData(for country: String, completed: @escaping ([Country]?, String?) -> Void) {
    
    let endpoint = address + "\(country)"
    
    guard let url = URL(string: endpoint) else {
      completed(nil, "Invalid username")
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      
      if let _ = error {
        completed(nil, "There is a problem. Please check your internet connection")
      }
      
      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        completed(nil, "Invalid response")
        return
      }
      
      guard let data = data else {
        completed(nil, "Invalid data")
        return
      }
      
      do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let country = try decoder.decode([Country].self, from: data)
        completed(country, nil)
      } catch {
        completed(nil, "Invalid data")
      }
    }
    
    task.resume()
    
  }
}
