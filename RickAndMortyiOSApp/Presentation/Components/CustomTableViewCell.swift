//
//  CustomUITableViewCell.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 30/07/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    
    private lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    
    private lazy var labelSubtitle: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private lazy var labelDetail: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 11, weight: .semibold)
        return label
    }()
    
    private lazy var verticalStack: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        return stackView
    }()
    
    var title: String? = nil { didSet { labelTitle.text = title } }
    
    var subtitle: String? = nil { didSet { labelSubtitle.text = subtitle } }
    
    var detail: String? = nil { didSet {
        if (detail != nil){
            labelDetail.isHidden = false
            labelDetail.text = detail?.uppercased()
        } else {
            labelDetail.isHidden = true
        }
    } }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        loadLayout()
    }
    
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CustomTableViewCell {
    
    func loadLayout() {
        addSubview(verticalStack)
        verticalStack.addArrangedSubview(labelTitle)
        verticalStack.addArrangedSubview(labelSubtitle)
        verticalStack.addArrangedSubview(labelDetail)
        
        verticalStack.snp.makeConstraints { make in
            make.leading.equalTo(self.contentView).offset(16)
            make.top.equalTo(self.contentView).offset(10)
            make.trailing.equalTo(self.contentView).offset(16)
        }
    }
    
}
