//
//  UIViewController+Ext.swift
//  Trackio
//
//  Created by Harun Gunes on 19/12/2021.
//

import UIKit

extension UIViewController {
  
  func presentTrAlertVC(title: String, body: String, buttonTitle: String) {
    DispatchQueue.main.async {
      let alertVC = TrAlertVC(title: title, message: body, buttonTitle: buttonTitle)
      alertVC.modalPresentationStyle = .overFullScreen
      alertVC.modalTransitionStyle = .crossDissolve
      self.present(alertVC, animated: true)
    }
  }
}
