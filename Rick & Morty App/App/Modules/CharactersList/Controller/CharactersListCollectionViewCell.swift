//
//  CharactersListCollectionViewCell.swift
//  Rick & Morty App
//
//  Created by Francisco Tomas Nasich on 02/02/2023.
//

import UIKit

class CharactersListCollectionViewCell: UICollectionViewCell {
    //MARK: - Outlets
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var footerContainer: UIView!
    @IBOutlet weak var favoriteView: UIView!
    @IBOutlet weak var favoriteImage: UIImageView!
    
    //    @IBOutlet weak var viewBackground2: UIView!
    //    @IBOutlet weak var label1: UILabel!
    //    @IBOutlet weak var label2: UILabel!
    //    @IBOutlet weak var label3: UILabel!
    //    @IBOutlet weak var label4: UILabel!
    //    @IBOutlet weak var favoriteView2: UIView!
    //    @IBOutlet weak var favoriteImage2: UIImageView!
    
    //MARK: - Variables & Constants
    private var showingBack = false
    private var isFav: Bool = false
    
    //MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        //        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        //        tapGesture.numberOfTapsRequired = 1
        //        viewBackground.addGestureRecognizer(tapGesture)
        //        viewBackground.isUserInteractionEnabled = true
        //        viewBackground2.addGestureRecognizer(tapGesture)
        //        viewBackground2.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapFav))
        tapGesture.numberOfTapsRequired = 1
        favoriteView.addGestureRecognizer(tapGesture)
        setupCell()
    }
    
    //MARK: - Helpers
    private func setupCell() {
        viewBackground.layer.borderWidth = 2.0
        viewBackground.layer.borderColor = UIColor.systemGreen.cgColor
        viewBackground.layer.cornerRadius = 6.0
        footerContainer.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 12.0)
    }
    
    @objc func tapFav() {
        switch isFav {
        case true :
            isFav = false
            favoriteImage.image = UIImage(systemName: "heart")
            print("is fav?: \(isFav)")
        case false:
            isFav = true
            favoriteImage.image = UIImage(systemName: "heart.fill")
            print("is fav?: \(isFav)")
            
        }
    }
    
    //    @objc func tap() {
    //        if showingBack {
    //            UIView.transition(from: self.viewBackground2, to: self.viewBackground, duration: 1, options: UIView.AnimationOptions.transitionFlipFromRight, completion: nil)
    //
    //            viewBackground2?.isHidden = true
    //            viewBackground?.isHidden = false
    //
    //            showingBack = false
    //        }
    //        else {
    //            showingBack = true
    //
    //            UIView.transition(from: self.viewBackground2, to: self.viewBackground, duration: 1, options: UIView.AnimationOptions.transitionFlipFromRight, completion: nil)
    //
    //            viewBackground2.isHidden = false
    //            viewBackground.isHidden = true
    //        }
    //    }
}
