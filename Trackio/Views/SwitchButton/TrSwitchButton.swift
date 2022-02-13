//
//  TrSwitchButton.swift
//  Trackio
//
//  Created by Harun Gunes on 13/02/2022.
//

import UIKit

class TrSwitchButton: UISwitch {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    onTintColor = .systemGray5
    setOn(false, animated: true)
  }
}
