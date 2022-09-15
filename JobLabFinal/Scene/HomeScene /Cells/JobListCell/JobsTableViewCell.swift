//
//  JobsTableViewCell.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 12.09.22.
//

import UIKit

protocol SelsectJobDelegateProtocol {
    func selectJob(data: JobModel)
}

class JobsTableViewCell: UITableViewCell {
    
    //MARK: View
    
    let collectionView: UICollectionView = {
        let cv = CustomCollectionViewConfiguration.shared.customCollectionView(direction: .vertical, itemSize: CGSize(width: UIScreen.main.bounds.width  - 40, height: 120))
        return cv
    }()
    
    //MARK:  properties
    var jobsConteiner = [JobModel]() {
        didSet {
            self.collectionView.reloadData()
        }
    }
    var delegate: SelsectJobDelegateProtocol!
    
    
    //MARK: View lifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        collectionView.registerClass(class: AllJobsListCollectionViewCell.self)
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
    
    // MARK: Private Methods
    
    private func setUpViews() {
        self.contentView.addSubview(collectionView)
        collectionView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
}

//MARK: Collectionview dataSoruce, delegate protocols

extension JobsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        jobsConteiner.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(AllJobsListCollectionViewCell.self, for: indexPath)
        cell.configureCell(with: jobsConteiner[indexPath.row])
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.tintColor.cgColor
        cell.layer.cornerRadius = 20
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 30, height: 90)
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.selectJob(data: jobsConteiner[indexPath.row])
    }
}
