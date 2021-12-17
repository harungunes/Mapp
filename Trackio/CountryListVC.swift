//
//  CountryListVC.swift
//  Trackio
//
//  Created by Harun Gunes on 16/12/2021.
//

import UIKit

class CountryListVC: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    title = "Countries"
    configureNavigationBar()
  }
  
  private func configureNavigationBar() {
    navigationController?.isNavigationBarHidden = false
    navigationController?.navigationBar.prefersLargeTitles = true
  }
}
