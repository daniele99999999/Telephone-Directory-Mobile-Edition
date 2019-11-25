//
//  ImportPresenter.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 23/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

protocol ImportPresenterViewProtocol: class
{
    func updateMain(viewData: ImportViewData.MainViewData)
    func updateCells(viewData: [ImportViewData.CellViewData])
}

protocol ImportPresenterFlowProtocol: class
{
    func requestFlowImportContact(presenter: ImportPresenter, contact: ContactModel)
}

class ImportPresenter
{
    private weak var viewDelegate: ImportPresenterViewProtocol?
    private weak var flowDelegate: ImportPresenterFlowProtocol?
    private var permissionManager: PermissionProtocol
    private var nativeContactManager: NativeContactProtocol
    private var contacts = [ContactModel]()
    
    init(permissionManager: PermissionProtocol, nativeContactManager: NativeContactProtocol, viewDelegate: ImportPresenterViewProtocol?, flowDelegate: ImportPresenterFlowProtocol?)
    {
        self.permissionManager = permissionManager
        self.nativeContactManager = nativeContactManager
        self.viewDelegate = viewDelegate
        self.flowDelegate = flowDelegate
    }
    
    func setup()
    {
        self.viewDelegate?.updateMain(viewData: ImportPresenter.buildMainViewData())
        
        self.permissionManager.requestContactAccess
        { [weak self] (granted: Bool) in
            if granted
            {
                self?.loadAllNativeContacts
                { [weak self] (contacts: [ContactModel]) in
                    self?.contacts = contacts
                    self?.viewDelegate?.updateCells(viewData: ImportPresenter.buildCellsViewData(contacts: self?.contacts ?? []))
                }
            }
            else
            {
                self?.contacts = []
                self?.viewDelegate?.updateCells(viewData: ImportPresenter.buildCellsViewData(contacts: self?.contacts ?? []))
            }
        }
    }
    
    func importContact(index: Int)
    {
        let contact = self.contacts[index]
        self.flowDelegate?.requestFlowImportContact(presenter: self, contact: contact)
    }
}

private extension ImportPresenter
{
    func loadAllNativeContacts(completion: @escaping ([ContactModel]) -> Void)
    {
        self.nativeContactManager.getAllEntity
        { (contacts: [ContactModel]) in
            completion(contacts)
        }
    }
}

private extension ImportPresenter
{
    static func buildMainViewData() -> ImportViewData.MainViewData
    {
        return ImportViewData.MainViewData(title: NSLocalizedString("Import.title", comment: ""))
    }
    
    static func buildCellsViewData(contacts: [ContactModel]) -> [ImportViewData.CellViewData]
    {
        return contacts.map
        { (contact: ContactModel) -> ImportViewData.CellViewData in
            return ImportViewData.CellViewData(firstName: contact.firstName,
                                               lastName: contact.lastName,
                                               phoneNumber: contact.phoneNumber)
        }
    }
}
