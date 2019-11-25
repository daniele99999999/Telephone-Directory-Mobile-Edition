//
//  ImportControlFlowMock.swift
//  TelephoneDirectoryTests
//
//  Created by Daniele Salvioni on 24/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

class ImportControlFlowMock: ImportPresenterFlowProtocol
{
    var flowImportContact: Bool = false
    var contact: ContactModel?
    
    func requestFlowImportContact(presenter: ImportPresenter, contact: ContactModel)
    {
        self.flowImportContact = true
        self.contact = contact
    }
}
