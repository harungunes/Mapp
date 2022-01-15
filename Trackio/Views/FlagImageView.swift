//
//  FlagImageView.swift
//  Trackio
//
//  Created by Harun Gunes on 28/12/2021.
//

import UIKit

class FlagImageView: UIImageView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    layer.cornerRadius = 10
    clipsToBounds = true
    image = UIImage(named: "placeholder")
  }
}
