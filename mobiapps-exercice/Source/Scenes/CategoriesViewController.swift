//
//  GroupsViewController.swift
//  mobiapps-exercice
//
//  Created by Quentin Eude on 18/05/2019.
//  Copyright © 2019 Quentin Eude. All rights reserved.
//

import UIKit

class CategoriesViewController : UITableViewController{
    let cellReuseId = "cellReuseId"
    private var groups : [Group] = []
    private var categories : [[Category]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let dispatchGroup = DispatchGroup()
        APIService.getAllGroups{ result in
            switch result{
            case .success(let groups):
                self.groups = groups
                for (idx,group) in groups.enumerated(){
                    dispatchGroup.enter()
                    APIService.getCategoriesByGroup(group: group){
                        res in
                        switch res{
                        case .success(let categories):
                            self.categories.insert(categories, at: idx)
                            dispatchGroup.leave()
                        case .failure(let err):
                            print(err)
                        }
                    }
                }
                dispatchGroup.notify(queue: .main){
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
        
        navigationItem.title = "Categories"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(CategoryCell.self, forCellReuseIdentifier: cellReuseId)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width:20, height: 20))
        view.backgroundColor = UIColor.lightGray
        let label = UILabel(frame: CGRect(x: 20, y: 10, width: tableView.frame.width, height: 20))
        label.text = groups[section].name
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.sizeToFit()
        view.addSubview(label)
        return view
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return groups.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as! CategoryCell
        
        let category = categories[indexPath.section][indexPath.row]
        cell.category = category
        return cell
    }
}
