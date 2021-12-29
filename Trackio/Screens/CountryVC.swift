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
    collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createFlowLayout())
    view.addSubview(collectionView)
    collectionView.backgroundColor = .systemPink
    collectionView.register(CountryCell.self, forCellWithReuseIdentifier: CountryCell.reuseID)
  }
  
  func createFlowLayout() -> UICollectionViewFlowLayout {
    let width = view.bounds.width
    let padding: CGFloat = 12
    let cellWidth = width - (padding * 2)
    
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth / 4)
    
    return flowLayout
  }
}
