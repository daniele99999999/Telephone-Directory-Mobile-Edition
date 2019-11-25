//
//  UIBarButtonItem+Helper.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import UIKit

extension UIBarButtonItem
{
    var isCustom: Bool
    {
        return self.customView != nil
    }
}
