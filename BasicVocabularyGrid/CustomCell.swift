//
//  CustomCell.swift
//  BasicVocabularyGrid
//
//  Created by Kateryna on 12/01/2025.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    static let identifier = "CustomCell"
    
    private let textLabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.textColor = .white
        return lbl
    }()
    
    public func configure(with text: String) {
        textLabel.text = text
        setUI()
    }
    
    private func setUI() {
        self.contentView.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.textLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.textLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.textLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.textLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        ])
    }
}
