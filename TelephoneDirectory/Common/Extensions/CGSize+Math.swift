//
//  CGSize+Math.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import UIKit

extension CGSize
{
    var aspectRatio: CGFloat?
    {
        if self.height != 0
        {
            return self.width/self.height
        }
        else
        {
            return nil
        }
    }
}
