//
//  HomeSceneViewController.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 07.09.22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomeSceneDisplayLogic: AnyObject {
    
    func displayTipDetails(viewModel: HomeScene.SeeDetails.ViewModel)
    func displayAllTipsScene(viewModel: HomeScene.ShowAllTips.ViewModel)
    func displayAllJobsScene(viewModel: HomeScene.ShowAllJobs.ViewModel)
    func displaySelectedJobDetails(viewModel: HomeScene.SeeJobDetails.ViewModel)
    func displayFilteredJobs(viewModel: HomeScene.FilterJobs.ViewModel)
    func displayJobsBycategory(viewModel: HomeScene.FilterJobs.ViewModel)
    func logOut(viewModel: HomeScene.LogOut.ViewModel)
    func displayCommonModel(viewModel: HomeScene.GetCommonModel.ViewModel)
}

final class HomeSceneViewController: UIViewController {
    
    //MARK: Clean components
    
    var interactor: HomeSceneBusinessLogic?
    var router: (HomeSceneRoutingLogic & HomeSceneDataPassing)?
    
    //MARK: dataSources
    
    private var dataSource = [TipsModel]()
    private var jobsDataSource = [JobModel]()
    private var selectedtip: TipsModel!
    private var savedJobs = [JobModel]()
    
    //MARK: UI
  
    lazy var mySearchBar: UISearchBar = {
        let sr = UISearchBar()
        
        sr.searchBarStyle = .minimal
        sr.backgroundColor = .clear
        sr.searchTextField.backgroundColor = .clear
        sr.barTintColor = .clear
        sr.placeholder = " Search job ..."
        sr.returnKeyType = .search
        sr.sizeToFit()
        sr.delegate = self
        
        return sr
    }()
    
    lazy var tableView: UITableView = {
        let v = UITableView()
        v.separatorStyle = .none
        v.delegate = self
        v.dataSource = self
        return v
    }()
    
    // MARK: Object lifecycle
    
    init(interactor: HomeSceneBusinessLogic, router: (HomeSceneRoutingLogic & HomeSceneDataPassing)) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        registerCells()
        interactor?.getCommonModel(request: HomeScene.GetCommonModel.Request())
    }
    
    // MARK: Private methods
    
    private func setTipsTableData(data: [TipsModel]) {
        self.dataSource = data
        tableView.reloadData()
    }
    
    private func setJobsTableData(data: [JobModel]) {
        self.jobsDataSource = data
        tableView.reloadData()
    }
    
    // MARK: Setup UI
    
    private func registerCells() {
        tableView.registerClass(class: TipsForYouTableViewCell.self)
        tableView.registerClass(class: TipsTableViewCell.self)
        tableView.registerClass(class: JobRecomendationsTableViewCell.self)
        tableView.registerClass(class: JobsTableViewCell.self)
        tableView.registerClass(class: FilterTableViewCell.self)
    }
    
    private func setUpViews() {
        view.backgroundColor = .white
        self.navigationItem.setHidesBackButton(true, animated: true)
        view.addSubview(mySearchBar)
        mySearchBar.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                           left: view.leftAnchor,
                           right: view.rightAnchor,
                           paddingTop: 0, paddingLeft: 20,
                           paddingRight: 20,height: 40)
        view.addSubview(tableView)
        tableView.anchor(top: mySearchBar.bottomAnchor,
                         left: view.leftAnchor,
                         bottom: view.bottomAnchor,
                         right: view.rightAnchor,
                         paddingTop: 10, paddingLeft: 10,
                         paddingBottom: 0, paddingRight: 10)
    }
}

//MARK: Delegate/Protocols

extension HomeSceneViewController: OpenAllTipsScene {
    
    func seeAllTipsTap() {
        self.interactor?.didTapSeeAllTips(request: HomeScene.ShowAllTips.Request(data: dataSource))
    }
}
extension HomeSceneViewController: SendDelegatTovc {
    
