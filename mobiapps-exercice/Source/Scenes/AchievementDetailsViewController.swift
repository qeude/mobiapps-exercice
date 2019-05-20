//
//  AchievementDetailsViewController.swift
//  mobiapps-exercice
//
//  Created by Quentin Eude on 19/05/2019.
//  Copyright © 2019 Quentin Eude. All rights reserved.
//

import UIKit

class AchievementDetailsViewController : UIViewController {
    var selectedAchievement : Achievement? = nil
    var scrollView : UIScrollView!
    var descriptionLabel: UILabel!
    var descriptionContentLabel : UILabel!
    var requirementLabel : UILabel!
    var requirementContentLabel : UILabel!
    
    override func viewDidLoad() {
        let frame = self.view.frame
        // Create scrollview
        scrollView = UIScrollView()
        self.view.addSubview(scrollView)
        scrollView.isDirectionalLockEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        
        // ScrollView constraints
        scrollView.anchor(top: safeArea.topAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: frame.width, height: 0, enableInsets: false)
        scrollView.backgroundColor = .white
        
        // Description label
        descriptionLabel = UILabel()
        descriptionLabel.text = "Description"
        descriptionLabel.font = UIFont.boldSystemFont(ofSize: 24)
        scrollView.addSubview(descriptionLabel)
        descriptionLabel.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 20, enableInsets: false)
        
        // Description content label
        descriptionContentLabel = UILabel()
        descriptionContentLabel.text = (self.selectedAchievement?.description.isEmpty ?? true ? "No description." : self.selectedAchievement?.description)
        descriptionContentLabel.lineBreakMode = .byWordWrapping
        descriptionContentLabel.numberOfLines = 0
        scrollView.addSubview(descriptionContentLabel)
        descriptionContentLabel.anchor(top: descriptionLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: frame.width - 20, height: 0, enableInsets: false)
        
        // Requirements label
        requirementLabel = UILabel()
        requirementLabel.text = "Requirements"
        requirementLabel.font = UIFont.boldSystemFont(ofSize: 24)
        scrollView.addSubview(requirementLabel)
        requirementLabel.anchor(top: descriptionContentLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 20, enableInsets: false)

        // Requirements content label
        requirementContentLabel = UILabel()
        requirementContentLabel.text = (self.selectedAchievement?.requirement.isEmpty ?? true ? "No requirements." : self.selectedAchievement?.requirement)
        requirementContentLabel.lineBreakMode = .byWordWrapping
        requirementContentLabel.numberOfLines = 0
        scrollView.addSubview(requirementContentLabel)
        requirementContentLabel.anchor(top: requirementLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: frame.width - 20, height: 0, enableInsets: false)

        navigationItem.title = self.selectedAchievement?.name
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
