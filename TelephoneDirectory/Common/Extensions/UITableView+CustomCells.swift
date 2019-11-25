//
//  UITableView+CustomCells.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import UIKit

extension UITableView
{
    func registerCell<T: UITableViewCell>(nibClass: T.Type)
    {
        self.register(UINib(nibName: String(describing: nibClass), bundle: nil), forCellReuseIdentifier: String(describing: nibClass))
    }
    
    func registerHeaderFooter<T: UITableViewHeaderFooterView>(nibClass: T.Type)
    {
        self.register(UINib(nibName: String(describing: nibClass), bundle: nil), forHeaderFooterViewReuseIdentifier: String(describing: nibClass))
    }
    
    func dequeueReusableCell<T: UITableViewCell>(className: T.Type, identifier: String = String(describing: T.self), indexPath: IndexPath) -> T
    {
        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else
        {
            fatalError("Couldn't find UITableViewCell for \(String(describing: className))")
        }
        return cell
    }
    
    func dequeueReusableHeaderView<T: UITableViewHeaderFooterView>(className: T.Type, identifier: String = String(describing: T.self)) -> T
    {
        guard let cell = dequeueReusableHeaderFooterView(withIdentifier: identifier) as? T else
        {
            fatalError("Couldn't find UITableViewHeaderFooterView for \(String(describing: className))")
        }
        return cell
    }
}
