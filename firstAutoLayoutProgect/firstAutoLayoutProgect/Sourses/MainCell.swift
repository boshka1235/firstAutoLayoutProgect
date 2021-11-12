//
//  MainCell.swift
//  firstAutoLayoutProgect
//
//  Created by Oatmeal Simon on 10/26/21.
//  Copyright © 2021 Oatmeal Simon. All rights reserved.
//

import Foundation
import UIKit

class Cell: UITableViewCell {
		
		let label = UILabel()
		
		init(text: String, font: UIFont){
			super.init(style: .default, reuseIdentifier: nil)
			addLabel(text: text, font: font)
			addLeftButton()
			addRightButton()
		}
		required init?(coder: NSCoder) {
			fatalError("init(coder:) has not been implemented")
		}
	}
		
extension Cell: forCell {
	func addLabel(text: String, font: UIFont) {
		textHelper(text: label, backgroundColor: .white, textAligment: .left, attributedText: NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.kern: 0.32]), textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1))
		label.text = text
		label.font = font
		addSubview(label)
		label.translatesAutoresizingMaskIntoConstraints = false
		let constTop = NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 12)
		let constBot = NSLayoutConstraint(item: label, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -12)
		let constLead = NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: self, attribute:.leading, multiplier: 1.0, constant: 50)
		let constTail = NSLayoutConstraint(item: label, attribute: .trailing, relatedBy: .equal, toItem: self, attribute:.trailing, multiplier: 1.0, constant: -50)
		NSLayoutConstraint.activate([constTop, constBot, constLead, constTail])
		label.lineBreakMode = NSLineBreakMode.byWordWrapping
		label.numberOfLines = 0
	}

	func addLeftButton() {
		let leftButton = UIButton()
		anchorHelper(label: leftButton, parentLabel: self, topAnchorLabel: nil, bottomAnchorLabel: nil, leadingAnchorLabel: self.leadingAnchor, trailingAnchorLabel: nil, topAnchor: nil, leadingConstant: 8, trailingConstant: nil, widthConstant: 30, heightConstant: 30, bottomAnchor: nil)
		leftButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
		leftButton.backgroundColor = .black
		leftButton.setImage(UIImage(named: "leftButton"), for: .normal)
	}

	func addRightButton() {
		let rightButton = UIButton()
		anchorHelper(label: rightButton, parentLabel: self, topAnchorLabel: nil, bottomAnchorLabel: nil, leadingAnchorLabel: self.leadingAnchor, trailingAnchorLabel: self.trailingAnchor, topAnchor: nil, leadingConstant: nil, trailingConstant: -8, widthConstant: 30, heightConstant: 30, bottomAnchor: nil)
		rightButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
		rightButton.backgroundColor = .black
		rightButton.setImage(UIImage(named: "rightButton")?.withRenderingMode(.alwaysOriginal), for: .normal)
	}

}
