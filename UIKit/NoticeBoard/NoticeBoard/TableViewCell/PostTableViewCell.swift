//
//  PostTableViewCell.swift
//  NoticeBoard
//
//  Created by 이지원 on 2024/02/16.
//

import UIKit

final class PostTableViewCell: UITableViewCell {
    static let id = String(describing: PostTableViewCell.self)
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        subTitleLabel.text = nil
    }
    
    func configure(with post: Post) {
        titleLabel.text = post.title
        subTitleLabel.text = post.subTitle
    }
}
