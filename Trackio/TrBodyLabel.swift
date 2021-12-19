//
//  TrBodyLabel.swift
//  Trackio
//
//  Created by Harun Gunes on 19/12/2021.
//

import UIKit

class TrBodyLabel: UILabel {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  init(textAlignment: NSTextAlignment) {
    super.init(frame: .zero)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    
    font = UIFont.preferredFont(forTextStyle: .body)
    lineBreakMode = .byWordWrapping
    textColor = .secondaryLabel
    minimumScaleFactor = 0.75
  }
}
