//
//  ViewController.swift
//  DiffableDataSource
//
//  Created by soi on 2023/12/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var data: [Int] = Array(1...10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.id, for: indexPath) as? MyCollectionViewCell else { fatalError("not found \(MyCollectionViewCell.id)") }
        cell.configure(title: String("\(data[indexPath.row])번 째"))
        
        return cell
    }
}
