//
//  ListControlFlowMock.swift
//  TelephoneDirectoryTests
//
//  Created by Daniele Salvioni on 24/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

class ListControlFlowMock: ListPresenterFlowProtocol
{
    var flowAddContact: Bool = false
    var flowEditContact: Bool = false
    var contact: ContactModel?
    
    func requestFlowAddContact(presenter: ListPresenter)
    {
        self.flowAddContact = true
    }
    
    func requestFlowEditContact(presenter: ListPresenter, contact: ContactModel)
    {
        self.flowEditContact = true
        self.contact = contact
    }
}
