//
//  ListViewController.swift
//  cMind Interview
//
//  Created by Haik Ampardjian on 12/27/16.
//  Copyright © 2016 cMind. All rights reserved.
//

import UIKit

final class ListViewController: UIViewController {
    let viewModel = ListViewModel()
    var dataSource: ListDataSource!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        viewModel.populate()
    }
    
    private func setupTableView() {
        dataSource = ListDataSource(with: viewModel)
        dataSource.selectCell = { [weak self] indexPath in
            guard indexPath.row == 0 else { return }
            let _ = self?.navigationController?.popViewController(animated: true)
        }
        
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50.0
        
        registerCells()
    }
    
    private func registerCells() {
        tableView.register(ListCell.nib, forCellReuseIdentifier: ListCell.cellId)
    }
}
