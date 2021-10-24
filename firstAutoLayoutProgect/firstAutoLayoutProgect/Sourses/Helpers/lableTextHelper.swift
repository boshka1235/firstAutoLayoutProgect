//
//  lableTextHelper.swift
//  firstAutoLayoutProgect
//
//  Created by Oatmeal Simon on 10/24/21.
//  Copyright © 2021 Oatmeal Simon. All rights reserved.
//

import Foundation
import UIKit

func textHelper(text: UILabel, backgroundColor: UIColor?, textAligment: NSTextAlignment?, attributedText: NSAttributedString?, textColor: UIColor?, font: UIFont?){
	text.backgroundColor = backgroundColor
	text.textAlignment = textAligment!
	text.textColor = textColor
	text.font = font
	text.attributedText = attributedText
	if backgroundColor != nil {
		text.backgroundColor = backgroundColor
	}

	if textAligment != nil {
		text.textAlignment = textAligment!
	}

	if textColor != nil {
		text.textColor = textColor
	}

	if font != nil {
		text.font = font
	}

	if attributedText != nil {
		text.attributedText = attributedText    }
}
