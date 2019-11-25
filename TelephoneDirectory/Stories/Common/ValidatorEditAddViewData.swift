//
//  ValidatorEditAddViewData.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 22/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

struct ValidatorEditAddViewData
{
    func validate(viewData: EditAddViewData.EditingViewData) -> EditAddViewData.ErrorsViewData
    {
        let firstNameErrors = Validator.validate(input: viewData.firstName, rules: [.mandatory])
        let lastNameErrors = Validator.validate(input: viewData.lastName, rules: [.mandatory])
        let phoneNumberErrors = Validator.validate(input: viewData.phoneNumber, rules: [.phoneNumber])
        
        return EditAddViewData.ErrorsViewData(firstName: firstNameErrors,
                                              lastName: lastNameErrors,
                                              phoneNumber: phoneNumberErrors)
    }
}
