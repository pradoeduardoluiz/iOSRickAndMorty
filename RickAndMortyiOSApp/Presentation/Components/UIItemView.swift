//
//  UIItemView.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 27/07/21.
//

import UIKit
import SnapKit

class UIItemView: UIView {
    
    // MARK: - Components
    private lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Title"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    private lazy var labelSubTitle: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.text = "Subtitle"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private lazy var labelDescription: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.text = "Description"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 11, weight: .regular)
        return label
    }()
    
    private lazy var dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: K.Colors.stackBorder)
        view.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        guard let image = UIImage(named: K.Icons.arrowRight) else { return UIImageView()}
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.snp.makeConstraints { make in
            make.height.equalTo(22)
            make.width.equalTo(13)
        }
        return imageView
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    // MARK: - Properties
    
    var title: String? = nil { didSet { labelTitle.text = title } }
    
    var subTitle: String? = nil { didSet { labelSubTitle.text = subTitle } }
    
    var desc: String? = nil { didSet { labelDescription.text = desc } }
    
    var isHiddenDivider: Bool = false { didSet {dividerView.isHidden = isHiddenDivider } }
    
    var isHiddenDiscription: Bool = false { didSet {labelDescription.isHidden = isHiddenDiscription } }
    
    init() {
        super.init(frame: .zero)
        
        loadLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UIItemView {
    
    func loadLayout() {
        
        self.snp.makeConstraints { make in
            make.height.equalTo(77)
        }
        
        addSubview(horizontalStackView)
        addSubview(dividerView)
        
        horizontalStackView.addArrangedSubview(verticalStackView)
        horizontalStackView.addArrangedSubview(imageView)
        
        verticalStackView.addArrangedSubview(labelTitle)
        verticalStackView.addArrangedSubview(labelSubTitle)
        verticalStackView.addArrangedSubview(labelDescription)
        
        horizontalStackView.snp.makeConstraints { make in
            make.top.leading.bottom.equalTo(safeAreaLayoutGuide)
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-16)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.leading.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.leading.equalTo(verticalStackView.snp.trailing)
            make.trailing.equalTo(horizontalStackView.snp.trailing)
        }

        labelTitle.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
        
        labelSubTitle.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        
        labelDescription.snp.makeConstraints { make in
            make.top.equalTo(labelSubTitle.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        
        dividerView.snp.makeConstraints { make in
            make.top.equalTo(horizontalStackView.snp.bottom)
            make.leading.trailing.equalTo(safeAreaLayoutGuide)
        }
    }
    
}
