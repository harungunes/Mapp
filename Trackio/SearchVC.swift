//
//  SearchVC.swift
//  Trackio
//
//  Created by Harun Gunes on 16/12/2021.
//

import UIKit

class SearchVC: UIViewController {
  
  // MARK: - Properties
  let tLogo = UIImageView()
  let countryTextField = TrTextField()
  
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    navigationController?.isNavigationBarHidden = true
    
    configureTLogo()
    configureTrTextField()
  }
  
  // MARK: - Helpers
  func configureTLogo() {
    view.addSubview(tLogo)
    tLogo.translatesAutoresizingMaskIntoConstraints = false
    tLogo.image = UIImage(named: "trackio-logo")
    
    NSLayoutConstraint.activate([
      tLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
      tLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      tLogo.heightAnchor.constraint(equalToConstant: 200),
      tLogo.widthAnchor.constraint(equalToConstant: 200)
    ])
  }
  
  func configureTrTextField() {
    view.addSubview(countryTextField)
    
    NSLayoutConstraint.activate([
      countryTextField.topAnchor.constraint(equalTo: tLogo.bottomAnchor, constant: 50),
      countryTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      countryTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
      countryTextField.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
  
}
