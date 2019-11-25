//
//  AddPresenter.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 15/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

protocol AddPresenterViewProtocol: class
{
    func updateMain(viewData: EditAddViewData.MainViewData)
    func updateAdding(viewData: EditAddViewData.EditingViewData)
    func updateErrors(viewData: EditAddViewData.ErrorsViewData)
}

protocol AddPresenterFlowProtocol: class
{
    func requestFlowClose(presenter: AddPresenter)
    func requestFlowImport(presenter: AddPresenter)
}

class AddPresenter
{
    private weak var viewDelegate: AddPresenterViewProtocol?
    private weak var flowDelegate: AddPresenterFlowProtocol?
    private let contactPersistance: PersistenceProtocol
    private let validator: ValidatorEditAddViewData
    
//    private var contactViewData: AddViewData.AddingViewData
    
    init(contactPersistance: PersistenceProtocol, viewDelegate: AddPresenterViewProtocol?, flowDelegate: AddPresenterFlowProtocol?)
    {
        self.contactPersistance = contactPersistance
        self.viewDelegate = viewDelegate
        self.flowDelegate = flowDelegate
        self.validator = ValidatorEditAddViewData()
    }
    
    func setup()
    {
        self.viewDelegate?.updateMain(viewData: AddPresenter.buildMainViewData())
        self.viewDelegate?.updateAdding(viewData: AddPresenter.buildEditingViewData())
        self.viewDelegate?.updateErrors(viewData: AddPresenter.buildNoErrors())
    }
    
    func resetErrors()
    {
        self.viewDelegate?.updateErrors(viewData: AddPresenter.buildNoErrors())
    }
    
    func save(viewData: EditAddViewData.EditingViewData)
    {
        // qui si effettua la validazione...
        let errorsViewData = self.validator.validate(viewData: viewData)
        if errorsViewData.noErrors
        {// ... Se la passa, private function di success
            self.persistContact(viewData: viewData)
        }
        else
        {// ... Se non la passa, private function di failure
            self.invalidContact(errors: errorsViewData)
        }
    }
    
    func importFromAddressBook()
    {
        self.flowDelegate?.requestFlowImport(presenter: self)
    }
}

private extension AddPresenter
{
    func persistContact(viewData: EditAddViewData.EditingViewData)
    {// creare il contact con i dati del AddingViewData
        let addContact = ContactModel(id: nil, firstName: viewData.firstName, lastName: viewData.lastName, phoneNumber: viewData.phoneNumber)
        self.contactPersistance.addEntity(addContact)
        
        self.viewDelegate?.updateErrors(viewData: AddPresenter.buildNoErrors())
        self.flowDelegate?.requestFlowClose(presenter: self)
    }
    
    func invalidContact(errors: EditAddViewData.ErrorsViewData)
    {
        self.viewDelegate?.updateErrors(viewData: errors)
    }
}

private extension AddPresenter
{
    static func buildMainViewData() -> EditAddViewData.MainViewData
    {
        return EditAddViewData.MainViewData(title: NSLocalizedString("Add.title", comment: ""))
    }
    
    static func buildEditingViewData() -> EditAddViewData.EditingViewData
    {
        return EditAddViewData.EditingViewData(firstName: "",
                                               lastName: "",
                                               phoneNumber: "")
    }
    
    static func buildNoErrors() -> EditAddViewData.ErrorsViewData
    {
        return EditAddViewData.ErrorsViewData(firstName: [],
                                              lastName: [],
                                              phoneNumber: [])
    }
}

