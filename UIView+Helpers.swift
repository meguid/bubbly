//
//  UIView+Helpers.swift
//  BubblyExample
//
//  Created by Ahmed Abdel Meguid on 6/23/18.
//  Copyright © 2018 Meguid. All rights reserved.
//

import UIKit

extension UIView {
    
    @IBInspectable var borderColor: UIColor? {
        get { return layer.borderColor.map(UIColor.init) }
        set { layer.borderColor = newValue?.cgColor }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius}
        set { layer.cornerRadius =  newValue
            layer.masksToBounds = newValue > 0 }
    }
}
