//
//  EditControlFlowMock.swift
//  TelephoneDirectoryTests
//
//  Created by Daniele Salvioni on 24/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

class EditControlFlowMock: EditPresenterFlowProtocol
{
    var flowClose: Bool = false
    
    func requestFlowClose(presenter: EditPresenter)
    {
        self.flowClose = true
    }
}
