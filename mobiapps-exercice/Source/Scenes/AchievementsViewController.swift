//
//  AchievementsViewController.swift
//  mobiapps-exercice
//
//  Created by Quentin Eude on 19/05/2019.
//  Copyright © 2019 Quentin Eude. All rights reserved.
//

import UIKit

class AchievementsViewController : UITableViewController {
    let cellReuseId = "cellId"
    var selectedCategory : Category? = nil
    private var achievements : [Achievement] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Fetching achievement for the given category
        APIService.getAchievementsByCategory(category: self.selectedCategory!){result in
            switch result{
            case .success(let achievements):
                self.achievements = achievements
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
        navigationItem.title = self.selectedCategory?.name
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseId)

        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.achievements.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath)
        cell.textLabel?.text = self.achievements[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let achievementDetailsViewController = AchievementDetailsViewController()
        achievementDetailsViewController.selectedAchievement = self.achievements[indexPath.row]
        navigationController?.pushViewController(achievementDetailsViewController, animated: true)
    }
}
