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
    
    NetworkManager.shared.getCountryData(for: countryName) { country, errorMessage in
      guard let country = country else {
        self.presentTrAlertVC(title: "Bad stuff happened", body: errorMessage!.rawValue, buttonTitle: "Ok")
        return
      }
      
      print(country)
      
    }
  }
  
  private func configureNavigationBar() {
    navigationController?.isNavigationBarHidden = false
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationController?.navigationBar.tintColor = .systemGreen
  }

}
