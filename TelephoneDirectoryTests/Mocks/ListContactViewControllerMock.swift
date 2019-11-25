//
//  ListContactViewControllerMock.swift
//  TelephoneDirectoryTests
//
//  Created by Daniele Salvioni on 24/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

class ListContactViewControllerMock: ListPresenterViewProtocol
{
    var title = ""
    var searchPlaceholder = ""
    var searchValue = ""
    var cells = [ListViewData.CellViewData]()
    
    func updateMain(viewData: ListViewData.MainViewData)
    {
        self.title = viewData.title
        self.searchPlaceholder = viewData.searchPlaceholder
        self.searchValue = viewData.searchValue
    }
    
    func updateCells(viewData: [ListViewData.CellViewData])
    {
        self.cells = viewData
    }
}
