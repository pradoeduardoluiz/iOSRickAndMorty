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
    private var informationsItems: [CharacterDetailItem] = []
    private var episodesItems: [CharacterDetailItem] = []
    private let sections: [String] = ["", "Informations", "Episodes"]
    
    var episodes: [Episode] = [] {
        didSet {
            episodesItems = episodes.map({ episode in
                CharacterDetailItem(
                    title: episode.episode,
                    subTitle: episode.name,
                    accessoryType: .disclosureIndicator
                )
            })
            tableView.reloadData()
        }
    }
    
    init(character: Character) {
        self.character = character
        super.init(frame: .zero)
        
        loadData(character: character)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
        loadLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadData(character: Character) {
        
        informationsItems.append(
            CharacterDetailItem(title: "Gender", subTitle: character.gender, accessoryType: .none)
        )
        informationsItems.append(
            CharacterDetailItem(title: "Origin", subTitle: character.origin.name, accessoryType: .none)
        )
        informationsItems.append(
            CharacterDetailItem(title: "Type", subTitle: character.type, accessoryType: .none)
        )
        informationsItems.append(
            CharacterDetailItem(title: "Location", subTitle: character.location.name, accessoryType: .disclosureIndicator)
        )
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
            header.section = sections[section]
            header.isTopDividerHidden = true
            return header
        case 2:
            guard let header = tableView.dequeueReusableHeaderFooterView(
                    withIdentifier: CharacterDetailsSectionView.identifier
            ) as? CharacterDetailsSectionView else {
                return nil
            }
            header.isTopDividerHidden = false
            header.section = sections[section]
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
}

extension CharacterDetailsView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1:
            return informationsItems.count
        case 2:
            return episodesItems.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 1:
            let item = informationsItems[indexPath.row]
            return getCellFromItem(item: item)
        case 2:
            let item = episodesItems[indexPath.row]
            return getCellFromItem(item: item)
        default:
            return UITableViewCell()
        }
        
    }
    
    private func getCellFromItem(item: CharacterDetailItem) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: CharacterDetailsView.identifier)
        cell.textLabel?.text = item.title
        cell.textLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        cell.detailTextLabel?.text = item.subTitle
        cell.detailTextLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        cell.detailTextLabel?.textColor = .systemGray
        cell.accessoryType = item.accessoryType
        return cell
    }
    
}
