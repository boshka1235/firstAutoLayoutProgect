//
//  cellProtocol.swift
//  firstAutoLayoutProgect
//
//  Created by Oatmeal Simon on 10/25/21.
//  Copyright © 2021 Oatmeal Simon. All rights reserved.
//

import Foundation
import UIKit

protocol forCell: AnyObject {
	func addLabel(text: String, font: UIFont)
	func addLeftButton()
	func addRightButton()
}
