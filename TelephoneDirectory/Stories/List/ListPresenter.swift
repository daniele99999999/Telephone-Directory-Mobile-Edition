//
//  ListPresenter.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 14/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

protocol ListPresenterViewProtocol: class
{
    func updateMain(viewData: ListViewData.MainViewData)
    func updateCells(viewData: [ListViewData.CellViewData])
}

protocol ListPresenterFlowProtocol: class
{
    func requestFlowAddContact(presenter: ListPresenter)
    func requestFlowEditContact(presenter: ListPresenter, contact: ContactModel)
}

class ListPresenter
{
    private weak var viewDelegate: ListPresenterViewProtocol?
    private weak var flowDelegate: ListPresenterFlowProtocol?
    private var contactPersistance: PersistenceProtocol
    private var contacts = [ContactModel]()
    
    init(contactPersistance: PersistenceProtocol, viewDelegate: ListPresenterViewProtocol?, flowDelegate: ListPresenterFlowProtocol?)
    {
        self.contactPersistance = contactPersistance
        self.viewDelegate = viewDelegate
        self.flowDelegate = flowDelegate
    }
    
    func setup()
    {
        self.contacts = self.loadAllPersistedContacts()
        
        self.viewDelegate?.updateMain(viewData: ListPresenter.buildMainViewData())
        self.viewDelegate?.updateCells(viewData: ListPresenter.buildCellsViewData(contacts: self.contacts))
    }
    
    func resetData()
    {
        self.contacts = self.loadAllPersistedContacts()
        
        self.viewDelegate?.updateMain(viewData: ListPresenter.buildMainViewData())
        self.viewDelegate?.updateCells(viewData: ListPresenter.buildCellsViewData(contacts: self.contacts))
    }
    
    func searchContacts(text: String?)
    {
        if let _text = text, !_text.isEmpty
        {
            if (_text.rangeOfCharacter(from: NSCharacterSet.letters) != nil)
            {// ci sono anche lettere -> non cercare nel numero di telefono
                self.contacts = self.loadPersistedContactsFilteredByFirstAndLastName(text: _text)
            }
            else
            {// non ci sono lettere -> cerca ovunque
                self.contacts = self.loadPersistedContactsFilteredByAll(text: _text)
            }
        }
        else
        {// la ricerca è vuota -> carica tutto
            self.contacts = self.loadAllPersistedContacts()
        }
        self.viewDelegate?.updateCells(viewData: ListPresenter.buildCellsViewData(contacts: self.contacts))
    }
    
    func newContact()
    {
        self.flowDelegate?.requestFlowAddContact(presenter: self)
    }
    
    func editContact(index: Int)
    {
        let contact = self.contacts[index]
        self.flowDelegate?.requestFlowEditContact(presenter: self, contact: contact)
    }
}

private extension ListPresenter
{
    func loadAllPersistedContacts() -> [ContactModel]
    {
        return self.contactPersistance.getAllEntity()
    }
    
    func loadPersistedContactsFilteredByFirstAndLastName(text: String) -> [ContactModel]
    {
        return self.contactPersistance.getAllEntityFilteredByFirstAndLastName(filter: text)
    }
    
    func loadPersistedContactsFilteredByPhoneNumber(text: String) -> [ContactModel]
    {
        return self.contactPersistance.getAllEntityFilteredByPhoneNumber(filter: text)
    }
    
    func loadPersistedContactsFilteredByAll(text: String) -> [ContactModel]
    {
        return self.contactPersistance.getAllEntityFilteredByAll(filter: text)
    }
}

private extension ListPresenter
{
    static func buildMainViewData() -> ListViewData.MainViewData
    {
        return ListViewData.MainViewData(title: NSLocalizedString("Home.title", comment: ""),
                                         searchPlaceholder: NSLocalizedString("Home.search.placeholder", comment: ""),
                                         searchValue: "")
    }
    
    static func buildCellsViewData(contacts: [ContactModel]) -> [ListViewData.CellViewData]
    {
        return contacts.map
        { (contact: ContactModel) -> ListViewData.CellViewData in
            return ListViewData.CellViewData(firstName: contact.firstName, lastName: contact.lastName, phoneNumber: contact.phoneNumber)
        }
    }
}
