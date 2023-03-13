//
//  TableViewCell.swift
//  SimpleVIP
//
//  Created by Batm Admin on 21/02/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    static let identifier : String = "cell"
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = ""
        return label
    }()
    
    lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 100
        imageView.image = UIImage(systemName: "person.crop.circle.fill")
        return imageView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(label)
        addSubview(iconImage)
        NSLayoutConstraint.activate([
            iconImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImage.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            iconImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 12),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -12),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
//        print("hello \(String(describing: self.label.text!))")
    }

}
