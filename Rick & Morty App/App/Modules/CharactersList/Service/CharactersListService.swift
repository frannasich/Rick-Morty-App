//
//  CharactersListService.swift
//  Rick & Morty App
//
//  Created by Fran Nasich on 10/03/2022.
//

import Foundation

class CharactersListService {
    
    func getCharacters(onComplete: @escaping ([Character]) -> Void, onError: @escaping () -> Void) {
        ApiManager.shared.get(url: Constants().allCharactersURL) {response in
            switch response {
            case .success(let data):
                do {
                    if let data = data {
                        let decoder = JSONDecoder()
                        let characterResponse = try decoder.decode(CharacterResponse.self, from: data)
                        onComplete(characterResponse.results)
                    } else {
                        print("error case success")
                    }
                }
                catch {
                    print("error catch")
                }
            case .failure(let error):
                print("failure error: \(error)")
            }
        }
    }
}
