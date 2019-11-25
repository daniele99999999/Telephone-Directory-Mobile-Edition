//
//  UIView+IBInspectable.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import UIKit

extension UIView
{
    @IBInspectable var borderWidth: CGFloat
    {
        get
        {
            return layer.borderWidth
        }
        set
        {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var rotation: CGFloat
    {
        get
        {
            return 0
        }
        set
        {
            self.transform = CGAffineTransform(rotationAngle: newValue / 180 * .pi)
        }
    }
    
    
    @IBInspectable var borderColor: UIColor
    {
        get
        {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set
        {
            layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat
    {
        get
        {
            return layer.cornerRadius
        }
        set
        {
            layer.masksToBounds = (newValue > 0)
            layer.cornerRadius = newValue
        }
    }
    
    @available(iOS 11.0, *)
    @IBInspectable var roundTL: Bool
    {
        get
        {
            return layer.maskedCorners.contains(.layerMinXMinYCorner)
        }
        set
        {
            if newValue { layer.maskedCorners.insert(.layerMinXMinYCorner) }
            else { layer.maskedCorners.remove(.layerMinXMinYCorner) }
        }
    }
    
    @available(iOS 11.0, *)
    @IBInspectable var roundBL: Bool
    {
        get
        {
            return layer.maskedCorners.contains(.layerMinXMaxYCorner)
        }
        set
        {
            if newValue { layer.maskedCorners.insert(.layerMinXMaxYCorner) }
            else { layer.maskedCorners.remove(.layerMinXMaxYCorner) }
        }
    }
    
    @available(iOS 11.0, *)
    @IBInspectable var roundTR: Bool
    {
        get
        {
            return layer.maskedCorners.contains(.layerMaxXMinYCorner)
        }
        set
        {
            if newValue { layer.maskedCorners.insert(.layerMaxXMinYCorner) }
            else { layer.maskedCorners.remove(.layerMaxXMinYCorner) }
        }
    }
    
    @available(iOS 11.0, *)
    @IBInspectable var roundBR: Bool
    {
        get
        {
            return layer.maskedCorners.contains(.layerMaxXMaxYCorner)
        }
        set
        {
            if newValue { layer.maskedCorners.insert(.layerMaxXMaxYCorner) }
            else { layer.maskedCorners.remove(.layerMaxXMaxYCorner) }
        }
    }
    
    @IBInspectable var rotatioAngle : CGFloat
    {
        get
        {
            return 0
        }
        set
        {
            transform = CGAffineTransform(rotationAngle: newValue / 180 * CGFloat(Double.pi) )
        }
    }
}
