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
    
    configure()
    getCountryData()
  }
  
  private func configure() {
    let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
    navigationItem.rightBarButtonItem = doneButton
    navigationController?.navigationBar.tintColor = .systemGreen
  }
  
  func getCountryData() {
    NetworkManager.shared.getCountryData(for: countryName) { [weak self] result in
      guard let self = self else { return }
      
      switch result {
      case .failure(let error):
        self.presentTrAlertVC(title: "Something went wrong", body: error.rawValue, buttonTitle: "Ok")
      case .success(let country):
        print(country)
      }
    }
  }
  
  @objc
  func dismissVC() {
    dismiss(animated: true)
  }
}
