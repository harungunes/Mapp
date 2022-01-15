//
//  TrAlertVC.swift
//  Trackio
//
//  Created by Harun Gunes on 19/12/2021.
//

import UIKit

class TrAlertVC: UIViewController {
  
  // MARK: - Properties
  let containerView = UIView()
  
  let titleLabel = TrTitleLabel(align: .center, fontSize: 20)
  let bodyLabel = TrBodyLabel(textAlignment: .center)
  let actionButton = TrButton(backgroundColor: .systemPink, title: "Ok")
  
  var alertTitle: String!
  var message: String!
  var buttonTitle: String!
  
  let padding: CGFloat = 20
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.75)
    
    configureVontainerView()
    configureTitleLabel()
    configureactionButton()
    configureMessageLabel()
  }
  
  init(title: String, message: String, buttonTitle: String) {
    super.init(nibName: nil, bundle: nil)
    self.alertTitle = title
    self.message = message
    self.buttonTitle = buttonTitle
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Helpers
  func configureVontainerView() {
    view.addSubview(containerView)
    containerView.translatesAutoresizingMaskIntoConstraints = false
    containerView.backgroundColor = .systemBackground
    containerView.layer.borderWidth = 2
    containerView.layer.borderColor = UIColor.white.cgColor
    containerView.layer.cornerRadius = 16
    
    NSLayoutConstraint.activate([
      containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      containerView.heightAnchor.constraint(equalToConstant: 220),
      containerView.widthAnchor .constraint(equalToConstant: 280),
    ])
  }
  
  func configureTitleLabel() {
    containerView.addSubview(titleLabel)
    titleLabel.text = alertTitle ?? "Something went wrong"
    
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
      titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
      titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
      titleLabel.heightAnchor.constraint(equalToConstant: 28)
    ])
  }
  
  func configureactionButton() {
    containerView.addSubview(actionButton)
    actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
    actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
    
    NSLayoutConstraint.activate([
      actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
      actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
      actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
      actionButton.heightAnchor.constraint(equalToConstant: 44)
    ])
  }
  
  func configureMessageLabel() {
    containerView.addSubview(bodyLabel)
    bodyLabel.text = message
    bodyLabel.numberOfLines = 4
    
    NSLayoutConstraint.activate([
      bodyLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12),
      bodyLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
      bodyLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
      bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8)
    ])
  }
  
  @objc
  func dismissVC() {
    dismiss(animated: true)
  }
}
