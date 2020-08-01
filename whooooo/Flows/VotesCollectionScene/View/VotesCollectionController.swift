//
//  VotesCollectionController.swift
//  whooooo
//
//  Created by Uladzislau Volchyk on 8/1/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import UIKit
import Firebase

class VotesCollectionController: BaseViewController {

    var presenter: VotesCollectionPresenter!
    
    init(presenter: VotesCollectionPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    override func loadView() {
        view = collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(VotesCollectionCell.self, forCellWithReuseIdentifier: VotesCollectionCell.reuseIdentifier)
        collectionView.backgroundColor = .white
        self.presenter.askData()
        self.presenter.delegate = self
        
    }
    
}

extension VotesCollectionController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter.numberOfElements()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: VotesCollectionCell.reuseIdentifier, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let label = UILabel(frame: cell.bounds)
        label.text = self.presenter.modelAtIndex(indexPath.item).name
        cell.contentView.backgroundColor = .red
        cell.contentView.addSubview(label)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 130)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter.didSelectItemAtIndex(indexPath.item)
    }
    
}

extension VotesCollectionController: VotesCollectionPresenterDelegate {
    func presenterDidUpdateData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
