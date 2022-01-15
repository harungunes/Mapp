//
//  CountryListVC.swift
//  Trackio
//
//  Created by Harun Gunes on 16/12/2021.
//

import UIKit

class CountryListVC: UIViewController {
  
  var countryList: [Country] = []
  var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    title = "Trackio"
    
    configureNavigationBar()
    getCountryData()
    configureCollectionView()
  }
  
  private func configureNavigationBar() {
    navigationController?.isNavigationBarHidden = false
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  func getCountryData() {
    NetworkManager.shared.getCountryData { result in
      switch result {
      case .failure(let error):
        self.presentTrAlertVC(title: "Bad stuff happened here", body: error.rawValue, buttonTitle: "Ok")
      case .success(let countries):
        self.countryList = countries
        
        print(self.countryList[0])
      }
    }
  }
  
  func configureCollectionView() {
    collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewLayout())
    view.addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    collectionView.delegate = self
    collectionView.register(CountryCell.self, forCellWithReuseIdentifier: CountryCell.reuseID)
  }
}

extension CountryListVC: UICollectionViewDelegate {
  
}
