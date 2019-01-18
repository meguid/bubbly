//
//  BubblyLabel.swift
//  BubblyExample
//
//  Created by Ahmed Abdel Meguid on 6/23/18.
//  Copyright © 2018 Meguid. All rights reserved.
//

import UIKit

class BubblyLabel: UILabel {
    
    var gradientColors: [UIColor] = [UIColor]()
    var gradientStartPoint: [CGFloat] = [CGFloat()]
    var gradientEndPoint: [CGFloat] = [CGFloat()]
    
    var gradientLayer: CAGradientLayer?
    
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

    func gradientText() {
        
        let backgroundGradient = UIView(frame: self.frame)
        gradientLayer = backgroundGradient.layer.gradient(colors: gradientColors.map({$0.cgColor}),
                                                          locations: [0, 1],
                                                          startPoint: CGPoint(x: gradientStartPoint[0], y: gradientStartPoint[1]),
                                                          endPoint: CGPoint(x: gradientEndPoint[0], y: gradientEndPoint[1]))
        self.superview?.insertSubview(backgroundGradient, at: 0)
        backgroundGradient.mask = self
    }
    
    func updateUI() {
        
        if gradientColors.count > 0 {
            gradientText()
        }
    }
}

