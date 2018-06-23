//
//  UIColor+Helpers.swift
//  BubblyExample
//
//  Created by Ahmed Abdel Meguid on 6/23/18.
//  Copyright © 2018 Meguid. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var tabColor = UIColor(red: 0.26, green: 0.91, blue: 0.81, alpha: 1)
    static var tabAltColor = UIColor(red: 0.79, green: 0.71, blue: 0.92, alpha: 1)
    static var navigationColor = UIColor(red: 0.75, green: 0.61, blue: 1, alpha: 1)
    static var chatColor = UIColor(red: 0.06, green: 0.28, blue: 0.27, alpha: 1)
    static var liveColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
    
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.characters.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    func toHexString() -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb: Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return NSString(format: "#%06x", rgb) as String
    }
}

