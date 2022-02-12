//
//  StatsItemVC.swift
//  Trackio
//
//  Created by Harun Gunes on 12/02/2022.
//

import UIKit

class StatsItemVC: UIViewController {
  
  let statsItem = TrItemInfoView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
  }
  
  private func configure() {
    view.addSubview(statsItem)
    
    let padding: CGFloat = 10
    
    NSLayoutConstraint.activate([
      statsItem.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
      statsItem.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
      statsItem.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
      statsItem.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding)
    ])
  }
}
