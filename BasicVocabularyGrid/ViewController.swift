//
//  ViewController.swift
//  BasicVocabularyGrid
//
//  Created by Kateryna on 12/01/2025.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables
    let words = ["apple", "banana", "TV", "GitHub", "orange", "apple", "banana", "TV", "GitHub", "orange"]
    
    // MARK: - UI Components
    let collectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
        return collectionView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    func setUI() {
        self.view.backgroundColor = .orange
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.collectionView)
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
}

//MARK: - Datasourse and Delegate
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return words.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            fatalError("Failed to dequeue reusable cell in ViewController")
        }
        let word = words[indexPath.item]
        cell.configure(with: word)
        cell.backgroundColor = .orange
        cell.layer.cornerRadius = 7
        return cell
    }
}

//MARK: - Flow Layout
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (self.view.frame.width - 10) / 2
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
}

