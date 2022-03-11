//
//  EpisodesListService.swift
//  Rick & Morty App
//
//  Created by Fran Nasich on 10/03/2022.
//

import Foundation

class EpisodesListService {
    
    func getEpisodes(onComplete: @escaping ([Episode]) -> Void, onError: @escaping () -> Void) {
        ApiManager.shared.get(url: Constants().allEpisodesURL) {response in
            switch response {
            case .success(let data):
            
                do {
                    if let data = data {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let episodeResponse = try decoder.decode(EpisodeResponse.self, from: data)
                        onComplete(episodeResponse.results)
                        print(episodeResponse.results)
                    } else {
                        print("error case success")
                    }
                }
                catch {
                    print("error catch")
                }
            case .failure(_):
                print("failure error")
            }
        }
    }
}
