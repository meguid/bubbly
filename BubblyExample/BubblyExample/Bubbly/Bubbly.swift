//
//  Bubbly.swift
//  BubblyExample
//
//  Created by Ahmed Meguid on 6/23/18.
//  Copyright © 2018 Meguid. All rights reserved.
//

import UIKit

class Bubbly: UIView {
    
    var cornersArray: [Int] = [Int]()
    var gradientColors: [UIColor] = [UIColor]()
    var gradientStartPoint: [CGFloat] = [CGFloat()]
    var gradientEndPoint: [CGFloat] = [CGFloat()]
    
    var cornersWidthValue: CGFloat?
    var borderLayer: CAShapeLayer?
    var gradientLayer: CAGradientLayer?
    
    @IBInspectable var cornersWidth: CGFloat {
        get { return cornersWidthValue ?? 0.0 }
        set { cornersWidthValue = newValue }
    }
    
    @IBInspectable var corners: String {
        get { return cornersArray.map({$0.description}).joined(separator: " ") }
        set( corners) { self.cornersArray = corners.components(separatedBy: " ").map({NumberFormatter().number(from: $0) as? Int ?? 0})}
    }
    
    @IBInspectable var colors: String {
        get { return gradientColors.map({$0.toHexString()}).joined(separator: " ") }
        set( colors) { self.gradientColors = colors.components(separatedBy: " ").map({UIColor(hexString: "#\($0)")}) }
    }
    
    @IBInspectable var startPoint: String {
        get { return gradientStartPoint.map({$0.description}).joined(separator: " ") }
        set( point) { self.gradientStartPoint = point.components(separatedBy: " ").map({NumberFormatter().number(from: $0) as? CGFloat ?? 0.0})}
    }
    
    @IBInspectable var endPoint: String {
        get { return gradientEndPoint.map({$0.description}).joined(separator: " ") }
        set( point) { self.gradientEndPoint = point.components(separatedBy: " ").map({NumberFormatter().number(from: $0) as? CGFloat ?? 0.0})}
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.updateUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.updateUI()
    }
    
    func roundCorner() {
        var rectCorner: UIRectCorner = UIRectCorner()
        for corner in cornersArray {
            rectCorner = rectCorner.union(UIRectCorner.init(rawValue: UInt(corner)))
        }
        if layer.borderWidth > 0.0 {
            borderLayer?.removeFromSuperlayer()
            borderLayer = layer.bordered(corners: rectCorner, width: cornersWidthValue ?? 18.0, height: 0.0, borderColor: borderColor ?? .clear)
        }else{
            layer.round(corners: rectCorner, width: cornersWidthValue ?? 18.0, height: 0.0)
        }
    }
    
    func gradient() {
        gradientLayer?.removeFromSuperlayer()
        gradientLayer = layer.gradient(colors: gradientColors.map({$0.cgColor}),
                                       locations: [0, 1],
                                       startPoint: CGPoint(x: gradientStartPoint[0], y: gradientStartPoint[1]),
                                       endPoint: CGPoint(x: gradientEndPoint[0], y: gradientEndPoint[1]))
    }
    
    func updateUI() {
        
        if cornersArray.count > 0 {
            roundCorner()
        }
        
        if gradientColors.count > 0 {
            gradient()
        }
    }
}
