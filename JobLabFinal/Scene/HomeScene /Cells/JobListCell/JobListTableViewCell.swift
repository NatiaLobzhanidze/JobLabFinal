//
//  JobListTableViewCell.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 08.09.22.
//

import UIKit

class JobListTableViewCell: UITableViewCell {

  //MARK: UI Elements
    let logoImage: UIImageView = {
       let img = UIImageView()
        img.setDimensions(height: 120, width: 120)
        return img
    }()
    
    let jobName: UILabel = {
        let lb = UILabel()
        lb.textColor = .black
        lb.font = .systemFont(ofSize: 18, weight: .semibold)
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
        lb.font = .systemFont(ofSize: 14)
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
        
        return btn
    }()
    let sallery: UILabel = {
        let lb = UILabel()
        return lb
    }()
    
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
        setUpViews()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setUpViews()
       
    }
    
    private func setUpViews() {
        let innerStackview1 = UIStackView(arrangedSubviews: [location, jobTimeType])
        innerStackview1.axis = .horizontal
        innerStackview1.distribution = .fillEqually
        innerStackview1.spacing = 0
        innerStackview1.setDimensions(height: 50, width: 220)
        let stackview1 = UIStackView(arrangedSubviews: [jobName, employerName, innerStackview1])
        stackview1.axis = .vertical
        let innerStackview2 = UIStackView(arrangedSubviews: [favoriteButton, sallery])
        innerStackview2.axis = .vertical
        innerStackview2.distribution = .fillProportionally
        innerStackview2.alignment = .fill
        
    
       let mainStackview = UIStackView(arrangedSubviews: [logoImage, stackview1, innerStackview2])
        mainStackview.axis = .horizontal
        mainStackview.distribution = .fill
        
        
        contentView.addSubview(mainStackview)
        mainStackview.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5)
        
    }
    func configureCell(with model: JobModel) {

        self.logoImage.image = UIImage(named: model.logoImage)
        self.employerName.text = model.brand
        self.jobName.text = model.jobTitle
        self.location.text = model.location
        guard let sallary =  model.sallary else {
            self.sallery.text = "n/a"
            return 
        }
        self.sallery.text = String(sallary)
        guard let isFav = model.isFavorite else { return }
        if isFav {
            self.favoriteButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        } else {
            self.favoriteButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        }
       
    }
}
