//
//  ViewController.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 21/07/21.
//

import UIKit

class CharacterViewController: UIViewController {
    
    private var characterViewModel: CharacterViewModel!
    
    private let filterBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "Filter"
        return button
    }()
    
    private lazy var characterView = CharacterView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = K.Labels.characterLabelText

        navigationItem.rightBarButtonItem = filterBarButton
        navigationItem.title = K.Labels.characterLabelText
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        characterViewModel = CharacterViewModel()
        
        bindInput(to: characterViewModel)
        bindOutput(to: characterViewModel)
        self.view = characterView
    }
    
    private func bindInput(to viewModel: CharacterViewModel){
        characterView.loadMoreData = {
            viewModel.getCharacters()
        }
        characterView.didSelectItem = { character in
            let details = CharacterDetailsViewController(character: character)
            self.navigationController?.pushViewController(details, animated: true)
        }
    }
    
    private func bindOutput(to viewModel: CharacterViewModel) {
        viewModel.characters.observe(on: self) { characters in
            self.characterView.characters = characters.map({ character in
                character
            })
        }
        viewModel.error.observe(on: self) { error in
            print(error)
        }
        viewModel.isLoading.observe(on: self) { isLoading in
            self.characterView.isLoadingCharacters = isLoading
        }
    }
}

