//
//  BaseViewController.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell
{
    @IBOutlet weak var containerView: UIView?
    
    var indexPath: IndexPath!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        self.setupData()
        self.resetData()
    }
    
    override func prepareForReuse()
    {
        super.prepareForReuse()
        
        self.resetData()
    }
 
    func setupData()
    {
        
    }
    
    func resetData()
    {
        
    }
    
    func loadData(indexPath: IndexPath)
    {
        self.indexPath = indexPath
    }
}
