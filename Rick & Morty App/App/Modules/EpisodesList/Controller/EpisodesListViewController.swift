//
//  EpisodesListViewController.swift
//  Rick & Morty App
//
//  Created by Fran Nasich on 10/03/2022.
//

import UIKit

protocol EpisodesDelegate {
    func reloadTable()
}

class EpisodesListViewController: UIViewController {
    @IBOutlet weak var episodesTableView: UITableView!
    
    private var service = EpisodesListService()
    private var viewModel: EpisodesListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = EpisodesListViewModel(service: service, delegate: self)
        self.viewModel?.getEpisodes()
        setupEpisodesView()
    }
    
    private func setupEpisodesView(){
        self.title = "Episodes"
        self.episodesTableView.register(UINib(nibName: "EpisodesListTableViewCell", bundle: nil), forCellReuseIdentifier: "EpisodesListTableViewCell")
        self.episodesTableView.dataSource = self
        self.episodesTableView.delegate = self
    }
}

extension EpisodesListViewController: EpisodesDelegate{
    func reloadTable() {
        self.episodesTableView.reloadData()
    }
}



extension EpisodesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel?.getEpisodesCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodesListTableViewCell", for: indexPath) as! EpisodesListTableViewCell
        cell.labelName.text = self.viewModel?.getEpisode(at: indexPath.row).name
        
        return cell
    }
}

extension EpisodesListViewController: UITableViewDelegate {
    
}
