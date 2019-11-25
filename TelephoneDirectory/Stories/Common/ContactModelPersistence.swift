//
//  ContactModelPersistence.swift
//  TelephoneDirectory
//
//  Created by daniele on 05/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation
import GRDB
import SwifterSwift
import UIKit

class ContactModelPersistence: PersistenceProtocol
{
    private let dbQueue: DatabaseQueue
    
    init(path: String)
    {
        guard let dbPath = FileManager.documentDirectoryString(appendingPath: path) else { fatalError(NSLocalizedString("error.path.database", comment: "")) }
        do
        { self.dbQueue = try DatabaseQueue(path: dbPath) }
        catch
        { fatalError(NSLocalizedString("error.load.database", comment: "")) }
        self.dbQueue.setupMemoryManagement(in: UIApplication.shared)
    }
    
    func createTable()
    {
        var migrator = DatabaseMigrator()
        migrator.registerMigration(ContactModel.databaseTableName)
        { db in
            try ContactModel.createTable(db: db)
        }
        
        do { try migrator.migrate(self.dbQueue) }
        catch
        {
            fatalError(NSLocalizedString("error.migration.database", comment: ""))
        }
    }
    
    func getAllEntity() -> [ContactModel]
    {
        do
        {
            return try self.dbQueue.read
            { (db) in
                return try ContactModel.fetchAll(db)
            }
        }
        catch let error as NSError
        {
            print("error: \(error.description)")
            return []
        }
    }
    
    func getAllEntityFilteredByFirstAndLastName(filter: String) -> [ContactModel]
    {
        let sqlQuery = "SELECT * FROM contactModel WHERE firstName LIKE '%\(filter)%' OR lastName LIKE '%\(filter)%'"
        return self.getAllEntity(sqlQuery: sqlQuery)
    }
    
    func getAllEntityFilteredByPhoneNumber(filter: String) -> [ContactModel]
    {
        let sqlQuery = "SELECT * FROM contactModel WHERE phoneNumber LIKE '%\(filter)%'"
        return self.getAllEntity(sqlQuery: sqlQuery)
    }
    
    func getAllEntityFilteredByAll(filter: String) -> [ContactModel]
    {
        let sqlQuery = "SELECT * FROM contactModel WHERE firstName LIKE '%\(filter)%' OR lastName LIKE '%\(filter)%' OR phoneNumber LIKE '%\(filter)%'"
        return self.getAllEntity(sqlQuery: sqlQuery)
    }
    
    func getEntity(identifier: PersistenceIdentifier) -> ContactModel?
    {
        do
        {
            return try self.dbQueue.read
            { db in
                return try ContactModel.fetchOne(db, key: identifier.toIdentifier())
            }
        }
        catch let error as NSError
        {
            print("error: \(error.description)")
            return nil
        }
    }
    
    @discardableResult func addEntity(_ entity: ContactModel) -> Bool
    {
        var _entity = entity
        do
        {
            _ = try self.dbQueue.write
            { db in
                return try _entity.save(db)
            }
        }
        catch let error as NSError
        {
            print("error: \(error.description)")
            return false
        }
        return true
    }
    
    @discardableResult func updateEntity(_ entity: ContactModel) -> Bool
    {
        return self.addEntity(entity)
    }
    
    @discardableResult func deleteEntity(identifier: PersistenceIdentifier) -> Bool
    {
        do
        {
            _ = try self.dbQueue.write
            { db in
                try ContactModel.deleteOne(db, key: identifier.toIdentifier())
            }
        }
        catch let error as NSError
        {
            print("error: \(error.description)")
            return false
        }
        return true
    }
    
    @discardableResult func deleteAllEntity() -> Bool
    {
        do
        {
            _ = try self.dbQueue.write
            { db in
                try ContactModel.deleteAll(db)
            }
        }
        catch let error as NSError
        {
            print("error: \(error.description)")
            return false
        }
        return true
    }
}

private extension ContactModelPersistence
{
    func getAllEntity(sqlQuery: String, arguments: [String]? = nil) -> [ContactModel]
    {
        do
        {
            return try self.dbQueue.read
            { (db) in
                if let _arguments = arguments
                {
                    return try ContactModel.fetchAll(db, sql: sqlQuery, arguments: StatementArguments.init(_arguments))
                }
                else
                {
                    return try ContactModel.fetchAll(db, sql: sqlQuery)
                }
            }
        }
        catch let error as NSError
        {
            print("error: \(error.description)")
            return []
        }
    }
}


