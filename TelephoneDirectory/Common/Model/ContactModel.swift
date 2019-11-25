//
//  ContactModel.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

struct ContactModel: Codable
{
    var id: Int64?
    let firstName: String
    let lastName: String
    let phoneNumber: String
}

extension ContactModel: Equatable
{
    static func == (lhs: Self, rhs: Self) -> Bool
    {
        return (lhs.firstName == rhs.firstName) &&
               (lhs.lastName == rhs.lastName) &&
               (lhs.phoneNumber == rhs.phoneNumber)
    }
}

extension ContactModel: PersistenceIdentifier
{
    func toIdentifier() -> Int64?
    {
        return self.id
    }
}
