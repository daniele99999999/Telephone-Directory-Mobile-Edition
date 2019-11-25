//
//  UIImage+Math.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import UIKit

extension UIImage
{
    var aspectRatio: CGFloat
    {
        return self.size.aspectRatio ?? 0
    }
}
