//
//  AllJobsListCollectionViewCell.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 12.09.22.
//

import UIKit

class AllJobsListCollectionViewCell: UICollectionViewCell {
    
    //MARK: UI Elements
    
      let logoImage: UIImageView = {
         let img = UIImageView()
          img.setDimensions(height: 120, width: 120)
          return img
      }()
      
      let jobName: UILabel = {
          let lb = UILabel()
          lb.textColor = .black
          lb.font = .systemFont(ofSize: 16, weight: .semibold)
          lb.numberOfLines = 0
          //lb.setDimensions(height: 30, width: 150)
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
          
          return btn
      }()
      let sallery: UILabel = {
          let lb = UILabel()
          return lb
      }()
    override func prepareForReuse() {
                super.prepareForReuse()
        setUpView()
        contentView.backgroundColor = .red
                
        }
        
        override init(frame: CGRect) {
                super.init(frame: frame)
            setUpView()
            contentView.backgroundColor = .red
               
        }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: View lifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .red
        setUpView()
                
    }

    private func setUpView() {
        JobModelStackview.shared.setUpViews(location: self.location, jobTimeType: self.jobTimeType, jobName: self.jobName, employerName: self.employerName, favoriteButton: self.favoriteButton, sallery: self.sallery, logoImage: self.logoImage, view: self.contentView )
    }
   //MARK: Configure Cell
    
      func configureCell(with model: JobModel) {

          self.logoImage.image = UIImage(named: model.logoImage)
          self.employerName.text = model.brand
          self.jobName.text = model.jobTitle
          self.location.text = model.location
          self.sallery.text = String(model.sallary)
        
          self.favoriteButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
          
         
      }
    
}
