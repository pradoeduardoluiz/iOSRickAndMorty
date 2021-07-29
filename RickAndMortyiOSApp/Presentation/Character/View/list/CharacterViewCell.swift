//
//  CharacterViewCell.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 23/07/21.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

class CharacterViewCell: UICollectionViewCell {
    
    static let identifier = "CharacterViewCell"
    
    var title: String = "" { didSet { labelTitle.text = title } }
    
    var subTitle: String = "" { didSet { labelSubtitle.text = subTitle } }
    
    var imageUrl: URL? = nil { didSet { imageView.kf.setImage(with: imageUrl) } }
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.snp.makeConstraints { make in
            make.height.equalTo(140)
        }
        return imageView
    }()
    
    private var labelTitle: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .gray
        labelTitle.text = "Title"
        labelTitle.font = .systemFont(ofSize: 11, weight: .regular)
        labelTitle.numberOfLines = 0
        return labelTitle
    }()
    
    private var labelSubtitle: UILabel = {
        let labelSubtitle = UILabel()
        labelSubtitle.textColor = .black
        labelSubtitle.text = "Subtitle"
        labelSubtitle.numberOfLines = 0
        labelSubtitle.font = .systemFont(ofSize: 17, weight: .bold)
        return labelSubtitle
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        imageView.kf.cancelDownloadTask()
        title = ""
        subTitle = ""
        imageUrl = nil
    }
    
    func loadLayout() {
        layer.borderColor = UIColor(named: K.Colors.border)?.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
        clipsToBounds = true
        
        self.addSubview(imageView)
        self.addSubview(labelTitle)
        self.addSubview(labelSubtitle)
        
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        labelTitle.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(12)
            make.leading.equalTo(self).offset(16)
            make.trailing.equalTo(self).inset(16)
        }
        
        labelSubtitle.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom)
            make.leading.equalTo(self).offset(16)
            make.trailing.equalTo(self).inset(16)
        }
    }
}

