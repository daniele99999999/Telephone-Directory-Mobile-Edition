//
//  EditPresenterTests.swift
//  TelephoneDirectoryTests
//
//  Created by Daniele Salvioni on 24/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import XCTest
@testable import TelephoneDirectory

class EditPresenterTests: XCTestCase
{
    func testContact()
    {
        let contact = ContactModel.buildValid()
        let persistence = ContactModelPersistenceMock(contacts: [])
        let view = EditContactViewControllerMock()
        
        let presenter = EditPresenter(contact: contact,
                                      contactPersistance: persistence,
                                      viewDelegate: view,
                                      flowDelegate: nil)
        
        presenter.setup()
        
        XCTAssertFalse(view.title.isEmpty)
        XCTAssertNotNil(view.errors)
        XCTAssertEqual(view.errors?.noErrors, true)
        XCTAssertNotNil(view.edit)
        XCTAssertEqual(view.edit, EditAddViewData.EditingViewData.build(contact: contact))
    }
    
    func testSaveValid()
    {
        let contact = ContactModel.buildValid()
        let persistence = ContactModelPersistenceMock(contacts: [])
        let view = EditContactViewControllerMock()
        let controlFlow = EditControlFlowMock()
        let presenter =  EditPresenter(contact: contact,
                                       contactPersistance: persistence,
                                       viewDelegate: view,
                                       flowDelegate: controlFlow)
        
        presenter.setup()
        presenter.save(viewData: EditAddViewData.EditingViewData.build(contact: contact))
        
        XCTAssertNotNil(view.errors)
        XCTAssertEqual(view.errors?.noErrors, true)
        XCTAssertNotNil(persistence.updatedEntity)
        XCTAssertEqual(persistence.updatedEntity, contact)
        XCTAssertTrue(controlFlow.flowClose)
    }
    
    func testSaveInvalid()
    {
        let contact = ContactModel.buildInvalidFirstName()
        let persistence = ContactModelPersistenceMock(contacts: [])
        let view = EditContactViewControllerMock()
        let controlFlow = EditControlFlowMock()
        let presenter =  EditPresenter(contact: contact,
                                       contactPersistance: persistence,
                                       viewDelegate: view,
                                       flowDelegate: controlFlow)
        
        presenter.setup()
        presenter.save(viewData: EditAddViewData.EditingViewData.build(contact: contact))
        
        XCTAssertNotNil(view.errors)
        XCTAssertEqual(view.errors?.noErrors, false)
        XCTAssertNil(persistence.updatedEntity)
        XCTAssertFalse(controlFlow.flowClose)
    }
    
    func testResetErrors()
    {
        let contact = ContactModel.buildValid()
        let persistence = ContactModelPersistenceMock(contacts: [])
        let view = EditContactViewControllerMock()
        let presenter =  EditPresenter(contact: contact,
                                       contactPersistance: persistence,
                                       viewDelegate: view,
                                       flowDelegate: nil)
        
        presenter.setup()
        presenter.resetErrors()
        
        XCTAssertNotNil(view.errors)
        XCTAssertEqual(view.errors?.noErrors, true)
        XCTAssertNil(persistence.addedEntity)
    }
}
