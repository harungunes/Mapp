//
//  CountryVC.swift
//  Trackio
//
//  Created by Harun Gunes on 17/12/2021.
//

import UIKit

class CountryVC: UIViewController {
  
  var countryName: String!
  var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configure()
    getCountry()
    configureCollectionView()
  }
  
  private func configure() {
    view.backgroundColor = .systemBackground
    title = countryName
    
    navigationController?.isNavigationBarHidden = false
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationController?.navigationBar.tintColor = .systemPurple
  }
  
  func getCountry() {
    
    NetworkManager.shared.getCountryData(for: countryName) { result in
      
      switch result {
      case .success(let country):
        print(country.cases)
      case .failure(let error):
        self.presentTrAlertVC(title: "Bad stuff happened", body: error.rawValue, buttonTitle: "Ok")
      }
    }
  }
  
  func configureCollectionView() {
    collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewLayout())
    view.addSubview(collectionView)
    collectionView.backgroundColor = .systemPink
    collectionView.register(CountryCell.self, forCellWithReuseIdentifier: CountryCell.reuseID)
  }
}
