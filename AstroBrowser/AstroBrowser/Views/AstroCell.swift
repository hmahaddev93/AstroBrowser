//
//  AstroCell.swift
//  AstroBrowser
//
//  Created by Khateeb H. on 12/3/21.
//

import UIKit

class AstroCell: UICollectionViewCell {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let insetBounds = bounds.inset(by: CommonInsets)
        titleLabel.frame = insetBounds
    }
}
