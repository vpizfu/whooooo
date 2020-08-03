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
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 254/255, green: 255/255, blue: 255/255, alpha: 1.0)
        return view
    }()
    
    lazy var separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 236/255, green: 237/255, blue: 238/255, alpha: 1.0)
        return view
    }()
    
    lazy var leftImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 22
        return view
    }()
    
    lazy var rightImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 22
        return view
    }()
    
    lazy var categoryImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 8
        view.image = UIImage(named: "water")
        return view
    }()
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name:"HelveticaNeue", size: 15.0)
        label.textColor = UIColor(red: 163/255, green: 164/255, blue: 165/255, alpha: 1.0)
        label.textAlignment = .left
        label.text = "Food Category"
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name:"HelveticaNeue", size: 15.0)
        label.textColor = UIColor(red: 163/255, green: 164/255, blue: 165/255, alpha: 1.0)
        label.textAlignment = .right
        label.text = "Until end 02:07:53"
        return label
    }()
    
    lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name:"AmericanTypewriter-Bold", size: 21.0)
        label.textAlignment = .center
        label.textColor = UIColor(red: 10/255, green: 11/255, blue: 11/255, alpha: 1.0)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
    
        
        self.contentView.backgroundColor = UIColor(red: 236/255, green: 237/255, blue: 238/255, alpha: 1.0)
        self.contentView.addSubview(containerView)
        
        containerView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5).isActive = true
        containerView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
        
        self.containerView.addSubview(leftImageView)
        self.containerView.addSubview(rightImageView)
        self.containerView.addSubview(mainLabel)
        self.containerView.addSubview(separatorView)
        self.containerView.addSubview(categoryImageView)
        self.containerView.addSubview(categoryLabel)
        self.containerView.addSubview(timeLabel)
        
        leftImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        leftImageView.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: 20).isActive = true
        leftImageView.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 14).isActive = true
        leftImageView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        
        rightImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        rightImageView.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -20).isActive = true
        rightImageView.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 14).isActive = true
        rightImageView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        
        mainLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        mainLabel.leftAnchor.constraint(equalTo: self.leftImageView.rightAnchor, constant: 20).isActive = true
        mainLabel.rightAnchor.constraint(equalTo: self.rightImageView.leftAnchor, constant: -20).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: self.rightImageView.centerYAnchor).isActive = true
        
        separatorView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        separatorView.leftAnchor.constraint(equalTo: self.leftImageView.leftAnchor).isActive = true
        separatorView.rightAnchor.constraint(equalTo: self.rightImageView.rightAnchor).isActive = true
        separatorView.topAnchor.constraint(equalTo: self.rightImageView.bottomAnchor, constant: 12).isActive = true
        
        categoryImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        categoryImageView.leftAnchor.constraint(equalTo: self.leftImageView.leftAnchor).isActive = true
        categoryImageView.topAnchor.constraint(equalTo: self.separatorView.topAnchor, constant: 12).isActive = true
        categoryImageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        
        categoryLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        categoryLabel.leftAnchor.constraint(equalTo: self.categoryImageView.rightAnchor, constant: 10).isActive = true
        categoryLabel.centerYAnchor.constraint(equalTo: self.categoryImageView.centerYAnchor).isActive = true
        categoryLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        timeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        timeLabel.rightAnchor.constraint(equalTo: self.rightImageView.rightAnchor).isActive = true
        timeLabel.centerYAnchor.constraint(equalTo: self.categoryImageView.centerYAnchor).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: 190).isActive = true
    }
    
}
