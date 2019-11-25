//
//  AddContactViewControllerMock.swift
//  TelephoneDirectoryTests
//
//  Created by Daniele Salvioni on 24/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

class AddContactViewControllerMock: AddPresenterViewProtocol
{
    var title = ""
    var add: EditAddViewData.EditingViewData?
    var errors: EditAddViewData.ErrorsViewData?
    
    func updateMain(viewData: EditAddViewData.MainViewData)
    {
        self.title = viewData.title
    }
    
    func updateAdding(viewData: EditAddViewData.EditingViewData)
    {
        self.add = viewData
    }
    
    func updateErrors(viewData: EditAddViewData.ErrorsViewData)
    {
        self.errors = viewData
    }
}
