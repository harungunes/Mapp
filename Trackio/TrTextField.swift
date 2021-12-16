//
//  TrTextField.swift
//  Trackio
//
//  Created by Harun Gunes on 16/12/2021.
//

import UIKit

class TrTextField: UITextField {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    
    layer.borderWidth = 2
    layer.borderColor = UIColor.systemGray4.cgColor
    layer.cornerRadius = 10
    
    font = UIFont.preferredFont(forTextStyle: .title2)
    textAlignment = .center
    
    placeholder = "Search"
    textColor = .label
    
    adjustsFontSizeToFitWidth = true
    minimumFontSize = 12
    
    returnKeyType = .go
    autocorrectionType = .yes
  }
}
