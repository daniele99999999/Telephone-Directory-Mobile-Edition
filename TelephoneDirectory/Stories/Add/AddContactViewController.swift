//
//  AddContactViewController.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import UIKit
import SwifterSwift

class AddContactViewController: BaseViewController
{
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var firstNameField: FloatingLabelTextField!
    @IBOutlet weak var lastNameField: FloatingLabelTextField!
    @IBOutlet weak var phoneNumberField: FloatingLabelTextField!
    
    var presenter: AddPresenter!
    private var textFieldElements = [UITextField]()
    private var datasource: EditAddViewData.EditingViewData?
    
    class func createOne() -> AddContactViewController
    {
        let vc: AddContactViewController = self.loadFromStoryboard(storyboardName: Constants.Resources.Storyboards.main)
        return vc
    }
    
    override func setupUI()
    {
        super.setupUI()
        
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(self.saveContactButtonPressed)),
                                                   UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addFromAddressBookButtonPressed))]
        
        self.view.backgroundColor = Constants.Colors.colorDDDDDD
        self.containerView?.backgroundColor = .clear
        self.stackView?.backgroundColor = Constants.Colors.colorFFFFFF
        
        self.firstNameField.configure(placeholder: "first name")
        self.lastNameField.configure(placeholder: "last name")
        self.phoneNumberField.configure(placeholder: "phone number")
        
        self.textFieldElements = self.stackView.findTextFieldsSubclassAndSetDelegateTo(delegate: self)
        UITextField.updateDefaultReturnKey(textFields: self.textFieldElements)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.presenter.setup()
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        
        self.dismissKeyboard()
    }
    
    @IBAction func addFromAddressBookButtonPressed()
    {
        self.presenter.importFromAddressBook()
    }
    
    @IBAction func saveContactButtonPressed()
    {
        self.dismissKeyboard()
        self.presenter.save(viewData: EditAddViewData.EditingViewData(firstName: self.firstNameField.text ?? "",
                                                                      lastName: self.lastNameField.text ?? "",
                                                                      phoneNumber: self.phoneNumberField.text ?? ""))
    }
}

extension AddContactViewController: UITextFieldDelegate
{
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        self.presenter.resetErrors()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        return textField.manageLastFormReturn(elements: self.textFieldElements,
                                              returnPressed:
        { [weak self] in
            self?.saveContactButtonPressed()
        })
    }
}

extension AddContactViewController: AddPresenterViewProtocol
{
    func updateMain(viewData: EditAddViewData.MainViewData)
    {
        self.title = viewData.title
    }
    
    func updateAdding(viewData: EditAddViewData.EditingViewData)
    {
        self.firstNameField.text = viewData.firstName
        self.lastNameField.text = viewData.lastName
        self.phoneNumberField.text = viewData.phoneNumber
    }
    
    func updateErrors(viewData: EditAddViewData.ErrorsViewData)
    {
        self.firstNameField.errorMessage = viewData.firstName.joined(separator: ", ")
        self.lastNameField.errorMessage = viewData.lastName.joined(separator: ", ")
        self.phoneNumberField.errorMessage = viewData.phoneNumber.joined(separator: ", ")
    }
}
