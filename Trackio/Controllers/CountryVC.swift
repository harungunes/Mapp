//
//  CountryVC.swift
//  Trackio
//
//  Created by Harun Gunes on 17/12/2021.
//

import UIKit

class CountryVC: UIViewController {
  
  var countryName: String!
  
  let headerView = UIView()
  let statsView = UIView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configure()
    getCountryData()
    configureLayout()
  }
  
  private func configure() {
    view.backgroundColor = .systemBackground
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
        DispatchQueue.main.sync {
          self.add(childVC: CountryInfoHeaderVC(country: country), to: self.headerView)
          self.add(childVC: StatsItemVC(country: country), to: self.statsView)
        }
        
      }
    }
  }
  
  func configureLayout() {
    view.addSubview(headerView)
    view.addSubview(statsView)
    
    headerView.translatesAutoresizingMaskIntoConstraints = false
    statsView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      headerView.heightAnchor.constraint(equalToConstant: 170),
      
      statsView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10),
      statsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      statsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      statsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
  
  func add(childVC: UIViewController, to containerView: UIView) {
    addChild(childVC)
    containerView.addSubview(childVC.view)
    childVC.view.frame = view.bounds
    childVC.didMove(toParent: self)
  }
  
  @objc
  func dismissVC() {
    dismiss(animated: true)
  }
}
