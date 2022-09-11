//
//  ProfileEdditorableViewCell.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 07.09.22.
//

import UIKit

class ProfileEdditorableViewCell: UITableViewCell {
    
    let datePicker = UIDatePicker()
    let toolbar = UIToolbar()
    let tLabel: UILabel = {
        let lb = UILabel()
        
        lb.font = .systemFont(ofSize: 14, weight: .semibold)
        return lb
    }()
    
    let tField: UITextField = {
        let txt = UITextField()
        txt.format()
        txt.addPaddingToTextField()
        return txt
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier) }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpview()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setUpview()
        // Configure the view for the selected state
    }

    func createToolBar() -> UIToolbar {
    
        toolbar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        return toolbar
    }
    func createDatePicker(for textfiled: UITextField) {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        textfiled.inputAccessoryView = createToolBar()
        textfiled.inputView = datePicker
        
    }
    
    @objc func donePressed() {
      //delegate or typecast?
        let dateformmater = DateFormatter()
        dateformmater.dateStyle = .medium
        dateformmater.timeStyle = .none
        let birthData = dateformmater.string(from: datePicker.date)
        self.tField.text = "\(birthData)"   
        
    }
  
    
    func configure(with txtLb : String)  {
        
        self.tLabel.addRequiredAsterisk(text: "   \(txtLb) *")
        if tLabel.text == "Date of birth" {
            createDatePicker(for: tField)
        } else {
        self.tField.placeholder = txtLb
        }
    }
  
    func setUpview() {
        let stackview = UIStackView(arrangedSubviews: [tLabel, tField])
        contentView.addSubview(stackview)
        stackview.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 5, paddingRight: 10)
        stackview.axis = .vertical
        stackview.distribution = .fillEqually
        stackview.spacing = 0
    }
}
