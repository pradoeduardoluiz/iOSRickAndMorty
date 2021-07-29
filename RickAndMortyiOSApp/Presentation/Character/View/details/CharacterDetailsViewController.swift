//
//  CharacterDetailsViewController.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 26/07/21.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    
    private var characterDetailsViewModel: CharacterDetailsViewModel!
    private let characterDetailsView: CharacterDetailsView
    
    private let character: Character

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = character.name
        navigationItem.largeTitleDisplayMode = .never
        
        characterDetailsViewModel = CharacterDetailsViewModel()
        characterDetailsViewModel.getEpisodes(character: character)
        
        bindOutput(to: characterDetailsViewModel)
        self.view = characterDetailsView
    }
    
    init(character: Character) {
        self.character = character
        self.characterDetailsView = CharacterDetailsView(character: character)
        super.init(nibName: nil, bundle: nil)
        hidesBottomBarWhenPushed = true
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bindOutput(to viewModel: CharacterDetailsViewModel) {
        viewModel.episodes.observe(on: self) { episodes in
            self.characterDetailsView.episodes = episodes
        }
    }
    
}
