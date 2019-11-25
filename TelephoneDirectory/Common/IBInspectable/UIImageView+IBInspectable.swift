//
//  UIImageView+IBInspectable.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import UIKit

extension UIImageView
{
    @IBInspectable var imageRenderingModeTemplate: Bool
    {
        get
        {
            guard let _image = self.image else { return false }
            return _image.renderingMode == .alwaysTemplate
        }
        set
        {
            if newValue
            {
                self.image = self.image?.withRenderingMode(.alwaysTemplate) ?? nil
            }
        }
    }
}
