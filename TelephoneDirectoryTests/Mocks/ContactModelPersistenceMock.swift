//
//  ContactModelPersistenceMock.swift
//  TelephoneDirectoryTests
//
//  Created by Daniele Salvioni on 24/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

class ContactModelPersistenceMock: PersistenceProtocol
{
    private var contacts: [ContactModel]
    private var contactsFilteredByFirstAndLastName: [ContactModel]
    private var contactsFilteredByPhoneNumber: [ContactModel]
    private var contactsFilteredByAll: [ContactModel]
    
    var addedEntity: ContactModel?
    var updatedEntity: ContactModel?
    var filteredByFirstAndLastName: Bool = false
    var filteredByPhoneNumber: Bool = false
    var filteredByAll: Bool = false
    var contactsFiltered = [ContactModel]()
    
    init(contacts: [ContactModel],
         contactsFilteredByFirstAndLastName: [ContactModel] = [],
         contactsFilteredByPhoneNumber: [ContactModel] = [],
         contactsFilteredByAll: [ContactModel] = [])
    {
        self.contacts = contacts
        self.contactsFilteredByFirstAndLastName = contactsFilteredByFirstAndLastName.isEmpty ? contacts : contactsFilteredByFirstAndLastName
        self.contactsFilteredByPhoneNumber = contactsFilteredByPhoneNumber.isEmpty ? contacts : contactsFilteredByPhoneNumber
        self.contactsFilteredByAll = contactsFilteredByAll.isEmpty ? contacts : contactsFilteredByAll
    }
    
    func createTable()
    {
        return
    }
    
    func getAllEntity() -> [ContactModel]
    {
        return self.contacts
    }
    
    func getAllEntityFilteredByFirstAndLastName(filter: String) -> [ContactModel]
    {
        self.filteredByFirstAndLastName = true
        self.contactsFiltered = self.contactsFilteredByFirstAndLastName
        return self.contactsFiltered
    }
    
    func getAllEntityFilteredByPhoneNumber(filter: String) -> [ContactModel]
    {
        self.filteredByPhoneNumber = true
        self.contactsFiltered = self.contactsFilteredByPhoneNumber
        return self.contactsFiltered
    }
    
    func getAllEntityFilteredByAll(filter: String) -> [ContactModel]
    {
        self.filteredByAll = true
        self.contactsFiltered = self.contactsFilteredByAll
        return self.contactsFiltered
    }
    
    func getEntity(identifier: PersistenceIdentifier) -> ContactModel?
    {
        return self.contacts.filter
        { (contact: ContactModel) -> Bool in
            return contact.toIdentifier() == identifier.toIdentifier()
        }.first
    }
    
    func addEntity(_ entity: ContactModel) -> Bool
    {
        self.addedEntity = entity
        self.contacts.append(entity)
        return true
    }
    
    func updateEntity(_ entity: ContactModel) -> Bool
    {
        self.updatedEntity = entity
        let index = self.contacts.firstIndex
        { (contact: ContactModel) -> Bool in
            return contact.toIdentifier() == entity.toIdentifier()
        }
        guard let _index = index else { return false }
        self.contacts[_index] = entity
        return true
    }
    
    func deleteEntity(identifier: PersistenceIdentifier) -> Bool
    {
        let removed = self.contacts.removeFirst
        { (contact: ContactModel) -> Bool in
            return contact.toIdentifier() == identifier.toIdentifier()
        }
        return removed != nil
    }
    
    func deleteAllEntity() -> Bool
    {
        self.contacts.removeAll()
        return true
    }
}
