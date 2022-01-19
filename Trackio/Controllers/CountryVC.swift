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
  }
  
  private func configure() {
    view.backgroundColor = .systemBlue
    
    let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
    navigationItem.rightBarButtonItem = doneButton
    navigationController?.navigationBar.tintColor = .systemGreen
  }
  
  @objc
  func dismissVC() {
    dismiss(animated: true)
  }
}
