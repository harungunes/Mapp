//
//  UIColor+Ext.swift
//  Trackio
//
//  Created by Harun Gunes on 13/02/2022.
//

import UIKit

extension UIColor {
  
  convenience init(r: Float, g: Float, b: Float, a: Float) {
    self.init(_colorLiteralRed: r/255, green: g/255, blue: b/255, alpha: a)
  }
}
