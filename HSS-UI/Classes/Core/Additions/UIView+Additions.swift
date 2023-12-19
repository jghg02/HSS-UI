//
//  UIView+Additions.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

internal extension UIView {
    func pinToSuperview() {
        guard let superview = self.superview else {
            return
        }

        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
    }

    func pinToSuperview(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        guard let superview = self.superview else {
            return
        }

        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: left).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -right).isActive = true
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: top).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: bottom).isActive = true
    }

    func setCornerRadius(cornerRadius: CGFloat, roundedCorners: CACornerMask) {

        if #available(iOS 11.0, *) {
            self.layer.cornerRadius = cornerRadius
            self.layer.maskedCorners = roundedCorners
        } else {
            // Fallback on earlier versions
            var cornerMask = UIRectCorner()
            if roundedCorners.contains(.layerMinXMinYCorner) {
                cornerMask.insert(.topLeft)
            }
            if roundedCorners.contains(.layerMaxXMinYCorner) {
                cornerMask.insert(.topRight)
            }
            if roundedCorners.contains(.layerMinXMaxYCorner) {
                cornerMask.insert(.bottomLeft)
            }
            if roundedCorners.contains(.layerMaxXMaxYCorner) {
                cornerMask.insert(.bottomRight)
            }

            let rectShape = CAShapeLayer()
            rectShape.bounds = self.frame
            rectShape.position = self.center
            rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: cornerMask, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)).cgPath
            self.layer.mask = rectShape
        }
    }

    func setRectangleShape(tint: UIColor?, cornerRadius: CGFloat?, roundedCorners: CACornerMask?) {
        if let cornerRadius = cornerRadius, let roundedCorners = roundedCorners {
            self.backgroundColor = tint
            self.setCornerRadius(cornerRadius: cornerRadius, roundedCorners: roundedCorners)
        }
    }
}

