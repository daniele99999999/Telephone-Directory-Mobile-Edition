//
//  Collection+addIfNotNil.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import UIKit
import SwifterSwift

extension Dictionary
{
    mutating func mapValueIfNotNil(key: Key, value: Value?)
    {
        guard let _value = value else { return }
        self[key] = _value
    }
    
    mutating func mapValueIfNotNil(contentsOf newElements: Dictionary<Key, Value>?)
    {
        guard let _newElements = newElements else { return }
        self += _newElements
    }
}

extension Array
{
    mutating func appendIfNotNil(_ element: Element?)
    {
        guard let _element = element else { return }
        self.append(_element)
    }
    
    mutating func appendIfNotNil<S>(contentsOf newElements: S?) where Element == S.Element, S : Sequence
    {
        guard let _newElements = newElements else { return }
        
        self.append(contentsOf: _newElements)
    }
}
