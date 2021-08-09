//
//  CharacterFilterItem.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 30/07/21.
//

import UIKit

struct CharacterFilterSection {
    let sectionName: String
    let items: [CharacterFilterItem]
}

struct CharacterFilterItem {
    let title: String
    let subTitle: String
    let isSelected: Bool
    let accessoryType: UITableViewCell.AccessoryType
}
