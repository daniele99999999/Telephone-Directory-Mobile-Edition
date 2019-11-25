//
//  ListPresenterTests.swift
//  TelephoneDirectoryTests
//
//  Created by Daniele Salvioni on 24/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import XCTest
@testable import TelephoneDirectory

class ListPresenterTests: XCTestCase
{
    func testFull()
    {
        let contacts = ContactModel.buildValidArray()
        let persistence = ContactModelPersistenceMock(contacts: contacts)
        let view = ListContactViewControllerMock()
        let presenter = ListPresenter(contactPersistance: persistence,
                                      viewDelegate: view,
                                      flowDelegate: nil)
        
        presenter.setup()
        
        XCTAssertFalse(view.title.isEmpty)
        XCTAssertFalse(view.searchPlaceholder.isEmpty)
        XCTAssertFalse(view.cells.isEmpty)
    }
    
    func testEmpty()
    {
        let persistence = ContactModelPersistenceMock(contacts: [])
        let view = ListContactViewControllerMock()
        let presenter = ListPresenter(contactPersistance: persistence,
                                      viewDelegate: view,
                                      flowDelegate: nil)
        
        presenter.setup()
        
        XCTAssertFalse(view.title.isEmpty)
        XCTAssertFalse(view.searchPlaceholder.isEmpty)
        XCTAssertTrue(view.cells.isEmpty)
    }
    
    func testSearchAll()
    {
        let contacts = ContactModel.buildValidSearchArray()
        let contactToSearch = contacts[3]
        let persistence = ContactModelPersistenceMock(contacts: contacts,
                                                      contactsFilteredByFirstAndLastName: [],
                                                      contactsFilteredByPhoneNumber: [],
                                                      contactsFilteredByAll: [contactToSearch])
        let view = ListContactViewControllerMock()
        let presenter = ListPresenter(contactPersistance: persistence,
                                      viewDelegate: view,
                                      flowDelegate: nil)
        
        presenter.setup()
        presenter.searchContacts(text: "3")
        
        XCTAssertFalse(persistence.filteredByFirstAndLastName)
        XCTAssertFalse(persistence.filteredByPhoneNumber)
        XCTAssertTrue(persistence.filteredByAll)
        XCTAssertFalse(view.cells.isEmpty)
        XCTAssertEqual(view.cells.count, 1)
        XCTAssertFalse(persistence.contactsFiltered.isEmpty)
        XCTAssertEqual(ListViewData.CellViewData.build(contact: contactToSearch), view.cells.first)
    }
    
    func testSearchFirstAndLastName()
    {
        let contacts = ContactModel.buildValidSearchArray()
        let contactToSearch = contacts[2]
        let persistence = ContactModelPersistenceMock(contacts: contacts,
                                                      contactsFilteredByFirstAndLastName: [contactToSearch],
                                                      contactsFilteredByPhoneNumber: [],
                                                      contactsFilteredByAll: [])
        let view = ListContactViewControllerMock()
        let presenter = ListPresenter(contactPersistance: persistence,
                                      viewDelegate: view,
                                      flowDelegate: nil)
        
        presenter.setup()
        presenter.searchContacts(text: "c")
        
        XCTAssertTrue(persistence.filteredByFirstAndLastName)
        XCTAssertFalse(persistence.filteredByPhoneNumber)
        XCTAssertFalse(persistence.filteredByAll)
        XCTAssertFalse(view.cells.isEmpty)
        XCTAssertEqual(view.cells.count, 1)
        XCTAssertFalse(persistence.contactsFiltered.isEmpty)
        XCTAssertEqual(ListViewData.CellViewData.build(contact: contactToSearch), view.cells.first)
    }
    
    func testReset()
    {
        let contacts = ContactModel.buildValidArray()
        let persistence = ContactModelPersistenceMock(contacts: contacts)
        let view = ListContactViewControllerMock()
        let presenter = ListPresenter(contactPersistance: persistence,
                                      viewDelegate: view,
                                      flowDelegate: nil)
        
        presenter.setup()
        presenter.resetData()
        
        XCTAssertFalse(view.title.isEmpty)
        XCTAssertFalse(view.searchPlaceholder.isEmpty)
        XCTAssertTrue(view.searchValue.isEmpty)
        XCTAssertFalse(view.cells.isEmpty)
        XCTAssertEqual(view.cells.count, contacts.count)
    }
    
    func testAddFlow()
    {
        let contacts = ContactModel.buildValidArray()
        let persistence = ContactModelPersistenceMock(contacts: contacts)
        let controlFlow = ListControlFlowMock()
        let presenter = ListPresenter(contactPersistance: persistence,
                                      viewDelegate: nil,
                                      flowDelegate: controlFlow)
        
        presenter.setup()
        presenter.newContact()
        
        XCTAssertTrue(controlFlow.flowAddContact)
    }
    
    func testEditFlow()
    {
        let indexElement = 0
        var contacts = ContactModel.buildValidArray()
        contacts.insert(ContactModel(id: nil,
                                     firstName: "Edit",
                                     lastName: "Edit",
                                     phoneNumber: "+39 999 999999"),
                        at: 0)
        let persistence = ContactModelPersistenceMock(contacts: contacts)
        let controlFlow = ListControlFlowMock()
        let presenter = ListPresenter(contactPersistance: persistence,
                                      viewDelegate: nil,
                                      flowDelegate: controlFlow)
        
        presenter.setup()
        presenter.editContact(index: indexElement)
        
        XCTAssertTrue(controlFlow.flowEditContact)
        XCTAssertNotNil(controlFlow.contact)
        XCTAssertEqual(contacts[indexElement], controlFlow.contact)
    }
}
