//
//  JobsTableViewCell.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 12.09.22.
//

import UIKit

protocol SelectJobDelegateProtocol {
    func selectJob(data: JobModel)
}

final class JobsTableViewCell: UITableViewCell {
    
    //MARK: Fieleds
    
    var favoriteJobs: JobModel?
    var favorites = [String]()
    var delegate: SelectJobDelegateProtocol!
     
    //MARK: UI
    
    private let backView = UIView()
    
    let logoImage = UIImageView()
    
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
    
    let favoriteButton: UIButton = {
        let btn = UIButton()
        btn.setDimensions(height: 60, width: 60)
        btn.addTarget(self, action: #selector(addToFavoritesList), for: .touchUpInside)
        return btn
    }()
    
    //MARK: View lifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: @objc methods
    
    @objc func addToFavoritesList() {
        guard let favoriteJobs = favoriteJobs else { return }
        let jobDictionary: [String : Any] = ["identity" : favoriteJobs.ident,
                                             "isFavorite" : true]
        //MARK: Check!
        
        CoreDataManaager.shared.create(from: jobDictionary, toEntity: "Favorites")
        
        favoriteButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
    }
    
    // MARK: Private Methods
    
    private func setUpViews() {
        contentView.addSubview(backView)
        backView.fillSuperview()
        JobModelStackview.shared.setUpViews(jobName, employerName: employerName, favoriteButton: favoriteButton, logoImage: logoImage, view: backView)
    }
    
    //MARK: Configure Cell
    
    func configureCell(with model: JobModel) {
        self.favoriteJobs = model
        self.logoImage.loadImageUsingCache(withUrl: model.logoImage)
        self.employerName.text = model.brand
        self.jobName.text = model.jobTitle
        let btnStyle = favorites.contains(model.ident ) ? "bookmark.fill" : "bookmark"
        self.favoriteButton.setImage(UIImage(systemName: btnStyle), for: .normal)
    }
    
}

