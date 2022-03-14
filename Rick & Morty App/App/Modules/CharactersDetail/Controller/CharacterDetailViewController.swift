//
//  CharacterDetailViewController.swift
//  Rick & Morty App
//
//  Created by Fran Nasich on 10/03/2022.
//

import UIKit

protocol CharactersDetailDelegate {
    func loadData(character: Character)
    func showError()
}

class CharacterDetailViewController: UIViewController {
    @IBOutlet weak var nameLabelDetail: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var imageDetail: UIImageView!
    
    private let service = CharactersDetailService()
    private var viewModel: CharacterDetailViewModel?
    var characterDetailURL: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = characterDetailURL {
            self.viewModel = CharacterDetailViewModel(characterDetailURL: url, service: self.service, delegate: self)
            self.viewModel?.getCharacter()
        }
    }
}

extension CharacterDetailViewController: CharactersDetailDelegate {
    
    func loadData(character: Character) {
        self.nameLabelDetail.text = character.name
        self.statusLabel.text = character.status
        self.speciesLabel.text = character.species
        self.genderLabel.text = character.gender
        self.originLabel.text = character.origin.name
        self.locationLabel.text = character.location.name
        
        let url = URL(string: character.image)!
        self.imageDetail.load(url: url)
    }
    
    func showError() {
        print("Ha ocurrido un error")
    }
}
