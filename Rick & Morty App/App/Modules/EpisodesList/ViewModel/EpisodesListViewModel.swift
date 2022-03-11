//
//  EpisodesListViewModel.swift
//  Rick & Morty App
//
//  Created by Fran Nasich on 10/03/2022.
//

import Foundation

class EpisodesListViewModel {
    
    private var service: EpisodesListService
    private var episodes = [Episode]()
    private var delegate: EpisodesDelegate
    
    init(service: EpisodesListService, delegate: EpisodesDelegate) {
        self.service = service
        self.delegate = delegate
    }
    
    func getEpisodes(){
        service.getEpisodes {episodes in
            self.episodes = episodes
            self.delegate.reloadTable()
        } onError: {
            print("ERROR getEpisodes")
        }
    }
    
    func getEpisode(at index: Int) -> Episode {
        return episodes[index]
    }
    
    func getEpisodesCount() -> Int {
        return episodes.count
    }
}
