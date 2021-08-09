//
//  TabBarViewControllerTableViewController.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 26/07/21.
//

import UIKit

class TabBarViewController: UITabBarController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = UIColor(named: K.Colors.navigation)
        
        let characterVC = CharacterViewController()
        let locationVC = LocationViewController()
        let episodeVC = EpisodeViewController()
        
        let characterItem = UITabBarItem()
        characterItem.title = K.TabBarItem.character
        characterItem.image = UIImage(named: K.Icons.character)
        characterItem.selectedImage = UIImage(named: K.Icons.characterSelected)
        characterVC.tabBarItem = characterItem
        
        let locationItem = UITabBarItem()
        locationItem.title = K.TabBarItem.location
        locationItem.image = UIImage(named: K.Icons.location)
        locationItem.selectedImage = UIImage(named: K.Icons.locationSelected)
        locationVC.tabBarItem = locationItem
        
        let episodeItem = UITabBarItem()
        episodeItem.title = K.TabBarItem.episode
        episodeItem.image = UIImage(named: K.Icons.episode)
        episodeItem.selectedImage = UIImage(named: K.Icons.episodeSelected)
        episodeVC.tabBarItem = episodeItem
        
        let characterNavigation = UINavigationController(rootViewController: characterVC)
        let locationNavigation = UINavigationController(rootViewController: locationVC)
        let episodeNavigation = UINavigationController(rootViewController: episodeVC)
        
        viewControllers = [characterNavigation, locationNavigation, episodeNavigation]
        selectedViewController = characterNavigation
        selectedIndex = 0
        
    }
    
}
