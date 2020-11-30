//
//  UIColor.swift
//  CoinFlow-H
//
//  Created by 황성우 on 2020/11/14.
//

import UIKit


extension UIColor {
    static func randomColor() -> UIColor {
        let colors: [UIColor] = [.systemRed, .systemBlue, .systemPink, .systemTeal, .systemYellow, .systemOrange]
        
        let randomColor = colors.randomElement()!
        return randomColor
    }
}
