//
//  CountryVC.swift
//  Trackio
//
//  Created by Harun Gunes on 17/12/2021.
//

import UIKit

class CountryVC: UIViewController {
  
  var countryName: String!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    title = countryName
    configureNavigationBar()
    
    NetworkManager.shared.getCountryData(for: countryName) { result in
      
      switch result {
      case .success(let country):
        print(country.cases)
      case .failure(let error):
        print(error.rawValue)
      }
      
    }
  }
  
  private func configureNavigationBar() {
    navigationController?.isNavigationBarHidden = false
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationController?.navigationBar.tintColor = .systemPurple
  }

}
