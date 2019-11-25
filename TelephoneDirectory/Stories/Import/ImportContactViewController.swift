//
//  ImportContactViewController.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 23/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import UIKit
import SwifterSwift

class ImportContactViewController: BaseViewController
{
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ImportPresenter!
    private var datasource: [ImportViewData.CellViewData] = []
    
    internal var tableInsets: UIEdgeInsets { return .zero }
    
    class func createOne() -> ImportContactViewController
    {
        let vc: ImportContactViewController = self.loadFromStoryboard(storyboardName: Constants.Resources.Storyboards.main)
        return vc
    }
    
    override func setupUI()
    {
        super.setupUI()
        
        self.view.backgroundColor = Constants.Colors.colorDDDDDD
        self.containerView?.backgroundColor = .clear
        self.tableView.backgroundColor = .clear
        
        self.tableView.registerCell(nibClass: ImportContactTableViewCell.self)
        self.tableView.contentInset = self.tableInsets
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 100
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.allowsSelection = false
        self.tableView.bounces = true
        self.tableView.showsVerticalScrollIndicator = true
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.presenter.setup()
    }
}

extension ImportContactViewController: UITableViewDataSource, UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return min(1, self.datasource.count)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withClass: ImportContactTableViewCell.self, for: indexPath)
        
        let viewData = self.datasource[indexPath.row]
        cell.loadData(indexPath: indexPath, viewData: viewData)
        cell.delegate = self
        return cell
    }
}

extension ImportContactViewController: ImportContactTableViewCellDelegate
{
    func importButtonPressed(indexPath: IndexPath)
    {
        self.presenter.importContact(index: indexPath.row)
    }
}

extension ImportContactViewController: ImportPresenterViewProtocol
{
    func updateMain(viewData: ImportViewData.MainViewData)
    {
        self.title = viewData.title
    }
    
    func updateCells(viewData: [ImportViewData.CellViewData])
    {
        self.datasource = viewData
        self.tableView.reloadData()
    }
}
