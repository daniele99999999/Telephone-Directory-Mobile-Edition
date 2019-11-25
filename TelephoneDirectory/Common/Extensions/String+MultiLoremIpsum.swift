//
//  String+MultiLoremIpsum.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation
import SwifterSwift

extension String
{
    public static func multiLoremIpsum(ofLength length: Int) -> String
    {
        guard length > 0 else { return "" }
        
        let loremIpsumMaxLenght = String.loremIpsum().count
        let loremIpsumCount = length.cgFloat/loremIpsumMaxLenght.cgFloat
        let loremIpsumIntCount = loremIpsumCount.floor.int
        let loremIpsumIntRest = length - loremIpsumIntCount
        var multiLoremIpsum = Array(repeating: String.loremIpsum(), count: loremIpsumIntCount)
        multiLoremIpsum.append(String.loremIpsum(ofLength: loremIpsumIntRest))
        return multiLoremIpsum.joined(separator: "\n")
    }
}