    func passDataToVc(of title: String) {
        self.interactor?.seeTipsDetails(request: HomeScene.SeeDetails.Request(tipTitle: title, dataSource: dataSource))
    }
}
extension HomeSceneViewController: SeeAllJobsDelegate {
    func didTapSeeALL() {
        self.interactor?.didTapSeeAllJobs(request: HomeScene.ShowAllJobs.Request())
    }
}
extension HomeSceneViewController: SelsectJobDelegateProtocol {
    func selectJob(data: JobModel) {
        self.interactor?.seeJobDetails(request: HomeScene.SeeJobDetails.Request(job: data))
    }
}
extension HomeSceneViewController: FilterByCategoryDelegate {
    func filterByCategory(with title: String) {
        self.interactor?.filterJobsByCategory(request: HomeScene.FilterJobs.Request(keyword: title))
    }
}

//MARK: SearchBar Methods

extension HomeSceneViewController : UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard let text = searchBar.text else { return }
        self.interactor?.getFilteredJobs(request: HomeScene.FilterJobs.Request(keyword: text))
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.showsCancelButton = false
        searchBar.endEditing(true)    }
}

//MARK: display logic methods

extension HomeSceneViewController: HomeSceneDisplayLogic {
    func displayCommonModel(viewModel: HomeScene.GetCommonModel.ViewModel) {
        let jobData = viewModel.data.jobs
        let tipsData = viewModel.data.tips
        self.setJobsTableData(data: jobData)
        self.setTipsTableData(data: tipsData)
    }
    
    func logOut(viewModel: HomeScene.LogOut.ViewModel) {
        router?.logOut()
    }
    
    func displayJobsBycategory(viewModel: HomeScene.FilterJobs.ViewModel) {
       self.setJobsTableData(data: viewModel.data)
    }
    
    func displaySelectedJobDetails(viewModel: HomeScene.SeeJobDetails.ViewModel) {
        router?.navigateToJobDetailsScene()
    }
    
    func displayFilteredJobs(viewModel: HomeScene.FilterJobs.ViewModel) {
        self.setJobsTableData(data: viewModel.data)
    }
    
    func displayAllJobsScene(viewModel: HomeScene.ShowAllJobs.ViewModel) {
        router?.navigateToAllJobsScene()
    }

    func displayAllTipsScene(viewModel: HomeScene.ShowAllTips.ViewModel) {
        router?.navigateToAllTipsListScene()
    }
    
    func displayTipDetails(viewModel: HomeScene.SeeDetails.ViewModel) {
        router?.navigateToDetailsScene()
    }
}

//MARK: Tableview delegate, dataSource protocol methods

extension HomeSceneViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
            
        case 0, 2:
            return CGFloat(HomeTableViewCellItems.seeAll.rawValue)
        case 1:
            return  CGFloat(HomeTableViewCellItems.tips.rawValue)
        case 3:
            return CGFloat(HomeTableViewCellItems.filters.rawValue)
        default:
            return CGFloat(HomeTableViewCellItems.jobs.rawValue)
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cellnum = section == 4 ? jobsDataSource.count : 1
        return cellnum
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0 :
            let cell = tableView.deque(class: TipsForYouTableViewCell.self, for: indexPath)
            cell.textlb.text = SeeAll.tip.rawValue
            cell.delegate = self
            return cell
        case 1 :
            let cell = tableView.deque(class: TipsTableViewCell.self, for: indexPath)
            cell.delegate = self
            cell.tipsArray = dataSource
            cell.shadowedtoView()
            return cell
        case 2:
            let cell = tableView.deque(class: JobRecomendationsTableViewCell.self, for: indexPath)
            cell.textlb.text = SeeAll.job.rawValue
            cell.delegate = self
            return cell
        case 3:
            let cell = tableView.deque(class: FilterTableViewCell.self, for: indexPath)
            cell.fillCategories(from: jobsDataSource)
            cell.delegate = self
            return cell
        case 4:
            let cell = tableView.deque(class: JobsTableViewCell.self, for: indexPath)
            cell.configureCell(with: jobsDataSource[indexPath.row])
            cell.delegate = self
            cell.shadowedtoView()

            return cell
        default:
            fatalError("error while cell return")
        }
    }
}

