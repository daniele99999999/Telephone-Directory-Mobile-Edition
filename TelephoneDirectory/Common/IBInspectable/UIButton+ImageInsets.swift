//
//  UIButton+ImageInsets.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import UIKit

extension UIButton
{
    @IBInspectable public var imageInsetTop: CGFloat
        {
        get {
            return self.imageEdgeInsets.top
        }
        set {
            self.imageEdgeInsets = UIEdgeInsets(top: newValue, left: self.imageEdgeInsets.left, bottom: self.imageEdgeInsets.bottom, right: self.imageEdgeInsets.right)
        }
    }
    
    @IBInspectable public var imageInsetLeft: CGFloat
        {
        get {
            return self.imageEdgeInsets.left
        }
        set {
            self.imageEdgeInsets = UIEdgeInsets(top: self.imageEdgeInsets.top, left: newValue, bottom: self.imageEdgeInsets.bottom, right: self.imageEdgeInsets.right)
        }
    }
    
    @IBInspectable public var imageInsetBottom: CGFloat
        {
        get {
            return self.imageEdgeInsets.bottom
        }
        set {
            self.imageEdgeInsets = UIEdgeInsets(top: self.imageEdgeInsets.top, left: self.imageEdgeInsets.left, bottom: newValue, right: self.imageEdgeInsets.right)
        }
    }
    
    @IBInspectable public var imageInsetRight: CGFloat
        {
        get {
            return self.imageEdgeInsets.right
        }
        set {
            self.imageEdgeInsets = UIEdgeInsets(top: self.imageEdgeInsets.top, left: self.imageEdgeInsets.left, bottom: self.imageEdgeInsets.bottom, right: newValue)
        }
    }
}
