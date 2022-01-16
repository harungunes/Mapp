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
    flagImageView.downloadImage(from: country.countryInfo.flag)
  }
  
  private func configure() {
    addSubview(flagImageView)
    addSubview(countryLabel)
    layer.cornerRadius = 10
    backgroundColor = .systemGray5
    
    let padding: CGFloat = 12
    
    NSLayoutConstraint.activate([
      flagImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      flagImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
      flagImageView.widthAnchor.constraint(equalToConstant: 70),
      flagImageView.heightAnchor.constraint(equalTo: flagImageView.widthAnchor),
      
      countryLabel.centerYAnchor.constraint(equalTo: flagImageView.centerYAnchor),
      countryLabel.leadingAnchor.constraint(equalTo: flagImageView.trailingAnchor, constant: padding),
      countryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
      countryLabel.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
}
