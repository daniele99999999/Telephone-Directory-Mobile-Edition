//
//  ValidatorTests.swift
//  TelephoneDirectoryTests
//
//  Created by Daniele Salvioni on 24/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import XCTest
@testable import TelephoneDirectory

class ValidatorTests: XCTestCase
{
   func testValid()
   {
       let validator = ValidatorEditAddViewData()
       let viewData = EditAddViewData.EditingViewData.build(contact: ContactModel.buildValid())
       let errors = validator.validate(viewData: viewData)
       
       XCTAssertTrue(errors.noErrors)
   }
   
   func testInvalidFirstName()
   {
       let validator = ValidatorEditAddViewData()
       let viewData = EditAddViewData.EditingViewData.build(contact: ContactModel.buildInvalidFirstName())
       let errors = validator.validate(viewData: viewData)
       
       XCTAssertFalse(errors.firstName.isEmpty)
   }
   
   func testInvalidLastName()
   {
       let validator = ValidatorEditAddViewData()
       let viewData = EditAddViewData.EditingViewData.build(contact: ContactModel.buildInvalidLastName())
       let errors = validator.validate(viewData: viewData)
       
       XCTAssertFalse(errors.lastName.isEmpty)
   }
   
   func testInvalidPhoneNumber1()
   {
       let validator = ValidatorEditAddViewData()
       let viewData = EditAddViewData.EditingViewData.build(contact: ContactModel.buildInvalidPhoneNumber1())
       let errors = validator.validate(viewData: viewData)
       
       XCTAssertFalse(errors.phoneNumber.isEmpty)
   }
   
   func testInvalidPhoneNumber2()
   {
       let validator = ValidatorEditAddViewData()
       let viewData = EditAddViewData.EditingViewData.build(contact: ContactModel.buildInvalidPhoneNumber2())
       let errors = validator.validate(viewData: viewData)
       
       XCTAssertFalse(errors.phoneNumber.isEmpty)
   }
   
   func testInvalidPhoneNumber3()
   {
       let validator = ValidatorEditAddViewData()
       let viewData = EditAddViewData.EditingViewData.build(contact: ContactModel.buildInvalidPhoneNumber3())
       let errors = validator.validate(viewData: viewData)
       
       XCTAssertFalse(errors.phoneNumber.isEmpty)
   }
}
