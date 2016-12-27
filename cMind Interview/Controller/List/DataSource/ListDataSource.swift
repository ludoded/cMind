//
//  ListDataSource.swift
//  cMind Interview
//
//  Created by Haik Ampardjian on 12/27/16.
//  Copyright © 2016 cMind. All rights reserved.
//

import UIKit

final class ListDataSource:NSObject {
    unowned let viewModel: ListViewModel
    var selectCell: ((_ indexPath: IndexPath) -> ())?
    
    init(with viewModel: ListViewModel) {
        self.viewModel = viewModel
    }
}

extension ListDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.cellId, for: indexPath) as? ListCell else { fatalError("Can't load the cell") }
        cell.randomText.text = viewModel.data[indexPath.row]
        
        return cell
    }
}

extension ListDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectCell?(indexPath)
    }
}
