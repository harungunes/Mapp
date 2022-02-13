//
//  TrItemInfoView.swift
//  Trackio
//
//  Created by Harun Gunes on 23/01/2022.
//

import UIKit

enum CaseType {
  case cases, deaths, recovered
}

class TrItemInfoView: UIView {
  
  let caseTypeLabel = TrTitleLabel(align: .center, fontSize: 24)
  let caseData = TrTitleLabel(align: .center, fontSize: 44)
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  func set(country: Country, caseType: CaseType) {
    switch caseType {
    case .cases:
      caseTypeLabel.text = CaseTypeNames.cases
      caseData.text = String(country.cases)
      backgroundColor = Colors.statsBlue
    case .deaths:
      caseTypeLabel.text = CaseTypeNames.deaths
      caseData.text = String(country.deaths)
      backgroundColor = Colors.statsRed
    case .recovered:
      caseTypeLabel.text = CaseTypeNames.recovered
      caseData.text = String(country.recovered)
      backgroundColor = Colors.statsGreen
    }
  }
  
  
  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    
    layer.cornerRadius = 16
    
    addSubview(caseTypeLabel)
    addSubview(caseData)
    
    NSLayoutConstraint.activate([
      caseTypeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      caseTypeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      caseTypeLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
      caseTypeLabel.heightAnchor.constraint(equalToConstant: 40),

      caseData.topAnchor.constraint(equalTo: caseTypeLabel.bottomAnchor, constant: 10),
      caseData.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
      caseData.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
      caseData.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
}
