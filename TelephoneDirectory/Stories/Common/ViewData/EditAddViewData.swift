//
//  EditAddViewData.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

enum EditAddViewData {}

extension EditAddViewData
{
    struct MainViewData: Codable
    {
        let title: String
    }
}

extension EditAddViewData
{
    struct EditingViewData: Codable
    {
        let firstName: String
        let lastName: String
        let phoneNumber: String
    }
}

extension EditAddViewData
{
    struct ErrorsViewData: Codable
    {
        let firstName: [String]
        let lastName: [String]
        let phoneNumber: [String]
        
        var noErrors: Bool
        {
            get
            {
                return self.firstName.isEmpty && self.lastName.isEmpty && self.phoneNumber.isEmpty
            }
        }
    }
}

extension EditAddViewData.EditingViewData: Equatable
{
    static func == (lhs: Self, rhs: Self) -> Bool
    {
        return (lhs.firstName == rhs.firstName) &&
               (lhs.lastName == rhs.lastName) &&
               (lhs.phoneNumber == rhs.phoneNumber)
    }
}
