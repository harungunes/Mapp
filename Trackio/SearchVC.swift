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
  let callToActionButton = TrButton(backgroundColor: .systemGreen, title: "Get Data")
  
  var isCountryEntered: Bool {
    return !(countryTextField.text!.isEmpty)
  }
  
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    title = "Search"
    
    configureTLogo()
    configureTrTextField()
    configureCTAButton()
    dismissKeyboard()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.isNavigationBarHidden = true
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
    countryTextField.delegate = self
    
    NSLayoutConstraint.activate([
      countryTextField.topAnchor.constraint(equalTo: tLogo.bottomAnchor, constant: 50),
      countryTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      countryTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
      countryTextField.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
  
  func dismissKeyboard() {
    let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
    view.addGestureRecognizer(tap)
  }
  
  func configureCTAButton() {
    view.addSubview(callToActionButton)
    callToActionButton.addTarget(self, action: #selector(getData), for: .touchUpInside)
    
    NSLayoutConstraint.activate([
      callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
      callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
      callToActionButton.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
  
  func pushCountryVC() {
    guard isCountryEntered else {
      print("No country entered")
      return
    }
    
    let countryVC = CountryVC()
    countryVC.title = countryTextField.text
    navigationController?.pushViewController(countryVC, animated: true)
  }
  
  // MARK: - Objective-C functions
  
  @objc
  func getData() {
    pushCountryVC()
  }
  
}

extension SearchVC: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    pushCountryVC()
    return true
  }
}
