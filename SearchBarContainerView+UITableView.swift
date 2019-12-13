//
//  SearchBarContainerView+UITableView.swift
//  SampleSearchBar
//
//  Created by Divum on 13/12/19.
//  Copyright © 2019 Divum. All rights reserved.
//
import Foundation
import UIKit
extension SearchBarContainerView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive) {
            return filtered.count
        }
        return nameList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NameTableViewCell.identifier, for: indexPath)
        guard let nameCell = cell as? NameTableViewCell else { return cell }
        if(searchActive) {
            nameCell.setupNameCell(filtered[indexPath.row])
        } else {
            nameCell.setupNameCell(nameList[indexPath.row])
        }
        return nameCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
