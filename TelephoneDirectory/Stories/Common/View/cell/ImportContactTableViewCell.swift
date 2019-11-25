//
//  ImportContactTableViewCell.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import UIKit

protocol ImportContactTableViewCellDelegate: class
{
    func importButtonPressed(indexPath: IndexPath)
}

class ImportContactTableViewCell: BaseTableViewCell
{
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    weak var delegate: ImportContactTableViewCellDelegate?
    
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
    
    func loadData(indexPath: IndexPath, viewData: ImportViewData.CellViewData)
    {
        super.loadData(indexPath: indexPath)
        
        self.firstName.text = viewData.firstName
        self.lastName.text = viewData.lastName
        self.phoneNumber.text = viewData.phoneNumber
    }
    
    @IBAction func importButtonPressed()
    {
        self.delegate?.importButtonPressed(indexPath: self.indexPath)
    }
}
