//
//  CharacterView.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 21/07/21.
//

import Foundation
import UIKit
import SnapKit

class CharacterView: UIView {
    
    var characters: [Character] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var isLoadingCharacters: Bool = false
    
    var loadMoreData: () -> Void = {}
    
    var didSelectItem: (Character) -> Void = {_ in }
    
    private lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.itemSize = CGSize(width: 163, height: 219)
        
        let collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(CharacterViewCell.self, forCellWithReuseIdentifier: CharacterViewCell.identifier)
        
        return collectionView
    }()
    
    init() {
        super.init(frame: .zero)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        layoutLoad()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CharacterView {
    
    func layoutLoad() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
        }
    }
    
    func bindView() {  
        
    }
    
}

extension CharacterView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let character = characters[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterViewCell.identifier, for: indexPath) as? CharacterViewCell else {
            return UICollectionViewCell()
        }
        cell.title = character.status
        cell.subTitle = character.name
        cell.imageUrl = URL(string: character.image)
        return cell
    }
    
    func collectionView(_ collection: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowLayout?.minimumInteritemSpacing ?? 0.0) + (flowLayout?.sectionInset.left ?? 0.0) + (flowLayout?.sectionInset.right ?? 0.0)
        let size: CGFloat = (self.collectionView.frame.size.width - space) / 2.0
        return CGSize(width: size, height: 219)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectItem(characters[indexPath.row])
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if (offsetY > contentHeight - scrollView.frame.height) && !isLoadingCharacters {
            self.loadMoreData()
        }
    }
    
}

