//
//  Validator.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

struct Validator
{
    static func validate(input: String, rules: [Rule]) -> [String]
    {
        return rules.compactMap(
        { (rule) -> String? in
            return rule.validate(input)
        })
    }
}
