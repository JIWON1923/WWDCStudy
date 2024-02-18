//
//  Post.swift
//  NoticeBoard
//
//  Created by 이지원 on 2024/02/16.
//

import Foundation

struct Post: Hashable {
    let id: String
    let title: String
    let subTitle: String
    let content: String
    
    static func == (lhs: Post, rhs: Post) -> Bool {
        lhs.id == rhs.id
    }
    
    init(id: String) {
        self.id = id
        title = "\(id)번째 게시글 제목"
        subTitle = "\(id)번째 소제목"
        content = "\(id)번째 글 내용"
    }
}
