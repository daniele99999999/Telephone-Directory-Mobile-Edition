//
//  ContactModel+GRDB.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 05/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation
import GRDB

extension ContactModel
{
    static func createTable(db: Database) throws
    {
        try db.create(table: self.databaseTableName)
        { (t: TableDefinition) in
            t.autoIncrementedPrimaryKey("id")
            t.column("firstName", .text).notNull()
            t.column("lastName", .text).notNull()
            t.column("phoneNumber", .text)
        }
    }
}

extension ContactModel: FetchableRecord {}
extension ContactModel: MutablePersistableRecord
{
    mutating func didInsert(with rowID: Int64, for column: String?) { self.id = rowID }
}
