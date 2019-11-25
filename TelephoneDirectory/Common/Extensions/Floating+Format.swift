//
//  Floating+Format.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation
import CoreGraphics

extension Float
{
    func format(f: Int) -> String
    {
        return String(format: "%.\(f)f", self)
    }
}

extension Double
{
    func format(f: Int) -> String
    {
        return String(format: "%.\(f)f", self)
    }
}

extension CGFloat
{
    func format(f: Int) -> String
    {
        return String(format: "%.\(f)f", self)
    }
}

