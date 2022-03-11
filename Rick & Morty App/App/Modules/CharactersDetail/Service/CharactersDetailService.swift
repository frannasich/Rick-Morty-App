//
//  CharactersDetailService.swift
//  Rick & Morty App
//
//  Created by Fran Nasich on 10/03/2022.
//

import Foundation

class CharactersDetailService{
    
    func getCharacter(characterDetailURL: String, onComplete: @escaping (Character) -> Void, onError: @escaping () -> Void) {
        ApiManager.shared.get(url: characterDetailURL) {response in
            switch response {
            case .success(let data):
                
                do{
                    
                    if let data = data{
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let characterResponse = try decoder.decode(Character.self, from: data)
                        print(characterResponse)
                        onComplete(characterResponse)
                    }else{
                        onError()
                    }
                } catch{
                    onError()
                    print(error)
                }
                
            case .failure(_):
                onError()
            }
        }
    }
}
