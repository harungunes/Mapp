//
//  CountryCell.swift
//  Trackio
//
//  Created by Harun Gunes on 28/12/2021.
//

import UIKit

class CountryCell: UICollectionViewCell {
  static let reuseID = "FollowerCell"
  
  let flagImageView = FlagImageView(frame: .zero)
  let countryLabel = TrTitleLabel(textAlignment: .center, fontSize: 20)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func set(country: Country) {
    countryLabel.text = country.country
  }
  
  private func configure() {
    addSubview(flagImageView)
    addSubview(countryLabel)
    
    let padding: CGFloat = 8
    
    NSLayoutConstraint.activate([
      flagImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      flagImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
      flagImageView.heightAnchor.constraint(equalToConstant: 25),
      flagImageView.widthAnchor.constraint(equalToConstant: 25),
      
      countryLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      countryLabel.leadingAnchor.constraint(equalTo: flagImageView.trailingAnchor, constant: padding),
      countryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
    ])
  }
}
