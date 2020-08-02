//
//  WButton.swift
//  whooooo
//
//  Created by Uladzislau Volchyk on 8/1/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import UIKit

class WButton: UIButton {

    var cornerRadius: CGFloat {
        self.bounds.height / 2
    }
    
    var selectionColor: UIColor {
        return UIColor.red.withAlphaComponent(0.5)
    }
    
    var titleText: String? {
        didSet {
            self.setTitle(titleText, for: .normal)
            self.setTitleColor(UIColor.black,for: .normal)
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? selectionColor : .clear
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    func setup() {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2.0
    }

}
