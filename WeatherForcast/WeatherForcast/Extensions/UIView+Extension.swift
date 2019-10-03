//
//  UIView+Extension.swift
//  Common
//
//  Created by Tuấn Bờm on 5/4/18.
//  Copyright © 2018 Tuấn Bờm. All rights reserved.
//

import UIKit

extension UIView {
    
    class func fromNib<T: UIView>() -> T {
        guard let view = Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)?.first as? T else {
            return T()
        }
        return view
    }
    
    func getParentViewController(_ current: UIView) -> UIViewController? {
        var parentController: UIViewController?
        var responder: UIResponder? = current
        while true {
            responder = responder?.next
            if responder == nil {
                break
            }
            parentController = responder as? UIViewController
            if parentController != nil {
                break
            }
        }
        return parentController
    }
    
    func screenshot() -> UIImage? {
        let croppingRect = self.bounds
        UIGraphicsBeginImageContextWithOptions(croppingRect.size, false, UIScreen.main.scale)
        // Create a graphics context and translate it the view we want to crop so that even in grabbing (0,0), that origin point now represents the actual cropping origin desired:
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        context.translateBy(x: -croppingRect.origin.x, y: -croppingRect.origin.y)
        layoutIfNeeded()
        layer.render(in: context)
        let screenshotImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return screenshotImage ?? UIImage()
    }
    
//    func rounded(position: RoundedPosition, radius: CGFloat) {
//        self.clipsToBounds = true
//        self.layer.cornerRadius = radius
//        if #available(iOS 11.0, *) {
//            self.layer.maskedCorners = position == .top ? [.layerMaxXMinYCorner, .layerMinXMinYCorner] : [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
//        } else {
//            let rectShape = CAShapeLayer()
//            rectShape.bounds = self.frame
//            rectShape.position = self.center
//            rectShape.path = UIBezierPath(roundedRect: self.bounds,
//                                          byRoundingCorners: (position == .top ? [.topLeft, .topRight] : [.bottomLeft, .bottomRight]),
//                                          cornerRadii: CGSize(width: radius, height: radius)).cgPath
//            self.layer.mask = rectShape
//        }
//    }
    
    // MARK: - Customize UIView
//    @IBInspectable
//    var halfCorner: Bool {
//        get {
//            return true
//        }
//
//        set {
//            if newValue {
//                Thread.mainAfter { [weak self] in
//                    guard let wSelf = self else {
//                        return
//                    }
//                    wSelf.layer.cornerRadius = wSelf.bounds.height / 2
//                }
//            }
//        }
//    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
	
//    @discardableResult
//    func gradient(type: GradientType = .leftToRight,
//                     startColor: UIColor = .mainBlueColor(),
//                     endColor: UIColor = .colorFromHex("67F6E5")) -> CAGradientLayer {
//        var startPoint = CGPoint.zero
//        var endPoint = CGPoint.zero
//        switch type {
//        case .leftToRight:
//            startPoint = CGPoint(x: 0, y: 0)
//            endPoint = CGPoint(x: 1, y: 0)
//        case .topToBottom:
//            startPoint = CGPoint(x: 0, y: 0)
//            endPoint = CGPoint(x: 0, y: 1)
//        case .aLittleTopToBottom:
//            startPoint = CGPoint(x: 0, y: 0)
//            endPoint = CGPoint(x: 0, y: 0.5)
//        }
//        let colorTop = startColor.cgColor
//        let colorBottom = endColor.cgColor
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [colorTop, colorBottom]
//        gradientLayer.startPoint = startPoint
//        gradientLayer.endPoint = endPoint
//        gradientLayer.cornerRadius = self.layer.cornerRadius
//        gradientLayer.frame = self.bounds
//        self.layer.insertSublayer(gradientLayer, at: 0)
//        return gradientLayer
//    }
    
    func setPathBachground(color: UIColor, progress: CGFloat) {
        let frame = self.frame
        self.layer.frame = CGRect(x: frame.origin.x,
                                  y: frame.origin.y,
                                  width: frame.width * progress,
                                  height: frame.height)
        self.layer.backgroundColor = color.cgColor
    }
    
    
    func setViewrounded() {
        self.layer.cornerRadius = ( self.frame.width / 2)
        self.layer.masksToBounds = true
    }
    
}

