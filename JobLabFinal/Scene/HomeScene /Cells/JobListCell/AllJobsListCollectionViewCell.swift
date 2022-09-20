//
//  AllJobsListCollectionViewCell.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 12.09.22.
//

import UIKit
import CoreData



class AllJobsListCollectionViewCell: UICollectionViewCell {
    
    var favoriteJobs: JobModel?
    
    //MARK: View
    
    let logoImage: UIImageView = {
        let img = UIImageView()
        img.setDimensions(height: 100, width: 100)
        return img
    }()
    
    let jobName: UILabel = {
        let lb = UILabel()
        lb.textColor = .black
        lb.font = .systemFont(ofSize: 16, weight: .semibold)
        lb.numberOfLines = 0
        return lb
    }()
    
    let employerName: UILabel = {
        let lb = UILabel()
        lb.textColor = .black
        lb.font = .systemFont(ofSize: 16)
        return lb
    }()
    
//    let location: UILabel = {
//        let lb = UILabel()
//        lb.font = .systemFont(ofSize: 12)
//        lb.numberOfLines = 0
//        return lb
//    }()
    
//    let jobTimeType: UILabel = {
//        let lb = UILabel()
//        lb.textColor = .black
//        lb.font = .systemFont(ofSize: 14)
//        return lb
//    }()
    
    let favoriteButton: UIButton = {
        let btn = UIButton()
        btn.setDimensions(height: 60, width: 60)
        btn.addTarget(self, action: #selector(addToFavoritesList), for: .touchUpInside)
        return btn
    }()
//    let sallery: UILabel = {
//        let lb = UILabel()
//        return lb
//    }()
//
    //MARK: Object LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
   
    
    //MARK: View lifeCycle
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//    }
//
    //MARK: Private Methods
    
    private func setUpView() {
//        JobModelStackview.shared.setUpViews( jobName: self.jobName, employerName: self.employerName, favoriteButton: self.favoriteButton, logoImage: self.logoImage, view: self.contentView )
//    }
    }
    
    @objc func addToFavoritesList() {
        guard let favoriteJobs = favoriteJobs else { return }
        let jobDictionary: [String : Any] = ["image" : favoriteJobs.logoImage,
                                             "employer" : favoriteJobs.brand,
                                             "isFavorite" : true,
                                             "jobTitle" : favoriteJobs.jobTitle,
                ]
        CoreDataManaager.shared.create(from: jobDictionary, toEntity: "Favorites")
        favoriteButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        print("saved?")
    }
    
    //MARK: Configure Cell
    
    func configureCell(with model: JobModel) {
        self.favoriteJobs = model
        self.logoImage.load(url: URL(string: model.logoImage)!)
        self.employerName.text = model.brand
        self.jobName.text = model.jobTitle
        self.favoriteButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
