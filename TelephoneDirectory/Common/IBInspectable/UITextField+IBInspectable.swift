//
//  UITextField+IBInspectable.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation
import UIKit

extension UITextField
{
    @IBInspectable var placeHolderColor: UIColor
    {
        get
        {
            return self.placeHolderColor
        }
        
        set
        {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue])
        }
    }
}
