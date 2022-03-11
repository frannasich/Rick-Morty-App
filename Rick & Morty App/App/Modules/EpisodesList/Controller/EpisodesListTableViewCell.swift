//
//  EpisodesListTableViewCell.swift
//  Rick & Morty App
//
//  Created by Fran Nasich on 10/03/2022.
//

import UIKit

class EpisodesListTableViewCell: UITableViewCell {
    @IBOutlet weak var labelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
