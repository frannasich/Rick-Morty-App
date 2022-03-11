//
//  CharactersListTableViewCell.swift
//  Rick & Morty App
//
//  Created by Fran Nasich on 10/03/2022.
//

import UIKit

class CharactersListTableViewCell: UITableViewCell {
    @IBOutlet weak var imageCharacterList: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
