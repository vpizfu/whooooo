//
//  VotesCollectionCell.swift
//  whooooo
//
//  Created by Uladzislau Volchyk on 8/1/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import UIKit

class VotesCollectionCell: UICollectionViewCell {
    
    static let reuseIdentifier: String = "VotesCollectionCell"
    
    lazy var leftImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    lazy var rightImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        self.contentView.addSubview(leftImageView)
        self.contentView.addSubview(rightImageView)
        
        leftImageView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor).isActive = true
        leftImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        leftImageView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.5).isActive = true
        
        rightImageView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor).isActive = true
        rightImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        rightImageView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.5).isActive = true
        
        
    }
    
}
