//
//  CharacterDetailsSectionView.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 29/07/21.
//

import UIKit
import SnapKit

class CharacterDetailsSectionView: UITableViewHeaderFooterView {
    
    static let identifier = "CharacterDetailsSection"
    
    private lazy var labelSection: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 29, weight: .bold)
        return label
    }()
    
    private lazy var topDividerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: K.Colors.stackBorder)
        return view
    }()
    
    private lazy var bottomDividerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: K.Colors.stackBorder)
        return view
    }()
    
    var section: String? = nil { didSet { labelSection.text = section } }
    
    var isTopDividerHidden: Bool = false { didSet { topDividerView.isHidden = isTopDividerHidden } }
    
    var isBottomDividerHidden: Bool = false { didSet { bottomDividerView.isHidden = isBottomDividerHidden } }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        loadLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CharacterDetailsSectionView {
    
    func loadLayout() {
        contentView.backgroundColor = .white
        contentView.addSubview(topDividerView)
        contentView.addSubview(labelSection)
        contentView.addSubview(bottomDividerView)
        
        contentView.topBorder(width: 1, borderColor: .black)
        contentView.bottomBorder(width: 1, borderColor: .black)
        
        topDividerView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(contentView.snp.top)
            make.leading.trailing.equalToSuperview()
        }
        
        labelSection.snp.makeConstraints { make in
            make.top.equalTo(topDividerView.snp.bottom)
            make.centerY.equalToSuperview()
            make.leading.equalTo(contentView.snp.leading).inset(16)
            make.trailing.equalTo(contentView.snp.trailing)
        }
        
        bottomDividerView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.bottom.equalTo(contentView.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
    }
    
}
