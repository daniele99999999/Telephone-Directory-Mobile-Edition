//
//  EditPresenter.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 15/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

protocol EditPresenterViewProtocol: class
{
    func updateMain(viewData: EditAddViewData.MainViewData)
    func updateAdding(viewData: EditAddViewData.EditingViewData)
    func updateErrors(viewData: EditAddViewData.ErrorsViewData)
}

protocol EditPresenterFlowProtocol: class
{
    func requestFlowClose(presenter: EditPresenter)
}

class EditPresenter
{
    private weak var viewDelegate: EditPresenterViewProtocol?
    private weak var flowDelegate: EditPresenterFlowProtocol?
    private let contactPersistance: PersistenceProtocol
    private let contact: ContactModel
    
    private let validator: ValidatorEditAddViewData
    
    init(contact: ContactModel, contactPersistance: PersistenceProtocol, viewDelegate: EditPresenterViewProtocol?, flowDelegate: EditPresenterFlowProtocol?)
    {
        self.contactPersistance = contactPersistance
        self.viewDelegate = viewDelegate
        self.flowDelegate = flowDelegate
        self.validator = ValidatorEditAddViewData()
        self.contact = contact
    }
    
    func setup()
    {
        self.viewDelegate?.updateMain(viewData: EditPresenter.buildMainViewData())
        self.viewDelegate?.updateAdding(viewData: EditPresenter.buildEditingViewData(contact: self.contact))
        self.viewDelegate?.updateErrors(viewData: EditPresenter.buildNoErrors())
    }
    
    func resetErrors()
    {
        self.viewDelegate?.updateErrors(viewData: EditPresenter.buildNoErrors())
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
}

private extension EditPresenter
{
    func persistContact(viewData: EditAddViewData.EditingViewData)
    {// creare il contact con i dati del AddingViewData + id del model da editare
        let editedContact = ContactModel(id: self.contact.id, firstName: viewData.firstName, lastName: viewData.lastName, phoneNumber: viewData.phoneNumber)
        self.contactPersistance.updateEntity(editedContact)
        
        self.viewDelegate?.updateErrors(viewData: EditPresenter.buildNoErrors())
        self.flowDelegate?.requestFlowClose(presenter: self)
    }
    
    func invalidContact(errors: EditAddViewData.ErrorsViewData)
    {
        self.viewDelegate?.updateErrors(viewData: errors)
    }
}

private extension EditPresenter
{
    static func buildMainViewData() -> EditAddViewData.MainViewData
    {
        return EditAddViewData.MainViewData(title: NSLocalizedString("Edit.title", comment: ""))
    }
    
    static func buildEditingViewData(contact: ContactModel) -> EditAddViewData.EditingViewData
    {
        return EditAddViewData.EditingViewData(firstName: contact.firstName,
                                               lastName: contact.lastName,
                                               phoneNumber: contact.phoneNumber)
    }
    
    static func buildNoErrors() -> EditAddViewData.ErrorsViewData
    {
        return EditAddViewData.ErrorsViewData(firstName: [],
                                              lastName: [],
                                              phoneNumber: [])
    }
}
