//
//  HSSTextFieldBorderLayerDefault.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import UIKit

class HSSTextFieldBorderLayerDefault: CAShapeLayer {
    convenience init(color: UIColor, bounds: CGRect, width: CGFloat, radious: CGFloat) {
        self.init()
        let path = UIBezierPath(roundedRect: bounds, cornerRadius: radious)
        self.strokeColor = color.cgColor
        self.frame = bounds
        self.fillColor = UIColor.clear.cgColor
        self.cornerRadius = radious
        self.lineWidth = width
        self.path = path.cgPath
    }
}
