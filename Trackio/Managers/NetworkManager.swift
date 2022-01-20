//
//  NetworkManager.swift
//  Trackio
//
//  Created by Harun Gunes on 22/12/2021.
//

import UIKit

class NetworkManager {
  
  static let shared = NetworkManager()
  
  private let address = "https://disease.sh/v3/covid-19/countries/"
  let cache = NSCache<NSString, UIImage>()
  
  private init() {}
  
  func getCountryListData(completed: @escaping (Result<[Country], TrErrorMessages>) -> Void) {
    
    guard let url = URL(string: address) else {
      completed(.failure(.invalidUsername))
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      
      if let _ = error {
        completed(.failure(.unableToComplete))
      }
      
      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        completed(.failure(.invalidResponse))
        return
      }
      
      guard let data = data else {
        completed(.failure(.invalidData))
        return
      }
      
      do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let countryListData = try decoder.decode([Country].self, from: data)
        completed(.success(countryListData))
      } catch {
        completed(.failure(.invalidData))
      }
    }
    
    task.resume()
    
  }
  
  func getCountryData(for username: String, completed: @escaping (Result<Country, TrErrorMessages>) -> Void) {
    
    guard let url = URL(string: address) else {
      completed(.failure(.invalidUsername))
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      
      if let _ = error {
        completed(.failure(.unableToComplete))
      }
      
      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        completed(.failure(.invalidResponse))
        return
      }
      
      guard let data = data else {
        completed(.failure(.invalidData))
        return
      }
      
      do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let countryData = try decoder.decode(Country.self, from: data)
        completed(.success(countryData))
      } catch {
        completed(.failure(.invalidData))
      }
    }
    
    task.resume()
    
  }
}
