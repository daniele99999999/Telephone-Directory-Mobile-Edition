//
//  ListViewData+Mock.swift
//  TelephoneDirectoryTests
//
//  Created by Daniele Salvioni on 24/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

extension ListViewData.MainViewData
{
    static func build(search: String) -> ListViewData.MainViewData
    {
        return ListViewData.MainViewData(title: "title", searchPlaceholder: "search", searchValue: search)
    }
}

extension ListViewData.CellViewData
{
    static func buildArray(contacts: [ContactModel]) -> [ListViewData.CellViewData]
    {
        return contacts.map
        { (contact: ContactModel) -> ListViewData.CellViewData in
            return ListViewData.CellViewData.build(contact: contact)
        }
    }
    
    static func build(contact: ContactModel) -> ListViewData.CellViewData
    {
        return ListViewData.CellViewData(firstName: contact.firstName, lastName: contact.lastName, phoneNumber: contact.phoneNumber)
    }
}
