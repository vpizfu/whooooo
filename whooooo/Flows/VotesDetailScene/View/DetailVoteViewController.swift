//
//  DetailVoteViewController.swift
//  whooooo
//
//  Created by Uladzislau Volchyk on 8/1/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import UIKit

class DetailVoteViewController: BaseViewController {

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
    
    // MARK: implement UI
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(leftItemImageView)
        view.addSubview(rightItemImageView)
        
        leftItemImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        leftItemImageView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        leftItemImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        leftItemImageView.trailingAnchor.constraint(equalTo: rightItemImageView.leadingAnchor).isActive = true
        
        rightItemImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        rightItemImageView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        rightItemImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        
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
    }
}
