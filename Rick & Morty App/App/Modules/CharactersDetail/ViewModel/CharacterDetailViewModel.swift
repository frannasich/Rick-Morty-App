//
//  CharacterDetailViewModel.swift
//  Rick & Morty App
//
//  Created by Fran Nasich on 10/03/2022.
//

import Foundation

class CharacterDetailViewModel {
    
    private var service: CharactersDetailService
    private var characterDetailURL: String
    private var delegate: CharactersDetailDelegate
    
    init(characterDetailURL: String, service: CharactersDetailService, delegate: CharactersDetailDelegate) {
        self.characterDetailURL = characterDetailURL
        self.service = service
        self.delegate = delegate
    }
    
    func getCharacter() {
        service.getCharacter(characterDetailURL: self.characterDetailURL, onComplete: { character in
                self.delegate.loadData(character: character)
        }, onError: {
            self.delegate.showError()
        })
    }

}
