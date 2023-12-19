//
//  MyCollectionViewCell.swift
//  DiffableDataSource
//
//  Created by soi on 2023/12/19.
//

import UIKit

final class MyCollectionViewCell: UICollectionViewCell {
    static let id = String(describing: MyCollectionViewCell.self)
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = nil
    }
    
    func configure(title: String) {
        titleLabel.text = title
    }
}
