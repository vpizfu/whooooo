//
//  DetailVoteViewController.swift
//  whooooo
//
//  Created by Uladzislau Volchyk on 8/1/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import UIKit

class DetailVoteViewController: BaseViewController, DetailVotePresenterDelegate {

    let presenter: DetailVotePresenter!
    
    init(presenter: DetailVotePresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 254/255, green: 255/255, blue: 255/255, alpha: 1.0)
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
    
    lazy var leftItemImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 60
        return view
    }()
    
    lazy var rightItemImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 60
        return view
    }()
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
        //label.textColor = UIColor(red: 163/255, green: 164/255, blue: 165/255, alpha: 1.0)
        label.textAlignment = .left
        label.text = "Food category"
        return label
    }()
    
    lazy var numberOfVotesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
        label.textColor = UIColor(red: 163/255, green: 164/255, blue: 165/255, alpha: 1.0)
        label.textAlignment = .right
        
        return label
    }()
    
    lazy var vsLabel: UILabel = {
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 21.0)
           label.textColor = UIColor(red: 163/255, green: 164/255, blue: 165/255, alpha: 1.0)
           label.textAlignment = .center
           label.text = "VS"
           return label
    }()
    
    lazy var firstItemNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name:"HelveticaNeue", size: 16.0)
        //label.textColor = UIColor(red: 163/255, green: 164/255, blue: 165/255, alpha: 1.0)
        label.textAlignment = .center
        label.text = "Android"
        return label
    }()
    
    lazy var secondItemNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name:"HelveticaNeue", size: 16.0)
        //label.textColor = UIColor(red: 163/255, green: 164/255, blue: 165/255, alpha: 1.0)
        label.textAlignment = .center
        label.text = "iOS"
        return label
    }()
    
    lazy var separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 236/255, green: 237/255, blue: 238/255, alpha: 1.0)
        return view
    }()
    
    lazy var separatorView2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 236/255, green: 237/255, blue: 238/255, alpha: 1.0)
        return view
    }()
    
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name:"HelveticaNeue", size: 15.0)
        label.textColor = UIColor(red: 163/255, green: 164/255, blue: 165/255, alpha: 1.0)
        label.textAlignment = .center
        label.text = "03 August"
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name:"HelveticaNeue", size: 15.0)
        label.textColor = UIColor(red: 163/255, green: 164/255, blue: 165/255, alpha: 1.0)
        label.textAlignment = .center
        label.text = "18:00"
        return label
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.red
        label.textAlignment = .center
        label.text = "LIVE"
        return label
    }()
    
    
    lazy var separatorView3: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 236/255, green: 237/255, blue: 238/255, alpha: 1.0)
        return view
    }()
    
    lazy var leftItemButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "vote"), for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    lazy var rightItemButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "vote"), for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self;
        
        self.navigationItem.title = "Make a choice!"
                
        leftItemButton.tintColor = UIColor.black
        rightItemButton.tintColor = UIColor.black
        
        self.view.backgroundColor = UIColor(red: 236/255, green: 237/255, blue: 238/255, alpha: 1.0)
        self.view.addSubview(containerView)
        
        containerView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        containerView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        
        self.containerView.addSubview(categoryImageView)
        
        categoryImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        categoryImageView.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: 10).isActive = true
        categoryImageView.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 12).isActive = true
        categoryImageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        
        
        self.containerView.addSubview(categoryLabel)
        
        categoryLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        categoryLabel.leftAnchor.constraint(equalTo: self.categoryImageView.rightAnchor, constant: 10).isActive = true
        categoryLabel.centerYAnchor.constraint(equalTo: self.categoryImageView.centerYAnchor).isActive = true
        categoryLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        
        self.containerView.addSubview(numberOfVotesLabel)
        
        self.presenter.categoryName { (category) in
            self.categoryLabel.text = ("\(category) category")
            self.categoryImageView.image = UIImage(named: category)
        }
        
        
        numberOfVotesLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        numberOfVotesLabel.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -20).isActive = true
        numberOfVotesLabel.centerYAnchor.constraint(equalTo: self.categoryImageView.centerYAnchor).isActive = true
        numberOfVotesLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        
         self.containerView.addSubview(separatorView)
        
        
        separatorView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        separatorView.leftAnchor.constraint(equalTo: self.categoryImageView.leftAnchor).isActive = true
        separatorView.rightAnchor.constraint(equalTo: self.numberOfVotesLabel.rightAnchor).isActive = true
        separatorView.topAnchor.constraint(equalTo: self.categoryImageView.bottomAnchor, constant: 12).isActive = true
        
        self.containerView.addSubview(leftItemImageView)
        
        leftItemImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        leftItemImageView.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: 20).isActive = true
        leftItemImageView.topAnchor.constraint(equalTo: self.separatorView.bottomAnchor, constant: 12).isActive = true
        leftItemImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        
        self.containerView.addSubview(rightItemImageView)
        
        rightItemImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        rightItemImageView.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -20).isActive = true
        rightItemImageView.topAnchor.constraint(equalTo: self.separatorView.bottomAnchor, constant: 12).isActive = true
        rightItemImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        self.presenter.imageForPosition(.left) { (image) in
            DispatchQueue.main.async {
                self.leftItemImageView.image = UIImage(data: image)
            }
        }
        
        self.presenter.imageForPosition(.right) { (image) in
            DispatchQueue.main.async {
                self.rightItemImageView.image = UIImage(data: image)
            }
        }
        
         self.containerView.addSubview(vsLabel)
        
        
        vsLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        vsLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        vsLabel.centerYAnchor.constraint(equalTo: self.leftItemImageView.centerYAnchor).isActive = true
        vsLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        self.containerView.addSubview(firstItemNameLabel)
        self.containerView.addSubview(secondItemNameLabel)
        
        firstItemNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        firstItemNameLabel.rightAnchor.constraint(equalTo: self.leftItemImageView.rightAnchor).isActive = true
        firstItemNameLabel.topAnchor.constraint(equalTo: self.leftItemImageView.bottomAnchor, constant: 15).isActive = true
        firstItemNameLabel.leftAnchor.constraint(equalTo: self.leftItemImageView.leftAnchor).isActive = true
        
        self.presenter.leftItemName { (name) in
            self.firstItemNameLabel.text = name
        }
        
        secondItemNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        secondItemNameLabel.rightAnchor.constraint(equalTo: self.rightItemImageView.rightAnchor).isActive = true
        secondItemNameLabel.topAnchor.constraint(equalTo: self.rightItemImageView.bottomAnchor, constant: 15).isActive = true
        secondItemNameLabel.leftAnchor.constraint(equalTo: self.rightItemImageView.leftAnchor).isActive = true
        
        self.presenter.rightItemName { (name) in
            self.secondItemNameLabel.text = name
        }
        
         self.containerView.addSubview(separatorView2)
         //self.containerView.addSubview(separatorView3)
        
        separatorView2.heightAnchor.constraint(equalToConstant: 10).isActive = true
        separatorView2.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        separatorView2.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        separatorView2.topAnchor.constraint(equalTo: self.firstItemNameLabel.bottomAnchor, constant: 12).isActive = true
        
        
        self.containerView.addSubview(dateLabel)
        
        dateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        dateLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        dateLabel.topAnchor.constraint(equalTo: self.separatorView2.bottomAnchor, constant: 15).isActive = true
        
        
        self.presenter.dateToEnd { (date) in
            self.dateLabel.text = date
        }
        
        self.containerView.addSubview(timeLabel)
        
        timeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        timeLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        timeLabel.topAnchor.constraint(equalTo: self.dateLabel.bottomAnchor, constant: 5).isActive = true
        
        self.presenter.hoursToEnd { (time) in
            self.timeLabel.text = time
        }
        
        self.containerView.addSubview(statusLabel)
        
        statusLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        statusLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        statusLabel.topAnchor.constraint(equalTo: self.timeLabel.bottomAnchor, constant: 5).isActive = true
        
        self.presenter.dateForLiveLabel { (timestamp) in
            let timestampCurrent = Int(NSDate().timeIntervalSince1970)
            if (timestampCurrent >= timestamp) {
                self.statusLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
                self.statusLabel.backgroundColor = UIColor.black
                self.statusLabel.text = "Ended"
                self.leftItemButton.isEnabled = false
                self.rightItemButton.isEnabled = false
            } else {
                self.statusLabel.widthAnchor.constraint(equalToConstant: 45).isActive = true
            }
        }
        
        self.containerView.addSubview(separatorView3)
        
        separatorView3.heightAnchor.constraint(equalToConstant: 10).isActive = true
        separatorView3.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        separatorView3.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        separatorView3.topAnchor.constraint(equalTo: self.statusLabel.bottomAnchor, constant: 15).isActive = true
        
        self.containerView.addSubview(leftItemButton)
        self.containerView.addSubview(rightItemButton)
                
                
                
        //        rightItemButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        //        rightItemButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        //        rightItemButton.centerXAnchor.constraint(equalTo: self.rightItemImageView.centerXAnchor).isActive = true
        //        rightItemButton.centerYAnchor.constraint(equalTo: self.timeLabel.centerYAnchor).isActive = true
        //
        //
        //        leftItemButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        //        leftItemButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        //        leftItemButton.centerXAnchor.constraint(equalTo: self.leftItemImageView.centerXAnchor).isActive = true
        //        leftItemButton.centerYAnchor.constraint(equalTo: self.timeLabel.centerYAnchor).isActive = true
                
                
                
        
        rightItemButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        rightItemButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        rightItemButton.centerXAnchor.constraint(equalTo: self.rightItemImageView.centerXAnchor).isActive = true
        rightItemButton.topAnchor.constraint(equalTo: self.separatorView3.bottomAnchor, constant: 25).isActive = true


        leftItemButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        leftItemButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        leftItemButton.centerXAnchor.constraint(equalTo: self.leftItemImageView.centerXAnchor).isActive = true
        leftItemButton.topAnchor.constraint(equalTo: self.separatorView3.bottomAnchor, constant: 25).isActive = true
        
        presenter.firstItemSelected { [weak self] isSelected in
            self?.leftItemButton.tintColor = isSelected ? .green : .red
        }
        
        presenter.secondItemSelected { [weak self] isSelected in
            self?.rightItemButton.tintColor = isSelected ? .green : .red
        }
        
        presenter.totalVotesCount { [weak self] amount in
            self?.numberOfVotesLabel.text = "Total votes: \(amount)"
        }
        
                
    }
    
    @objc func buttonAction(_ sender: UIButton) {
        if (sender == leftItemButton) {
            if rightItemButton.tintColor == UIColor.green {
                return
            }
           presenter.leftItemSelected()
            leftItemButton.tintColor = UIColor.green
            rightItemButton.tintColor = UIColor.red
        } else if (sender == rightItemButton) {
            if leftItemButton.tintColor == UIColor.green {
                return
            }
            presenter.rightItemSelected()
            leftItemButton.tintColor = UIColor.red
            rightItemButton.tintColor = UIColor.green
        }
    }
    
}
