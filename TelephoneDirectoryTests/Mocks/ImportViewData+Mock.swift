//
//  ImportViewData+Mock.swift
//  TelephoneDirectoryTests
//
//  Created by Daniele Salvioni on 24/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

extension ImportViewData.MainViewData
{
    static func build(search: String) -> ImportViewData.MainViewData
    {
        return ImportViewData.MainViewData(title: "title")
    }
}

extension ImportViewData.CellViewData
{
    static func buildArray(contacts: [ContactModel]) -> [ImportViewData.CellViewData]
    {
        return contacts.map
        { (contact: ContactModel) -> ImportViewData.CellViewData in
            return ImportViewData.CellViewData.build(contact: contact)
        }
    }
    
    static func build(contact: ContactModel) -> ImportViewData.CellViewData
    {
        return ImportViewData.CellViewData(firstName: contact.firstName, lastName: contact.lastName, phoneNumber: contact.phoneNumber)
    }
}
