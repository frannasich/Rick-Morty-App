//
//  CharactersListViewController.swift
//  Rick & Morty App
//
//  Created by Fran Nasich on 10/03/2022.
//

import UIKit

protocol CharactersDelegate {
    func reloadTable()
}

class CharactersListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var service = CharactersListService()
    private var viewModel: CharactersListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = CharactersListViewModel(service: service, delegate: self)
        self.viewModel?.getCharacters()
        setupView()
    }
    
    private func setupView(){
        self.title = "Characters"
        self.tableView.register(UINib(nibName: "CharactersListTableViewCell", bundle: nil), forCellReuseIdentifier: "CharactersListTableViewCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

}

extension CharactersListViewController: CharactersDelegate{
    func reloadTable() {
        self.tableView.reloadData()
    }
}


extension CharactersListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel?.getCharactersCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharactersListTableViewCell", for: indexPath) as! CharactersListTableViewCell
        cell.labelName.text = self.viewModel?.getCharacter(at: indexPath.row).name
        
        if let url = self.viewModel?.getCharacter(at: indexPath.row).image, let fullUrl = URL(string: url){
                  cell.imageCharacterList.load(url: fullUrl)
              }
        
        return cell
    }
}

extension CharactersListViewController: UITableViewDelegate {
    func tableView(_ tableview:UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let character = self.viewModel?.getCharacter(at: indexPath.row)
        let characterDetail =  CharacterDetailViewController()
        let characterId = character!.id
        let characterDetailURL = Constants().allCharactersURL + "/" + "\(String(describing: characterId))"
        characterDetail.characterDetailURL = characterDetailURL
        self.navigationController?.pushViewController(characterDetail, animated: true)
        }
}
