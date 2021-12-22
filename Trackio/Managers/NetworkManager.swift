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
  
  func getCountryData(for country: String, completed: @escaping (Country?, ErrorMessages?) -> Void) {
    
    let endpoint = address + "\(country)"
    
    guard let url = URL(string: endpoint) else {
      completed(nil, .invalidUsername)
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      
      if let _ = error {
        completed(nil, .unableToComplete)
      }
      
      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        completed(nil, .invalidResponse)
        return
      }
      
      guard let data = data else {
        completed(nil, .invalidData)
        return
      }
      
      do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let countryData = try decoder.decode(Country.self, from: data)
        completed(countryData, nil)
      } catch {
        completed(nil, .invalidData)
      }
    }
    
    task.resume()
    
  }
}
