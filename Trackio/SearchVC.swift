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
  
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    
    configureTLogo()
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
  
  
  
}
