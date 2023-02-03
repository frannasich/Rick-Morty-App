//
//  CharactersListViewController.swift
//  Rick & Morty App
//
//  Created by Fran Nasich on 10/03/2022.
//

import UIKit
import SkeletonView

protocol CharactersDelegate {
    func reloadTable()
    func spinnerState(show: Bool)
    func errorMessage()
}

class CharactersListViewController: UIViewController, SkeletonCollectionViewDataSource {
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> SkeletonView.ReusableCellIdentifier {
        return "charactersCollectionCell"
    }
    //MARK: - Outlets
    @IBOutlet weak var collectionV: UICollectionView!
    var vSpinner: UIView?
    var cellCollection = CharactersListCollectionViewCell()
    
    //MARK: - Constants
    private var service = CharactersListService()
    private var viewModel: CharactersListViewModel?
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = CharactersListViewModel(service: service, delegate: self)
        self.viewModel?.getCharacters()
        spinnerColor = .systemGreen
        spinnerState(show: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupView()
    }
    
    //MARK: - Helpers
    private func setupView(){
        self.title = "Characters"
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionV)
        collectionV.frame = view.bounds
        collectionV.backgroundColor = .clear
        collectionV.isPagingEnabled = true
        self.collectionV.dataSource = self
        self.collectionV.delegate = self
        self.collectionV.register(UINib(nibName: "CharactersListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "charactersCollectionCell")
    }
}

//MARK: - Extensions
extension CharactersListViewController: CharactersDelegate{
    func reloadTable() {
        self.collectionV.reloadData()
    }
    
    func spinnerState(show: Bool) {
        show ? self.showSpinner(onView: self.view) : self.removeSpinner()
    }
    
    func errorMessage() {
        let alert = UIAlertController(title: "An error has been ocurred", message: "Go back to Home", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension CharactersListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.getCharactersCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "charactersCollectionCell", for: indexPath) as! CharactersListCollectionViewCell
        
        cell.imageView.isSkeletonable = true
        cell.imageView.showAnimatedGradientSkeleton()
        cell.viewBackground.isSkeletonable = true
        cell.viewBackground.showAnimatedGradientSkeleton()
        cell.label.text = self.viewModel?.getCharacter(at: indexPath.row).name
        cell.label.textColor = .white
        
        if let url = self.viewModel?.getCharacter(at: indexPath.row).image, let fullUrl = URL(string: url){
            cell.imageView.load(url: fullUrl)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            cell.viewBackground.hideSkeleton()
            cell.imageView.hideSkeleton()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let columnCount = 2
        let width = (Int(view.frame.width) - 15) / columnCount
        return CGSize(width: width, height: width + 35)
    }
}

