//
//  MainPageViewController.swift
//  Rick & Morty App
//
//  Created by Fran Nasich on 10/03/2022.
//

import UIKit

class MainPageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func charactersButton(_ sender: Any) {
        let charactersList = CharactersListViewController()
        self.navigationController?.pushViewController(charactersList, animated: true)
    }
    @IBAction func episodesButton(_ sender: Any) {
        let episodesList = EpisodesListViewController()
        self.navigationController?.pushViewController(episodesList, animated: true)
    }
    @IBAction func locationsButton(_ sender: Any) {
        let locationsList = LocationsListViewController()
        self.navigationController?.pushViewController(locationsList, animated: true)
    }
    
}
