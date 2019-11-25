//
//  Rule.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 22/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

struct Rule
{
    let validate: (String) -> String?

    static let mandatory = Rule
    { (input: String) -> String? in
        return !input.isEmpty ? nil : NSLocalizedString("validator.rule.mandatory.error", comment: "")
    }
    
    static let mail = Rule
    { (input: String) -> String? in
        let regex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return input.match(pattern: regex) ? nil : NSLocalizedString("validator.rule.mail.error", comment: "")
    }
    
    static let phoneNumber = Rule
    { (input: String) -> String? in
        let regex = #"^([+])([0-9]{1,}) ([0-9]{1,}) ([0-9]{6,})$"#
        return input.match(pattern: regex) ? nil : NSLocalizedString("validator.rule.phoneNumber.error", comment: "")
    }
}
