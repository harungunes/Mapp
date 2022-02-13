//
//  StatsItemVC.swift
//  Trackio
//
//  Created by Harun Gunes on 12/02/2022.
//

import UIKit

class StatsItemVC: UIViewController {
  
  var country: Country!
  
  let casesItem = TrItemInfoView(frame: .zero)
  let deathsItem = TrItemInfoView(frame: .zero)
  let recoveredItem = TrItemInfoView(frame: .zero)
  
  
  init(country: Country) {
    super.init(nibName: nil, bundle: nil)
    self.country = country
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
  }
  
  
  private func configure() {
    view.addSubview(casesItem)
    view.addSubview(deathsItem)
    view.addSubview(recoveredItem)
    
    casesItem.set(country: country, caseType: .cases)
    deathsItem.set(country: country, caseType: .deaths)
    recoveredItem.set(country: country, caseType: .recovered)
    
    let padding: CGFloat = 10
    let height: CGFloat = 125
    let width: CGFloat = 300
    
    NSLayoutConstraint.activate([
      casesItem.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
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
  
}
