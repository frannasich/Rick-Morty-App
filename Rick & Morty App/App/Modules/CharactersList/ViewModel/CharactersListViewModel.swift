//
//  CharactersListViewModel.swift
//  Rick & Morty App
//
//  Created by Fran Nasich on 10/03/2022.
//

import Foundation

class CharactersListViewModel {
    
    private var service: CharactersListService
    private var characters = [Character]()
    private var delegate: CharactersDelegate
    
    init(service: CharactersListService, delegate: CharactersDelegate){
        self.service = service
        self.delegate = delegate
    }
    
    func getCharacters(){
        service.getCharacters { characters in
            self.characters = characters
            self.delegate.reloadTable()
            self.delegate.spinnerState(show: false)
        } onError: {
            self.delegate.spinnerState(show: false)
            self.delegate.errorMessage()
        }
    }
    
    func getCharacter(at index: Int) -> Character {
        return characters[index]
    }
    
    func getCharactersCount() -> Int {
        return characters.count
    }
}
