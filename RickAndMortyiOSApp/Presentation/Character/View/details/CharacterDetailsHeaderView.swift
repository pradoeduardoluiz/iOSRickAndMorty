//
//  CharacterDetailsHeaderView.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 28/07/21.
//

import UIKit
import SnapKit

class CharacterDetailsHeaderView: UITableViewHeaderFooterView {
    
    static let identifier = "CharacterDetailsHeader"

    private lazy var headerImage: UIImageView = {
        guard let image = UIImage(named: K.Image.headerDetails) else { return UIImageView()}
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var characterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 65
        imageView.snp.makeConstraints { make in
            make.height.equalTo(130)
            make.width.equalTo(130)
        }
        return imageView
    }()
    
    private lazy var labelStatus: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "Status"
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var labelName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Name"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 28, weight: .bold)
        return label
    }()
    
    private lazy var labelSpecies: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.text = "Specie"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    
    var status: String? = nil { didSet { labelStatus.text = status } }
    var imageUrl: URL? = nil { didSet { characterImage.kf.setImage(with: imageUrl) } }
    var name: String? = nil { didSet { labelName.text = name } }
    var species: String? = nil { didSet { labelSpecies.text = species } }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        loadLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CharacterDetailsHeaderView {
    
    func loadLayout() {
        
        contentView.backgroundColor = .white
        contentView.addSubview(headerImage)
        contentView.addSubview(characterImage)
        contentView.addSubview(labelStatus)
        contentView.addSubview(labelName)
        contentView.addSubview(labelSpecies)
            
        headerImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        characterImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(20)
        }
        
        labelStatus.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(characterImage.snp.bottom).offset(20)
        }
        
        labelName.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(labelStatus.snp.bottom)
        }
        
        labelSpecies.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(labelName.snp.bottom)
        }
        
    }
    
}
