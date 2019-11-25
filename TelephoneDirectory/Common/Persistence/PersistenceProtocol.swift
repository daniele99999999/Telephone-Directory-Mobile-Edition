//
//  PersistenceProtocol.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

protocol PersistenceIdentifier
{
    func toIdentifier() -> Int64?
}

extension String: PersistenceIdentifier
{
    func toIdentifier() -> Int64? { return Int64(self) }
}

extension Int: PersistenceIdentifier
{
    func toIdentifier() -> Int64? { return Int64(self) }
}

extension Date: PersistenceIdentifier
{
    func toIdentifier() -> Int64? { return Int64(self.timeIntervalSinceNow) }
}

extension Int64: PersistenceIdentifier
{
    func toIdentifier() -> Int64? { return self }
}

protocol PersistenceProtocol: class
{
    func createTable()
    func getAllEntity() -> [ContactModel]
    func getAllEntityFilteredByFirstAndLastName(filter: String) -> [ContactModel]
    func getAllEntityFilteredByPhoneNumber(filter: String) -> [ContactModel]
    func getAllEntityFilteredByAll(filter: String) -> [ContactModel]
    func getEntity(identifier: PersistenceIdentifier) -> ContactModel?
    @discardableResult func addEntity(_ entity: ContactModel) -> Bool
    @discardableResult func updateEntity(_ entity: ContactModel) -> Bool
    @discardableResult func deleteEntity(identifier: PersistenceIdentifier) -> Bool
    @discardableResult func deleteAllEntity() -> Bool
}
