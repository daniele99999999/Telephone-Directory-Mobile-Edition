//
//  ImportPresenterTests.swift
//  TelephoneDirectoryTests
//
//  Created by Daniele Salvioni on 24/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import XCTest
@testable import TelephoneDirectory

class ImportPresenterTests: XCTestCase
{
    func testPermissionDenied()
    {
        let permissionManager = PermissionManagerMock(canAccess: false)
        let nativeContactManager = NativeContactManagerMock(contacts: ContactModel.buildValidArray())
        let view = ImportContactViewControllerMock()
        let presenter = ImportPresenter(permissionManager: permissionManager,
                                        nativeContactManager: nativeContactManager,
                                        viewDelegate: view,
                                        flowDelegate: nil)
        
        presenter.setup()
        
        XCTAssertFalse(view.title.isEmpty)
        XCTAssertTrue(view.cells.isEmpty)
    }
    
    func testPermissionGranted()
    {
        let permissionManager = PermissionManagerMock(canAccess: true)
        let nativeContactManager = NativeContactManagerMock(contacts: ContactModel.buildValidArray())
        let view = ImportContactViewControllerMock()
        let presenter = ImportPresenter(permissionManager: permissionManager,
                                        nativeContactManager: nativeContactManager,
                                        viewDelegate: view,
                                        flowDelegate: nil)
        
        presenter.setup()
        
        XCTAssertFalse(view.title.isEmpty)
        XCTAssertFalse(view.cells.isEmpty)
    }
    
    func testImportFlow()
    {
        let indexElement = 0
        var contacts = ContactModel.buildValidArray()
        contacts.insert(ContactModel(id: nil,
                                     firstName: "Import",
                                     lastName: "Import",
                                     phoneNumber: "+39 999 999999"),
                        at: 0)
        let permissionManager = PermissionManagerMock(canAccess: true)
        let nativeContactManager = NativeContactManagerMock(contacts: contacts)
        let controlFlow = ImportControlFlowMock()
        let presenter = ImportPresenter(permissionManager: permissionManager,
                                        nativeContactManager: nativeContactManager,
                                        viewDelegate: nil,
                                        flowDelegate: controlFlow)
        
        presenter.setup()
        presenter.importContact(index: indexElement)
        
        XCTAssertTrue(controlFlow.flowImportContact)
        XCTAssertNotNil(controlFlow.contact)
        XCTAssertEqual(contacts[indexElement], controlFlow.contact)
    }
}
