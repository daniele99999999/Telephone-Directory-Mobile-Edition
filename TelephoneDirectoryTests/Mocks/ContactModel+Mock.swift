//
//  ContactModel+Mock.swift
//  TelephoneDirectoryTests
//
//  Created by Daniele Salvioni on 24/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

extension ContactModel
{
    static func buildValidArray() -> [ContactModel]
    {
        return [ContactModel.buildValid(),
                ContactModel.buildValid(),
                ContactModel.buildValid(),
                ContactModel.buildValid(),
                ContactModel.buildValid()]
    }
    
    static func buildInvalidArray() -> [ContactModel]
    {
        return [ContactModel.buildInvalidFirstName(),
                ContactModel.buildInvalidLastName(),
                ContactModel.buildInvalidPhoneNumber1(),
                ContactModel.buildInvalidPhoneNumber2(),
                ContactModel.buildInvalidPhoneNumber3()]
    }
    
    static func buildMixedValidArray() -> [ContactModel]
    {
        return [ContactModel.buildValid(),
                ContactModel.buildValid(),
                ContactModel.buildInvalidFirstName(),
                ContactModel.buildInvalidLastName(),
                ContactModel.buildInvalidPhoneNumber1()]
    }
    
    static func buildValidSearchArray() -> [ContactModel]
    {
        return [ContactModel(id: nil, firstName: "aaaaa", lastName: "aaaaa", phoneNumber: "+00 000 000000"),
                ContactModel(id: nil, firstName: "bbbbb", lastName: "bbbbb", phoneNumber: "+11 111 111111"),
                ContactModel(id: nil, firstName: "ccccc", lastName: "ccccc", phoneNumber: "+22 222 222222"),
                ContactModel(id: nil, firstName: "ddddd", lastName: "ddddd", phoneNumber: "+33 333 333333"),
                ContactModel(id: nil, firstName: "eeeee", lastName: "eeeee", phoneNumber: "+44 444 444444")]
    }
    
    static func buildValid() -> ContactModel
    {
        return ContactModel(id: nil, firstName: "daniele", lastName: "rossi", phoneNumber: "+39 392 1234567890")
    }
    
    static func buildInvalidFirstName() -> ContactModel
    {
        return ContactModel(id: nil, firstName: "", lastName: "rossi", phoneNumber: "+39 392 1234567890")
    }
    
    static func buildInvalidLastName() -> ContactModel
    {
        return ContactModel(id: nil, firstName: "daniele", lastName: "", phoneNumber: "+39 392 1234567890")
    }
    
    static func buildInvalidPhoneNumber1() -> ContactModel
    {
        return ContactModel(id: nil, firstName: "daniele", lastName: "rossi", phoneNumber: "39 392 1234567890")
    }
    
    static func buildInvalidPhoneNumber2() -> ContactModel
    {
        return ContactModel(id: nil, firstName: "daniele", lastName: "rossi", phoneNumber: "+39 1234567890")
    }
    
    static func buildInvalidPhoneNumber3() -> ContactModel
    {
        return ContactModel(id: nil, firstName: "daniele", lastName: "rossi", phoneNumber: "+39 392890")
    }
}
