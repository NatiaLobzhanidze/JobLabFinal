//
//  AllJobsListSceneViewController.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 12.09.22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol AllJobsListSceneDisplayLogic: AnyObject
{
    func displayJobsList(viewModel: AllJobsListScene.GetAllJobs.ViewModel)
}

class AllJobsListSceneViewController: UIViewController
{
    //MARK: Clean Components
    
  var interactor: AllJobsListSceneBusinessLogic?
  var router: (AllJobsListSceneRoutingLogic & AllJobsListSceneDataPassing)?

    //MARK: Stored properties
    
  var allJobsContainer = [JobModel]()
    
    //MARK: View
    
    let mySearchBar: UISearchBar = {
        let sr = UISearchBar()
        sr.searchBarStyle = UISearchBar.Style.minimal
        sr.placeholder = " Search..."
        sr.sizeToFit()
        sr.isTranslucent = false
        
        
        return sr
    }()
    let listButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "line.3.horizontal.decrease"), for: .normal)
        btn.setTitleColor(.tintColor, for: .normal)
       
        return btn
    }()
    private lazy var collectionView: UICollectionView = {
        let sm = CustomCollectionViewConfiguration.shared.customCollectionView(direction: .vertical, itemSize: CGSize(width: UIScreen.main.bounds.width - 40 , height: 100))
        sm.delegate = self
        sm.dataSource = self
        return sm
    }()
    
    
  // MARK: Object lifecycle
    init(interactor: AllJobsListSceneBusinessLogic, router: (AllJobsListSceneRoutingLogic & AllJobsListSceneDataPassing)) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
  }
    
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
      view.backgroundColor = .red
      interactor?.getAllJobs(request: AllJobsListScene.GetAllJobs.Request())
      setUpView()
      collectionView.registerClass(class: AllJobsListCollectionViewCell.self)
  }
  
  // MARK: Set up view
    
    private func  setUpView() {
        view.addSubview(mySearchBar)
        mySearchBar.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,  paddingTop: 0, paddingLeft: 20, height: 40)
       view.addSubview(listButton)
       listButton.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                         left: mySearchBar.rightAnchor, bottom: mySearchBar.bottomAnchor ,right: view.rightAnchor,
                         paddingTop: 0,
                         paddingLeft: 0, paddingBottom: 0,
                         paddingRight: 20 , width: 50)
        view.addSubview(collectionView)
        collectionView.anchor(top: mySearchBar.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
  

}
extension AllJobsListSceneViewController: AllJobsListSceneDisplayLogic {
    func displayJobsList(viewModel: AllJobsListScene.GetAllJobs.ViewModel) {
        self.allJobsContainer = viewModel.data
        
    }
}
//MARK: collectionview datasource, delegate

extension AllJobsListSceneViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        allJobsContainer.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(AllJobsListCollectionViewCell.self, for: indexPath)
        cell.configureCell(with: allJobsContainer[indexPath.row])
        return cell
    }
    
    
}