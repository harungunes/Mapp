//
//  TrTitleLabel.swift
//  Trackio
//
//  Created by Harun Gunes on 19/12/2021.
//

import UIKit

class TrTitleLabel: UILabel {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  init(align: NSTextAlignment, fontSize: CGFloat) {
    super.init(frame: .zero)
    self.textAlignment = align
    self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    
    lineBreakMode = .byTruncatingTail
    textColor = .label
    minimumScaleFactor = 0.75
  }
}
