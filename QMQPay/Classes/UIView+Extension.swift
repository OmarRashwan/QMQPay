//
//  UIView+Extension.swift
//  NooqodyPay
//
//  Created by HE on 19/07/2021.
//

import UIKit

@IBDesignable extension UIView {

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var shadowColor: UIColor? {
        get {
            guard let color = layer.shadowColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            guard let uiColor = newValue else { return }
            layer.shadowColor = uiColor.cgColor
        }
    }

    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }

    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }

    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }

    func errorShake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 8, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 8, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }

    func pinItemToEdges(item: UIView, constants: [CGFloat] = [0, 0, 0 ,0]) {
        item.translatesAutoresizingMaskIntoConstraints = false
        let attributes: [NSLayoutConstraint.Attribute] = [.top, .trailing, .bottom, .leading]
        activateLayoutAttributes(attributes, for: item, constants: constants)
    }

    func activateLayoutAttributes(_ attributes: [NSLayoutConstraint.Attribute], for item: UIView, constants: [CGFloat] = [0, 0, 0, 0]) {
        var i = -1
        NSLayoutConstraint.activate(attributes.map {
            i += 1
            return NSLayoutConstraint(item: item, attribute: $0, relatedBy: .equal, toItem: self, attribute: $0, multiplier: 1, constant: constants[i])
        })
    }
}
