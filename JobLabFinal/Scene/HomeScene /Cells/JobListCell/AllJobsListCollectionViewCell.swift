//
//  AllJobsListCollectionViewCell.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 12.09.22.
//

import UIKit

class AllJobsListCollectionViewCell: UICollectionViewCell {
    
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
    
    let location: UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 12)
        lb.numberOfLines = 0
        return lb
    }()
    
    let jobTimeType: UILabel = {
        let lb = UILabel()
        lb.textColor = .black
        lb.font = .systemFont(ofSize: 14)
        return lb
    }()
    
    let favoriteButton: UIButton = {
        let btn = UIButton()
        btn.setDimensions(height: 60, width: 60)
        return btn
    }()
    let sallery: UILabel = {
        let lb = UILabel()
        return lb
    }()
    
    //MARK: Object LifeCycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        setUpView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: View lifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    //MARK: Private Methods
    
    private func setUpView() {
        JobModelStackview.shared.setUpViews(location: self.location, jobTimeType: self.jobTimeType, jobName: self.jobName, employerName: self.employerName, favoriteButton: self.favoriteButton, sallery: self.sallery, logoImage: self.logoImage, view: self.contentView )
    }
    //MARK: Configure Cell
    
    func configureCell(with model: JobModel) {
        
        self.logoImage.load(url: URL(string: model.logoImage)!)
        self.employerName.text = model.brand
        self.jobName.text = model.jobTitle
        self.location.text = model.location
        self.sallery.text = String(model.sallary)
        self.favoriteButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
    }
}
