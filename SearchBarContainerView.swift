//
//  SearchBarContainerView.swift
//  SampleSearchBar
//
//  Created by Divum on 13/12/19.
//  Copyright © 2019 Divum. All rights reserved.
//
import UIKit
class SearchBarContainerView: UIView {
    static let identifier = String(describing: SearchBarContainerView.self)
    var nameList = ["Pranesh", "Dharani", "Vijay", "Dhoni", "Mysterio", "Orton", "Vikram", "Guru", "Navin", "Gogulan"]
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var filtered: [String] = []
    var searchActive : Bool = false
    let searchController = UISearchController(searchResultsController: nil)
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        Bundle.main.loadNibNamed(SearchBarContainerView.identifier, owner: self, options: nil)
        setupContainerView()
        setupTableView()
    }

    private func setupContainerView() {
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func setupSearchBarContainerView() {
        searchBar.delegate = self
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: NameTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: NameTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SearchBarContainerView: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
           searchActive = true;
       }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
           searchActive = false;
       }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
           searchActive = false;
       }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
           searchActive = false;
       }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
           filtered = nameList.filter({ (text) -> Bool in
            let tmp: NSString = text as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
               return range.location != NSNotFound
           })
           if(filtered.count == 0){
               searchActive = false;
           } else {
               searchActive = true;
           }
           reloadTableView()
       }
}
