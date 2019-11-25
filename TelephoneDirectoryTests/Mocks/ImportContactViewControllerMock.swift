//
//  ImportContactViewControllerMock.swift
//  TelephoneDirectoryTests
//
//  Created by Daniele Salvioni on 24/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

class ImportContactViewControllerMock: ImportPresenterViewProtocol
{
    var title = ""
    var cells = [ImportViewData.CellViewData]()
    
    func updateMain(viewData: ImportViewData.MainViewData)
    {
        self.title = viewData.title
    }
    
    func updateCells(viewData: [ImportViewData.CellViewData])
    {
        self.cells = viewData
    }
}
