//
//  CharacterDetailsItem.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 28/07/21.
//

import UIKit

struct CharacterDetailSection {
    let sectionName: String
    let items: [CharacterDetailItem]
}

struct CharacterDetailItem {
    let title: String
    let subTitle: String
    let detail: String?
    let accessoryType: UITableViewCell.AccessoryType
}

