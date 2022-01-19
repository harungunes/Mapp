//
//  CountryListVC.swift
//  Trackio
//
//  Created by Harun Gunes on 16/12/2021.
//

import UIKit

class CountryListVC: UIViewController {
  
  enum Section { case main }
  
  var countryList: [Country] = []
  var filteredCountries: [Country] = []
  var collectionView: UICollectionView!
  var dataSource: UICollectionViewDiffableDataSource<Section, Country>!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    title = "Trackio"
    
    configureNavigationBar()
    configureSearchController()
    getCountryData()
    configureCollectionView()
    configureDataSource()
  }
  
  private func configureNavigationBar() {
    navigationController?.isNavigationBarHidden = false
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  func configureSearchController() {
    let searchController = UISearchController()
    searchController.searchBar.delegate = self
    searchController.searchResultsUpdater = self
    searchController.searchBar.placeholder = "Search"
    searchController.obscuresBackgroundDuringPresentation = false
    navigationItem.searchController = searchController
  }
  
  func getCountryData() {
    NetworkManager.shared.getCountryData { [weak self] result in
      guard let self = self else { return }
      
      switch result {
      case .failure(let error):
        self.presentTrAlertVC(title: "Bad stuff happened here", body: error.rawValue, buttonTitle: "Ok")
      case .success(let countries):
        self.countryList = countries
        self.updateData(for: self.countryList)
      }
    }
  }
  
  func configureCollectionView() {
    collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createOneColumnLayout(in: view))
    view.addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    collectionView.backgroundColor = .systemBackground
    collectionView.register(CountryCell.self, forCellWithReuseIdentifier: CountryCell.reuseID)
  }
  
  func configureDataSource() {
    dataSource = UICollectionViewDiffableDataSource<Section, Country>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, country) -> UICollectionViewCell? in
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CountryCell.reuseID, for: indexPath) as! CountryCell
      cell.set(country: country)
      return cell
    })
  }
  
  func updateData(for counties: [Country]) {
    var snapshot = NSDiffableDataSourceSnapshot<Section, Country>()
    snapshot.appendSections([.main])
    snapshot.appendItems(counties)
    DispatchQueue.main.async { self.dataSource.apply(snapshot,animatingDifferences: true) }
  }
}


extension CountryListVC: UISearchResultsUpdating, UISearchBarDelegate {
  func updateSearchResults(for searchController: UISearchController) {
    guard let filter = searchController.searchBar.text, !filter.isEmpty else { return }
    
    filteredCountries = countryList.filter { $0.country.lowercased().contains(filter.lowercased()) }
    updateData(for: filteredCountries)
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    updateData(for: countryList)
  }
  
}
