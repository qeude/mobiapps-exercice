//
//  CategoryCell.swift
//  mobiapps-exercice
//
//  Created by Quentin Eude on 18/05/2019.
//  Copyright © 2019 Quentin Eude. All rights reserved.
//

import UIKit
import Kingfisher

class CategoryCell : UITableViewCell {
    
    var category : Category? {
        didSet{
            let url = URL(string: category!.iconUrl)
            categoryImage.kf.setImage(with: url, options: [.transition(.fade(0.5))])
            categoryNameLabel.text = category?.name
        }
    }
    
    private let categoryNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private let categoryImage : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(categoryImage)
        addSubview(categoryNameLabel)
        
        categoryImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 90, height: 0, enableInsets: false)
        categoryNameLabel.anchor(top: topAnchor, left: categoryImage.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
