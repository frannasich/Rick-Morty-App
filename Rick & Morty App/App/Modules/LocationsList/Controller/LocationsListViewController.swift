//
//  LocationsListViewController.swift
//  Rick & Morty App
//
//  Created by Fran Nasich on 14/03/2022.
//

import UIKit

protocol LocationsListDelegate {
    func reloadTable()
}


class LocationsListViewController: UIViewController {
    
    private var service = LocationsListService()
    private var viewModel: LocationsListViewModel?

    @IBOutlet weak var locationTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = LocationsListViewModel(service: service, delegate: self)
        self.viewModel?.getLocations()
        setupView()
    }

    private func setupView(){
        self.title = "Locations"
        self.locationTableView.register(UINib(nibName: "LocationsTableViewCell", bundle: nil), forCellReuseIdentifier: "LocationsTableViewCell")
        self.locationTableView.dataSource = self
        self.locationTableView.delegate = self
    }

}

extension LocationsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel?.getLocationCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = locationTableView.dequeueReusableCell(withIdentifier: "LocationsTableViewCell", for: indexPath) as! LocationsTableViewCell
        cell.locationLabel.text = self.viewModel?.getLocation(at: indexPath.row).name
        
        return cell
    }
    
    
}


extension LocationsListViewController: UITableViewDelegate {
    
}


extension LocationsListViewController: LocationsListDelegate {
    
    func reloadTable() {
        self.locationTableView.reloadData()
    }
}

