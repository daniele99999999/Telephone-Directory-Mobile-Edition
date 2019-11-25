//
//  NSError+Helper.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation


extension NSError
{
    public class func create(title: String = NSLocalizedString("Error", comment: "Error"), message: String, code: Int = 0) -> NSError
    {
        return NSError(domain:title, code:code, userInfo:[NSLocalizedDescriptionKey: message])
    }
}
