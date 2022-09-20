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
    func displayFilteredJobs(viewModel: AllJobsListScene.FilterJobs.ViewModel)
    func displayJobDetailsScene(viewModel: AllJobsListScene.SeeJobDetails.ViewModel)
}

class AllJobsListSceneViewController: UIViewController
{
    //MARK: Clean Components
    
    var interactor: AllJobsListSceneBusinessLogic?
    var router: (AllJobsListSceneRoutingLogic & AllJobsListSceneDataPassing)?
    
    //MARK: Stored properties
    
    var allJobsContainer = [JobModel]()
    
    var filteredJobs = [JobModel]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
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
    
    lazy var tableView: UITableView = {
        let v = UITableView()
        v.delegate = self
        v.dataSource = self
        
        return v
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
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        mySearchBar.delegate = self
        interactor?.getAllJobs(request: AllJobsListScene.GetAllJobs.Request())
        tableView.registerClass(class: FilterTableViewCell.self)
        tableView.registerClass(class: JobsTableViewCell.self)
        setUpView()
    }
    
    // MARK: Private methods
    
    private func setJobsTableData(data: [JobModel]) {
        self.allJobsContainer = data
        self.tableView.reloadData()
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
        view.addSubview(tableView)
        tableView.anchor(top: mySearchBar.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
}
//MARK: Searchbar methods

extension AllJobsListSceneViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let text = searchBar.text else {
            self.tableView.reloadData()
            return }
        self.interactor?.getFilteredJobs(request: AllJobsListScene.FilterJobs.Request(keyword: text, category: nil))
        if searchText.isEmpty {
            self.filteredJobs = allJobsContainer
            self.tableView.reloadData()
        }
    }
}

//MARK: DisplayLogics

extension AllJobsListSceneViewController: AllJobsListSceneDisplayLogic {
    func displayJobDetailsScene(viewModel: AllJobsListScene.SeeJobDetails.ViewModel) {
        router?.navigateTpJobDetailsScene()
    }
    
    func displayFilteredJobs(viewModel: AllJobsListScene.FilterJobs.ViewModel) {
        self.setJobsTableData(data: viewModel.data)
    }
    
    func displayJobsList(viewModel: AllJobsListScene.GetAllJobs.ViewModel) {
        self.allJobsContainer = viewModel.data
    }
}
//MARK: TableView datasource

extension AllJobsListSceneViewController:  UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numofRows = section == 0 ? 1 :  allJobsContainer.count
        return numofRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
            let cell = tableView.deque(class: FilterTableViewCell.self, for: indexPath)
            cell.fillCategories(from: allJobsContainer)
            cell.delegate = self
            return cell
        case 1:
            let cell = tableView.deque(class: JobsTableViewCell.self, for: indexPath)
            cell.configureCell(with: allJobsContainer[indexPath.row])
            cell.layer.borderWidth = 0.5
            cell.layer.borderColor = UIColor.tintColor.cgColor
            cell.layer.cornerRadius = 20
            return cell
        default:
            fatalError("cant, find cells in allJobs")
        }
    }
}

//MARK: TableView Delegate

extension AllJobsListSceneViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = indexPath.section == 0 ? 70 : 120
        return CGFloat(height)
    }
}

//MARK: Delegate/protocol methods

extension AllJobsListSceneViewController : FilterByCategoryDelegate {
    func filterByCategory(with title: String) {
        interactor?.getFilteredJobs(request: AllJobsListScene.FilterJobs.Request(keyword: nil, category: title))
    }
    
   
    
}
