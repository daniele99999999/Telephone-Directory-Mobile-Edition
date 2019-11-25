//
//  ContactTableViewCell.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import UIKit
import SwifterSwift

protocol ContactTableViewCellDelegate: class
{
    func editButtonPressed(indexPath: IndexPath)
}

class ContactTableViewCell: BaseTableViewCell
{
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    weak var delegate: ContactTableViewCellDelegate?
    
    override func setupData()
    {
        super.setupData()
        
        self.firstName.textColor = Constants.Colors.color000000
        self.lastName.textColor = Constants.Colors.color000000
        self.phoneNumber.textColor = Constants.Colors.color000000
    }
    
    override func resetData()
    {
        super.resetData()
        
        self.firstName.text = nil
        self.lastName.text = nil
        self.phoneNumber.text = nil
    }
    
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
        
    }
    
    func loadData(indexPath: IndexPath, viewData: ListViewData.CellViewData)
    {
        super.loadData(indexPath: indexPath)
        
        self.firstName.text = viewData.firstName
        self.lastName.text = viewData.lastName
        self.phoneNumber.text = viewData.phoneNumber
    }
    
    @IBAction func editButtonPressed()
    {
        self.delegate?.editButtonPressed(indexPath: self.indexPath)
    }
}

