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
    }
    
}
