//
//  StatsItemVC.swift
//  Trackio
//
//  Created by Harun Gunes on 12/02/2022.
//

import UIKit

class StatsItemVC: UIViewController {
  
  let switchButton = UISwitch(frame: .zero)
  
  var country: Country!
  
  let casesItem = TrItemInfoView(frame: .zero)
  let deathsItem = TrItemInfoView(frame: .zero)
  let recoveredItem = TrItemInfoView(frame: .zero)
  let switchButtonTitle = TrBodyLabel(textAlignment: .center)
  
  
  init(country: Country) {
    super.init(nibName: nil, bundle: nil)
    self.country = country
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureSwitchButton()
    configure()
    loadData()
  }
  
  
  func loadData() {
    casesItem.set(country: country, caseType: .cases)
    deathsItem.set(country: country, caseType: .deaths)
    recoveredItem.set(country: country, caseType: .recovered)
  }
  
  
  private func configure() {
    view.addSubview(casesItem)
    view.addSubview(deathsItem)
    view.addSubview(recoveredItem)
    
    let padding: CGFloat = 20
    let height: CGFloat = 125
    let width: CGFloat = 300
    
    NSLayoutConstraint.activate([
      casesItem.topAnchor.constraint(equalTo: switchButton.bottomAnchor, constant: padding + 10),
      casesItem.widthAnchor.constraint(equalToConstant: width),
      casesItem.heightAnchor.constraint(equalToConstant: height),
      casesItem.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      deathsItem.topAnchor.constraint(equalTo: casesItem.bottomAnchor, constant: padding),
      deathsItem.widthAnchor.constraint(equalToConstant: width),
      deathsItem.heightAnchor.constraint(equalToConstant: height),
      deathsItem.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      recoveredItem.topAnchor.constraint(equalTo: deathsItem.bottomAnchor, constant: padding),
      recoveredItem.widthAnchor.constraint(equalToConstant: width),
      recoveredItem.heightAnchor.constraint(equalToConstant: height),
      recoveredItem.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    ])
  }
  
  
  func configureSwitchButton() {
    view.addSubview(switchButtonTitle)
    view.addSubview(switchButton)
    
    switchButtonTitle.text = "Total"
    switchButtonTitle.font = UIFont.boldSystemFont(ofSize: 24)
    
    switchButton.translatesAutoresizingMaskIntoConstraints = false
    switchButton.onTintColor = .systemGray5
    switchButton.setOn(false, animated: true)
    switchButton.addTarget(self, action: #selector(switched), for: .valueChanged)
    
    NSLayoutConstraint.activate([
      switchButtonTitle.centerYAnchor.constraint(equalTo: switchButton.centerYAnchor),
      switchButtonTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      switchButton.topAnchor.constraint(equalTo: view.topAnchor),
      switchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
    ])
  }
  
  @objc func switched() {
    if (switchButton.isOn == false) {
      switchButtonTitle.text = "Total"
      casesItem.caseData.text = String(country.cases)
      deathsItem.caseData.text = String(country.deaths)
      recoveredItem.caseData.text = String(country.recovered)
    } else {
      switchButtonTitle.text = "Daily"
      casesItem.caseData.text = String(country.todayCases)
      deathsItem.caseData.text = String(country.todayDeaths)
      recoveredItem.caseData.text = String(country.todayRecovered)
    }
  }
}
