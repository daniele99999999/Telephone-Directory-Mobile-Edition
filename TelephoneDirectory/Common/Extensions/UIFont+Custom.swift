//
//  UIFont+Custom.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation
import UIKit

extension UIFont
{
    class func isFamilyNameAvailable(_ familyName: String) -> Bool
    {
        let familyNames = UIFont.familyNames.filter
        { (familyNameElement) -> Bool in
            return familyNameElement == familyName
        }
        
        return !familyNames.isEmpty
    }
    
    class func isNameAvailable(_ fontName: String) -> Bool
    {
        let familyNames = UIFont.familyNames.filter
        { (familyNameElement) -> Bool in
            
            return !UIFont.fontNames(forFamilyName: familyNameElement).filter
            { (fontNameElement) -> Bool in
                return fontNameElement == fontName
            }.isEmpty
        }
        
        return !familyNames.isEmpty
    }
    
    class func loadCustomFont(name: String, size: CGFloat, forced: Bool = false) -> UIFont
    {
        if (forced || self.isNameAvailable(name))
        {
            return UIFont(name: name, size: size)!
        }
        else
        {
            fatalError("Error: custom font \(name) not available")
        }
    }
}
