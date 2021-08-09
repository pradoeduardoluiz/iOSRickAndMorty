//
//  CharacterFilterView.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 30/07/21.
//

//import UIKit
//import SnapKit
//
//class CharacterFilterView: UIView {
//    
//    static cellIdentifier = "CharacterFilterIdentifier"
//    
//    private lazy var tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.register(CharacterFilterView.self, forCellReuseIdentifier: CharacterFilterView.cellIdentifier)
//        return tableView
//    }()
//    
//    private let sections: [CharacterFilterSection] = {
//        var sections: [CharacterFilterSection] = []
//        sections.append(
//            CharacterFilterSection(
//                sectionName: "",
//                items: [
//                    CharacterFilterItem(
//                        title: "Name",
//                        subTitle: "Give a name",
//                        isSelected: false,
//                        accessoryType: .disclosureIndicator)
//                ]
//            )
//        )
//        
//        sections.append(
//            CharacterFilterSection(
//                sectionName: "",
//                items: [
//                    CharacterFilterItem(
//                        title: "Species",
//                        subTitle: "Select one",
//                        isSelected: false,
//                        accessoryType: .disclosureIndicator)
//                ]
//            )
//        )
//        
//        sections.append(
//            CharacterFilterSection(
//                sectionName: "Status",
//                items: [
//                    CharacterFilterItem(
//                        title: "Alive",
//                        subTitle: "",
//                        isSelected: false,
//                        accessoryType: .disclosureIndicator),
//                    CharacterFilterItem(
//                        title: "Dead",
//                        subTitle: "",
//                        isSelected: false,
//                        accessoryType: .disclosureIndicator),
//                    CharacterFilterItem(
//                        title: "Unknown",
//                        subTitle: "",
//                        isSelected: false,
//                        accessoryType: .disclosureIndicator)
//                ]
//            )
//        )
//        
//        sections.append(
//            CharacterFilterSection(
//                sectionName: "Gender",
//                items: [
//                    CharacterFilterItem(
//                        title: "Female",
//                        subTitle: "",
//                        isSelected: false,
//                        accessoryType: .disclosureIndicator),
//                    CharacterFilterItem(
//                        title: "Male",
//                        subTitle: "",
//                        isSelected: false,
//                        accessoryType: .disclosureIndicator),
//                    CharacterFilterItem(
//                        title: "Genderless",
//                        subTitle: "",
//                        isSelected: false,
//                        accessoryType: .disclosureIndicator),
//                    CharacterFilterItem(
//                        title: "Unknown",
//                        subTitle: "",
//                        isSelected: false,
//                        accessoryType: .disclosureIndicator)
//                ]
//            )
//        )
//        
//        return sections
//    }()
//    
//    init() {
//        super.init(frame: .zero)
//        
//        loadLayout()
//    }
//    
//    @available(*, unavailable)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//}
//
//extension CharacterFilterView {
//    
//    func loadLayout(){
//        addSubview(tableView)
//        
//        tableView.snp.makeConstraints { make in
//            make.top.leading.trailing.bottom.equalToSuperview()
//        }
//        
//    }
//    
//}
//
//extension CharacterFilterView: UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return sections[section].items.count
//    }
//    
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let item = sections[indexPath.section].items[indexPath.row]
//    
//        switch indexPath.section {
//        case 0:
//            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellIndetifier")
//            cell.textLabel?.text = item.title
//            cell.textLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
//            cell.detailTextLabel?.text = item.subTitle
//            cell.detailTextLabel?.font = .systemFont(ofSize: 15, weight: .regular)
//            cell.detailTextLabel?.textColor = .systemGray
//            cell.accessoryType = item.accessoryType
//            return cell
//        default:
//            return UITableViewCell()
//        }
//    }
//    
//}
//
//extension CharacterFilterView: UITableViewDelegate {
//    
//}
