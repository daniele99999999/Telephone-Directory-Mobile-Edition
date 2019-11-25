//
//  ImportViewData.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 23/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

enum ImportViewData {}

extension ImportViewData
{
    struct MainViewData: Codable
    {
        let title: String
    }
}

extension ImportViewData
{
    struct CellViewData: Codable
    {
        let firstName: String
        let lastName: String
        let phoneNumber: String
    }
}

extension ImportViewData.CellViewData: Equatable
{
    static func == (lhs: Self, rhs: Self) -> Bool
    {
        return (lhs.firstName == rhs.firstName) &&
               (lhs.lastName == rhs.lastName) &&
               (lhs.phoneNumber == rhs.phoneNumber)
    }
}
