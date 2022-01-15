//
//  CountryCell.swift
//  Trackio
//
//  Created by Harun Gunes on 28/12/2021.
//

import UIKit

class CountryCell: UICollectionViewCell {
  static let reuseID = "CountryCell"
  
  let flagImageView = FlagImageView(frame: .zero)
  let countryLabel = TrTitleLabel(align: .center, fontSize: 16)
  
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
      flagImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
      flagImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
      flagImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
      flagImageView.heightAnchor.constraint(equalTo: flagImageView.widthAnchor),
      
      countryLabel.topAnchor.constraint(equalTo: flagImageView.bottomAnchor, constant: 12),
      countryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
      countryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
      countryLabel.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
}
