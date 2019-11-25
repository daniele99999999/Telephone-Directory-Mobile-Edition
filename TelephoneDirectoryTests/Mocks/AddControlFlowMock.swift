//
//  AddControlFlowMock.swift
//  TelephoneDirectoryTests
//
//  Created by Daniele Salvioni on 24/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

class AddControlFlowMock: AddPresenterFlowProtocol
{
    var flowClose: Bool = false
    var flowImport: Bool = false
    
    func requestFlowClose(presenter: AddPresenter)
    {
        self.flowClose = true
    }
    
    func requestFlowImport(presenter: AddPresenter)
    {
        self.flowImport = true
    }
}
