//
//  CALayer+Helpers.swift
//  BubblyExample
//
//  Created by Ahmed Meguid on 6/23/18.
//  Copyright © 2018 Meguid. All rights reserved.
//

import UIKit

extension CALayer {
    
    func allRound(radius: CGFloat) {
        cornerRadius = radius
        masksToBounds = true
    }
    
    func round(corners: UIRectCorner, width: CGFloat, height: CGFloat) {
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: width, height: height)).cgPath
        self.mask = maskLayer
    }
    
    func bordered(corners: UIRectCorner, width: CGFloat, height: CGFloat, borderColor: UIColor) -> CAShapeLayer {
        
        self.round(corners: corners, width: width, height: height)
        
        let borderLayer = CAShapeLayer()
        borderLayer.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: width, height: height)).cgPath
        borderLayer.lineWidth = borderWidth
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = borderColor.cgColor
        addSublayer(borderLayer)
        return borderLayer
    }
    
    func gradient(colors: [CGColor], locations: [NSNumber], startPoint: CGPoint, endPoint: CGPoint) -> CAGradientLayer {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colors
        gradientLayer.locations = locations
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        insertSublayer(gradientLayer, at: 0)
        return gradientLayer
    }
}
