//
//  LocationsListViewModel.swift
//  Rick & Morty App
//
//  Created by Fran Nasich on 14/03/2022.
//

import Foundation

class LocationsListViewModel {
    private var service: LocationsListService
    private var delegate: LocationsListDelegate
    private var locations = [Location]()
    
    init(service: LocationsListService, delegate: LocationsListDelegate){
        self.service = service
        self.delegate = delegate
    }
    
    func getLocations() {
        service.getLocations {locations in
            self.locations = locations
            self.delegate.reloadTable()
        } onError: {
            print("error")
        }
    }
    
    func getLocation(at index: Int) -> Location {
        return locations[index]
    }
    
    func getLocationCount() -> Int {
        return locations.count
    }
}
