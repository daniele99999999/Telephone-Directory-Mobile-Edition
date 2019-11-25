//
//  PersistenceService.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

class PersistenceService
{
    var contactModelPersistence: PersistenceProtocol
    
    init()
    {
        self.contactModelPersistence = ContactModelPersistence(path: Constants.Resources.Database.sqlLiteFileName)
        self.contactModelPersistence.createTable()
        
    }
}

