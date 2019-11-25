//
//  UITextField+NextResponder.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import UIKit

extension UITextField
{
    func nextAvailableResponder<T: UITextField>(elements: [UITextField]) -> T?
    {
        guard let currentIndex = elements.firstIndex(where: { $0 == self }) else { return nil }
        guard let element = elements[safe: currentIndex+1] else { return nil }
        if let elementValid = element as? T
        {
            if !elementValid.isEnabled
            {
                return element.nextAvailableResponder(elements: elements)
            }
            else
            {
                return elementValid
            }
        }
        else
        {
            return element.nextAvailableResponder(elements: elements)
        }
    }
    
    func manageLastFormReturn(elements: [UITextField], returnPressed: (() -> Void)?) -> Bool
    {
        if let nextResponder = self.nextAvailableResponder(elements: elements)
        {
            nextResponder.becomeFirstResponder()
        }
        else
        {
            self.resignFirstResponder()
            
            returnPressed?()
        }
        
        return true
    }
}
