//
//  TrButton.swift
//  Trackio
//
//  Created by Harun Gunes on 17/12/2021.
//

import UIKit

class TrButton: UIButton {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  init(backgroundColor: UIColor, title: String) {
    super.init(frame: .zero)
    self.backgroundColor = backgroundColor
    self.setTitle(title, for: .normal)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    
    layer.cornerRadius = 10
    
    titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    setTitleColor(.white, for: .normal)
  }
}
