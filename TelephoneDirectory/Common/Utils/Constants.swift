//
//  Constants.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation
import UIKit
import SwifterSwift

enum Constants
{
    enum Colors
    {
        static let color000000: UIColor = UIColor.init(hex: 0x000000)!
        static let colorFFFFFF: UIColor = UIColor.init(hex: 0xFFFFFF)!
        static let color333333: UIColor = UIColor.init(hex: 0x333333)!
        static let color666666: UIColor = UIColor.init(hex: 0x666666)!
        static let color999999: UIColor = UIColor.init(hex: 0x999999)!
        static let colorDDDDDD: UIColor = UIColor.init(hex: 0xDDDDDD)!
    }
    
    enum Fonts
    {
        static func systemRegular(size: CGFloat) -> UIFont { return UIFont.systemFont(ofSize: size) }
        static func systemBold(size: CGFloat) -> UIFont { return UIFont.boldSystemFont(ofSize: size) }
        static func systemItalic(size: CGFloat) -> UIFont { return UIFont.italicSystemFont(ofSize: size) }
    }
    
    enum Resources
    {
        enum Storyboards
        {
            static let main = "Main"
        }
        
        enum Database
        {
            static let sqlLiteFileName = "ContacsDB.sqlite"
        }
    }
}
