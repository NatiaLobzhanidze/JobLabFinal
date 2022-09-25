//
//  FavoritesSceneViewController.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 18.09.22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import CoreData

protocol FavoritesSceneDisplayLogic: AnyObject {
    func displayFavoriteJobs(viewModel: FavoritesScene.GetFavoriteJobs.ViewModel)
    func displayDeleting(viewModel: FavoritesScene.DeleteAll.ViewModel)
}

final class FavoritesSceneViewController: UIViewController {
    
    //MARK: Clean Components
    
    var interactor: FavoritesSceneBusinessLogic?
    var router: (FavoritesSceneRoutingLogic & FavoritesSceneDataPassing)?
    var dataSource = [JobModel]()
    
    //MARK: UI
    
    let deleteBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Delete All", for: .normal)
        btn.setTitleColor(.tintColor, for: .normal)
        
        return btn
    }()
    
    lazy var tableView: UITableView = {
        let v = UITableView()
        v.dataSource = self
        v.delegate = self
      
        return v
    }()
    
    // MARK: Object lifecycle
    
    init(interactor: FavoritesSceneBusinessLogic, router: (FavoritesSceneRoutingLogic & FavoritesSceneDataPassing)) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(class: JobsTableViewCell.self)
        setUpUi()
        interactor?.getFavorites(request: FavoritesScene.GetFavoriteJobs.Request())
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.getFavorites(request: FavoritesScene.GetFavoriteJobs.Request())
    }
    
    //MARK: Private methods

     func setFavoritesTableData(data: [JobModel]) {
        self.dataSource = data
         DispatchQueue.main.async {
             self.tableView.reloadData()
         }
    
    }
    
    // MARK: Setup UI
    
    private func setUpUi() {
        view.backgroundColor = .white
        view.addSubview(deleteBtn)
        deleteBtn.anchor(top: view.safeAreaLayoutGuide.topAnchor ,  right: view.rightAnchor, paddingTop: 50, paddingRight: 20, width: 100, height: 35)
        view.addSubview(tableView)
        tableView.anchor(top: deleteBtn.bottomAnchor,
                         left: view.leftAnchor,
                         bottom: view.bottomAnchor,
                         right: view.rightAnchor,
                         paddingTop: 20, paddingLeft: 10,
                         paddingBottom: 10, paddingRight: 10)
    }
    @objc func deleteAllFavorites() {
        interactor?.deleteAllDAta(request: FavoritesScene.DeleteAll.Request())
    }
}
//MARK: DisplayLogic Methods

extension FavoritesSceneViewController: FavoritesSceneDisplayLogic {
    func displayDeleting(viewModel: FavoritesScene.DeleteAll.ViewModel) {
        self.setFavoritesTableData(data: [])
    }
    
    func displayFavoriteJobs(viewModel: FavoritesScene.GetFavoriteJobs.ViewModel) {
        let data = viewModel.data
        self.setFavoritesTableData(data: data)
    }
}

//MARK: CollectionViewDataSource

extension FavoritesSceneViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(class: JobsTableViewCell.self, for: indexPath)
        cell.configureCell(with: dataSource[indexPath.row])
        cell.shadowedtoView()
        cell.favoriteButton.setImage(UIImage(named: "bookmark.fill"), for: .normal)
        cell.favoriteButton.setTitleColor(.tintColor, for: .normal)
        return cell
    }
}

extension FavoritesSceneViewController: UITableViewDelegate {
    
}
