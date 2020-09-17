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
    
    lazy var leftItemImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    lazy var rightItemImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    let leftButton: WButton = {
        let view = WButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let rightButton: WButton = {
        let view = WButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self;
        presenter.setupAppearance()
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(leftItemImageView)
        view.addSubview(rightItemImageView)
        view.addSubview(leftButton)
        view.addSubview(rightButton)
        view.addSubview(nameLabel)
        
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
        
        leftButton.addTarget(presenter, action: #selector(presenter.leftItemSelected), for: .touchUpInside)
        rightButton.addTarget(presenter, action: #selector(presenter.rightItemSelected), for: .touchUpInside)
        
        setupConstraints()
        
        presenter.nameText { [weak self] (text) in
            self?.nameLabel.text = text
        }
    }
    
    func setupConstraints() {
        leftItemImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        leftItemImageView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        leftItemImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        
        rightItemImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        rightItemImageView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        rightItemImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        
        leftButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        leftButton.centerXAnchor.constraint(equalTo: leftItemImageView.centerXAnchor).isActive = true
        leftButton.heightAnchor.constraint(equalTo: leftButton.widthAnchor).isActive = true
        leftButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        rightButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        rightButton.centerXAnchor.constraint(equalTo: rightItemImageView.centerXAnchor).isActive = true
        rightButton.heightAnchor.constraint(equalTo: rightButton.widthAnchor).isActive = true
        rightButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
    }
    
    // MARK: DetailVotePresenterDelegate
    
    func shouldHighlight(_ item: DetailVotePresenter.Position) {
        switch item {
        case .left:
            return
        case .right:
            return
        case .none:
            return
        }
    }
}
