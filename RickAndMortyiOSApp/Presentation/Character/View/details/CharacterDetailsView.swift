//
//  CharacterDetailsView.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 27/07/21.
//

import UIKit
import SnapKit

class CharacterDetailsView: UIView {
    
    static let identifier = "CharacterDetailsIdentifierCell"
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            CharacterDetailsHeaderView.self,
            forHeaderFooterViewReuseIdentifier: CharacterDetailsHeaderView.identifier
        )
        tableView.register(
            CharacterDetailsSectionView.self,
            forHeaderFooterViewReuseIdentifier: CharacterDetailsSectionView.identifier
        )
        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: CharacterDetailsView.identifier
        )
        return tableView
    }()
    
    private var character: Character
    
    var sections: [CharacterDetailSection] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    init(character: Character) {
        self.character = character
        super.init(frame: .zero)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
        loadLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CharacterDetailsView {
    
    func loadLayout() {
        
        backgroundColor = .white
        
        addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
        
    }
    
}

extension CharacterDetailsView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if sections.isEmpty { return nil }
        
        switch section {
        case 0:
            guard let header = tableView.dequeueReusableHeaderFooterView(
                withIdentifier: CharacterDetailsHeaderView.identifier
            ) as? CharacterDetailsHeaderView else {
                return nil
            }
            header.status = character.status
            header.name = character.name
            header.species = character.species
            header.imageUrl = URL(string: character.image)
            return header
        case 1:
            guard let header = tableView.dequeueReusableHeaderFooterView(
                    withIdentifier: CharacterDetailsSectionView.identifier
            ) as? CharacterDetailsSectionView else {
                return nil
            }
            header.section = sections[section].sectionName
            header.isTopDividerHidden = true
            return header
        case 2:
            guard let header = tableView.dequeueReusableHeaderFooterView(
                    withIdentifier: CharacterDetailsSectionView.identifier
            ) as? CharacterDetailsSectionView else {
                return nil
            }
            header.isTopDividerHidden = false
            header.section = sections[section].sectionName
            return header
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 254
        case 1:
            return 55
        case 2:
            return 75
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 0
        case 1:
            return 60
        case 2:
            return 77
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
}

extension CharacterDetailsView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if sections.isEmpty { return 0 }
        
        switch section {
        case 1, 2:
            return sections[section].items.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 1, 2:
            let item = sections[indexPath.section].items[indexPath.row]
            return getCellFromItem(item: item)
        default:
            return UITableViewCell()
        }
        
    }
    
    private func getCellFromItem(item: CharacterDetailItem) -> UITableViewCell {
        let cell = CustomTableViewCell(style: .subtitle, reuseIdentifier: CharacterDetailsView.identifier)
        cell.title = item.title
        cell.subtitle = item.subTitle
        cell.detail = item.detail
        cell.accessoryType = item.accessoryType
        return cell
    }
    
}
