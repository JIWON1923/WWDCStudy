//
//  ViewController.swift
//  NoticeBoard
//
//  Created by 이지원 on 2024/02/16.
//

import UIKit

final class ViewController: UIViewController {
    private lazy var dataSource = getDataSource()
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applySnapshot(with: getPosts())
    }
    
    private func getDataSource() -> UITableViewDiffableDataSource<Section, Post> {
        UITableViewDiffableDataSource(tableView: tableView) { tableView, indexPath, itemIdentifier in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath) as? PostTableViewCell else { fatalError("not founc cell class") }
            cell.configure(with: itemIdentifier)
            
            return cell
        }
    }
    
    private func applySnapshot(with items: [Post], to section: Section) {
        var snapshot = dataSource.snapshot()
        
        if snapshot.sectionIdentifiers.isEmpty {
            snapshot.appendSections(Section.allCases)
        }
        
        if !snapshot.sectionIdentifiers.contains(section) {
            snapshot.appendSections([section])
        }
        
        snapshot.appendItems(items, toSection: section)
        dataSource.apply(snapshot)
    }
    
    private func getPosts() -> [Post] {
        (1...10).map { Post(id: String($0))}
    }
    
    enum Section: Hashable, CaseIterable {
        case notice, normal
    }
}

