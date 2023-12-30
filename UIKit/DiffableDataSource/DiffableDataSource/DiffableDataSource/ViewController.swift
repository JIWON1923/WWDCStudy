//
//  ViewController.swift
//  DiffableDataSource
//
//  Created by soi on 2023/12/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var data: [Int] = Array(1...5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTappedAddButton(_ sender: UIButton) {
        var value: Int
        if let item = data.last {
            value = item + 1
        } else {
            value = 1
        }
        data.append(value)
        collectionView.reloadData()
    }
    
    @IBAction func didTappedDeleteButton(_ sender: UIButton) {
        guard !data.isEmpty else { return }
        let randomIndex = Int.random(in: 0 ..< data.count)
        data.remove(at: randomIndex)
        collectionView.reloadData()

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
