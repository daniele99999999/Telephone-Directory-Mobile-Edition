//
//  AddPresenterTests.swift
//  TelephoneDirectoryTests
//
//  Created by Daniele Salvioni on 24/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import XCTest
@testable import TelephoneDirectory

class AddPresenterTests: XCTestCase
{
    func testEmpty()
    {
        let persistence = ContactModelPersistenceMock(contacts: [])
        let view = AddContactViewControllerMock()
        
        let presenter = AddPresenter(contactPersistance: persistence,
                                     viewDelegate: view,
                                     flowDelegate: nil)
        
        presenter.setup()
        
        XCTAssertFalse(view.title.isEmpty)
        XCTAssertNotNil(view.add)
        XCTAssertNotNil(view.errors)
        XCTAssertEqual(view.errors?.noErrors, true)
    }
    
    func testSaveValid()
    {
        let contact = ContactModel.buildValid()
        let persistence = ContactModelPersistenceMock(contacts: [])
        let view = AddContactViewControllerMock()
        let controlFlow = AddControlFlowMock()
        let presenter = AddPresenter(contactPersistance: persistence,
                                     viewDelegate: view,
                                     flowDelegate: controlFlow)
        
        presenter.setup()
        presenter.save(viewData: EditAddViewData.EditingViewData.build(contact: contact))
        
        XCTAssertNotNil(view.errors)
        XCTAssertEqual(view.errors?.noErrors, true)
        XCTAssertNotNil(persistence.addedEntity)
        XCTAssertEqual(persistence.addedEntity, contact)
        XCTAssertTrue(controlFlow.flowClose)
    }
    
    func testSaveInvalid()
    {
        let contact = ContactModel.buildInvalidFirstName()
        let persistence = ContactModelPersistenceMock(contacts: [])
        let view = AddContactViewControllerMock()
        let controlFlow = AddControlFlowMock()
        let presenter = AddPresenter(contactPersistance: persistence,
                                     viewDelegate: view,
                                     flowDelegate: controlFlow)
        
        presenter.setup()
        presenter.save(viewData: EditAddViewData.EditingViewData.build(contact: contact))
        
        XCTAssertNotNil(view.errors)
        XCTAssertEqual(view.errors?.noErrors, false)
        XCTAssertNil(persistence.addedEntity)
        XCTAssertFalse(controlFlow.flowClose)
    }
    
    func testResetErrors()
    {
        let persistence = ContactModelPersistenceMock(contacts: [])
        let view = AddContactViewControllerMock()
        let presenter = AddPresenter(contactPersistance: persistence,
                                     viewDelegate: view,
                                     flowDelegate: nil)
        
        presenter.setup()
        presenter.resetErrors()
        
        XCTAssertNotNil(view.errors)
        XCTAssertEqual(view.errors?.noErrors, true)
        XCTAssertNil(persistence.addedEntity)
    }
    
    func testImportFromAddressBookFlow()
    {
        let persistence = ContactModelPersistenceMock(contacts: [])
        let controlFlow = AddControlFlowMock()
        let presenter = AddPresenter(contactPersistance: persistence,
                                     viewDelegate: nil,
                                     flowDelegate: controlFlow)
        
        presenter.setup()
        presenter.importFromAddressBook()
        
        XCTAssertTrue(controlFlow.flowImport)
    }
}
