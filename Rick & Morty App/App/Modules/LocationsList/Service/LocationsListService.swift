//
//  LocationsListService.swift
//  Rick & Morty App
//
//  Created by Fran Nasich on 14/03/2022.
//

import Foundation


class LocationsListService {
    
    func getLocations(onComplete: @escaping ([Location]) -> Void, onError: @escaping () -> Void){
        ApiManager.shared.get(url: Constants().allLocationsURL) {response in
            switch response {
            case .success (let data):
                
                do{
                    if let data = data{
                        let decoder = JSONDecoder()
                        let locationsResponse = try decoder.decode(LocationResponse.self, from: data)
                        onComplete(locationsResponse.results)
                    } else {
                        print("else locations error")
                    }
                }
                
                catch {
                    print("error locations catch")
                }
                
            case .failure(_):
                print("failure locations error ")
            }
        }
    }
    
}
