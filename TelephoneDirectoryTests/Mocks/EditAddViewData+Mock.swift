//
//  EditAddViewData+Mock.swift
//  TelephoneDirectoryTests
//
//  Created by Daniele Salvioni on 24/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

extension EditAddViewData.MainViewData
{
    static func build() -> EditAddViewData.MainViewData
    {
        return EditAddViewData.MainViewData(title: "title")
    }
}
 
extension EditAddViewData.EditingViewData
{
    static func build(contact: ContactModel) -> EditAddViewData.EditingViewData
    {
        return EditAddViewData.EditingViewData(firstName: contact.firstName, lastName: contact.lastName, phoneNumber: contact.phoneNumber)
    }
}

extension EditAddViewData.ErrorsViewData
{
    static func buildValid() -> EditAddViewData.ErrorsViewData
    {
        return EditAddViewData.ErrorsViewData(firstName: [], lastName: [], phoneNumber: [])
    }
    
    static func buildInvalidFirstName() -> EditAddViewData.ErrorsViewData
    {
        return EditAddViewData.ErrorsViewData(firstName: ["error"], lastName: [], phoneNumber: [])
    }
    
    static func buildInvalidLastName() -> EditAddViewData.ErrorsViewData
    {
        return EditAddViewData.ErrorsViewData(firstName: [], lastName: ["error"], phoneNumber: [])
    }
    
    static func buildInvalidPhoneNumber() -> EditAddViewData.ErrorsViewData
    {
        return EditAddViewData.ErrorsViewData(firstName: [], lastName: [], phoneNumber: ["error"])
    }
}
