//
//  ListViewData.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

enum ListViewData {}

extension ListViewData
{
    struct MainViewData: Codable
    {
        let title: String
        let searchPlaceholder: String
        let searchValue: String
    }
}

extension ListViewData
{
    struct CellViewData: Codable
    {
        let firstName: String
        let lastName: String
        let phoneNumber: String
    }
}

extension ListViewData.CellViewData: Equatable
{
    static func == (lhs: Self, rhs: Self) -> Bool
    {
        return (lhs.firstName == rhs.firstName) &&
               (lhs.lastName == rhs.lastName) &&
               (lhs.phoneNumber == rhs.phoneNumber)
    }
}


