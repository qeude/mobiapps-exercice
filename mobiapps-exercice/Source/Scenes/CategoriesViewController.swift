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
    private var categories : [String : [Category]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Creating a "DispatchGroup" to know when all categories are fetch for each group
        let dispatchGroup = DispatchGroup()
        // Fetching groups
        APIService.getAllGroups{ result in
            switch result{
            case .success(let groups):
                self.groups = groups
                // Fetching categories foreach group
                for group in groups{
                    dispatchGroup.enter()
                    APIService.getCategoriesByGroup(group: group){
                        res in
                        switch res{
                        case .success(let categories):
                            // Insert categories list with a key equal to related group identifier
                            self.categories[group.identifier] = categories
                            dispatchGroup.leave()
                        case .failure(let err):
                            print(err)
                        }
                    }
                }
//                  self.tableView.reloadData()
                // When all requests for categories ended
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
        view.backgroundColor = UIColor(red:0.94, green:0.94, blue:0.94, alpha:1.0)
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
        return categories[groups[section].identifier]?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as! CategoryCell
        guard let category = categories[groups[indexPath.section].identifier]?[indexPath.row] else {return cell}
        cell.category = category
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let achievementsViewController = AchievementsViewController()
        achievementsViewController.selectedCategory = categories[groups[indexPath.section].identifier]?[indexPath.row]
        navigationController?.pushViewController(achievementsViewController, animated: true)        
    }
}
