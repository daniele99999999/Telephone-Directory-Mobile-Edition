//
//  String+Regex.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

extension String
{
    public func match(pattern: String) -> Bool
    {
        return self.range(of: pattern, options: .regularExpression, range: nil, locale: nil) != nil
    }
    
    public func applyTemplate(pattern: String, templateMask: String, controlPattern: String) -> String?
    {
        let templated = self.replacingOccurrences(of: pattern, with: templateMask, options: [.regularExpression], range: nil)
        return templated.matches(pattern: controlPattern) == true ? templated : nil
    }
}
