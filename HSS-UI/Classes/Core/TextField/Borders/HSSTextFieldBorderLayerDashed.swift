//
//  HSSTextFieldBorderLayerDashed.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import UIKit

class HSSTextFieldBorderLayerDashed: CAShapeLayer {
    convenience init(color: UIColor, bounds: CGRect, width: CGFloat, radious: CGFloat) {
        self.init()
        let path = UIBezierPath(roundedRect: bounds, cornerRadius: radious)
        self.strokeColor = color.cgColor
        self.lineDashPattern = [2, 2]
        self.frame = bounds
        self.fillColor = nil
        self.cornerRadius = radious
        self.lineWidth = width
        self.path = path.cgPath
    }
}
