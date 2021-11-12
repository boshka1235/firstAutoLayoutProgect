//
//  MainViewController.swift
//  firstAutoLayoutProgect
//
//  Created by Oatmeal Simon on 10/23/21.
//  Copyright © 2021 Oatmeal Simon. All rights reserved.
//
import Foundation
import UIKit

final class LayoutController: UIViewController {
	
	// MARK: Scroll&&Container
	private lazy var scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.backgroundColor = .white
		scrollView.frame = self.view.bounds
		return scrollView
	}()
	
	let contView = UIView()
	
	// MARK: Tab Bar
	private lazy var tabBarView: UILabel = {
		let tabBarView = UILabel()
		tabBarView.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
		tabBarView.layer.cornerRadius = 100
		return tabBarView
	}()
	
	private lazy var introButtonTab: UIButton = {
		let introButtonTab = UIButton()
		introButtonTab.addTarget(self, action: #selector(introDidTab), for: .touchUpInside)
		introButtonTab.backgroundColor = .orange
		introButtonTab.setTitle("Intro", for: .normal)
		introButtonTab.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
		introButtonTab.layer.masksToBounds = true
		introButtonTab.layer.cornerRadius = 16
		return introButtonTab
	}()

	private lazy var ingredientsButtonTab: UIButton = {
		let ingredientsButtonTab = UIButton()
		ingredientsButtonTab.addTarget(self, action: #selector(ingredientsDidTab), for: .touchUpInside)
		ingredientsButtonTab.backgroundColor = .white
		ingredientsButtonTab.setTitle("Ingredients", for: .normal)
		ingredientsButtonTab.setTitleColor(UIColor(red: 0.39, green: 0.403, blue: 0.451, alpha: 1), for: .normal)
		ingredientsButtonTab.layer.masksToBounds = true
		ingredientsButtonTab.layer.cornerRadius = 16
		return ingredientsButtonTab
	}()

	private lazy var stepsButtonTab: UIButton = {
		let stepsButtonTab = UIButton()
		stepsButtonTab.addTarget(self, action: #selector(stepsDidTab), for: .touchUpInside)
		stepsButtonTab.backgroundColor = .white
		stepsButtonTab.setTitle("Steps", for: .normal)
		stepsButtonTab.setTitleColor(UIColor(red: 0.39, green: 0.403, blue: 0.451, alpha: 1), for: .normal)
		stepsButtonTab.layer.masksToBounds = true
		stepsButtonTab.layer.cornerRadius = 16
		return stepsButtonTab
	}()
	
	// MARK: Main Lable/Frame 73
	private lazy var mainView: UIView = {
		let mainView = UIView()
		mainView.backgroundColor = .white
		mainView.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
		return mainView
	}()
	
	// TitleBlock/Frame 71
	let titleView = UILabel()
	
	private lazy var titleTextView: UILabel = {
		let titleTextView = UILabel()
		textHelper(text: titleTextView, backgroundColor: .white, textAligment: .center, attributedText: NSMutableAttributedString(string: "Title", attributes: [NSAttributedString.Key.kern: 0.32]), textColor: UIColor(red: 0.39, green: 0.403, blue: 0.451, alpha: 1), font: UIFont(name: "CeraPro-Regular", size: 14))
		return titleTextView
	}()
	
	private lazy var titleStringTextView: UILabel = {
		let titleStringTextView = UILabel()
		textHelper(text: titleStringTextView, backgroundColor: .white, textAligment: .left, attributedText: NSMutableAttributedString(string: "Menu Makan Malam: Sup Makaroni", attributes: [NSAttributedString.Key.kern: 0.37]), textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1), font: UIFont(name: "CeraPro-Regular", size: 16))
		return titleStringTextView
	}()
	
	// MARK: CookTimeBlock/Frame 80
	private lazy var cookTimeView: UILabel = {
		let cookTimeView = UILabel()
		textHelper(text: cookTimeView, backgroundColor: .white, textAligment: .left, attributedText: NSMutableAttributedString(string: "Cook Time", attributes: [NSAttributedString.Key.kern: 0.32]), textColor: UIColor(red: 0.39, green: 0.403, blue: 0.451, alpha: 1), font: UIFont(name: "CeraPro-Regular", size: 14))
		return cookTimeView
	}()
	
	let frame80View = UILabel()
	let minutesView = UILabel()
	
	private lazy var minutesTextView: UILabel = {
		let minutesTextView = UILabel()
		textHelper(text: minutesTextView, backgroundColor: .white, textAligment: .left, attributedText: NSMutableAttributedString(string: "minutes", attributes: [NSAttributedString.Key.kern: 0.32]), textColor: UIColor(red: 0.39, green: 0.403, blue: 0.451, alpha: 1), font: UIFont(name: "CeraPro-Regular", size: 14))
		return minutesTextView
	}()
	
	private lazy var minutesSecondTextView: UILabel = {
		let minutesSecondTextView = UILabel()
		textHelper(text: minutesSecondTextView, backgroundColor: .white, textAligment: .left, attributedText: NSMutableAttributedString(string: "40", attributes: [NSAttributedString.Key.kern: 0.37]), textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1), font: UIFont(name: "CeraPro-Regular", size: 16))
		return minutesSecondTextView
	}()
	
	let hoursView = UILabel()
	
	private lazy var hoursTextView: UILabel = {
		let hoursTextView = UILabel()
		textHelper(text: hoursTextView, backgroundColor: .white, textAligment: .left, attributedText: NSMutableAttributedString(string: "hours", attributes: [NSAttributedString.Key.kern: 0.32]), textColor: UIColor(red: 0.39, green: 0.403, blue: 0.451, alpha: 1), font: UIFont(name: "CeraPro-Regular", size: 14))
		return hoursTextView
	}()
	
	private lazy var hoursSecondTextView: UILabel = {
		let hoursSecondTextView = UILabel()
		textHelper(text: hoursSecondTextView, backgroundColor: .white, textAligment: .left, attributedText: NSMutableAttributedString(string: "0", attributes: [NSAttributedString.Key.kern: 0.37]), textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1), font: UIFont(name: "CeraPro-Regular", size: 16))
		return hoursSecondTextView
	}()
	
	//MARK: Image/Frame 78
	let imageView = UILabel()
	
	private lazy var myImageView: UIImageView = {
		let soupImage = UIImage(named: "SupMakaroni")
		let myImageView = UIImageView(image: soupImage)
		return myImageView
	}()
	
	private lazy var imageButtonTab: UIButton = {
		let imageButtonTab = UIButton()
		imageButtonTab.backgroundColor = .white
		imageButtonTab.layer.masksToBounds = true
		imageButtonTab.layer.cornerRadius = 10
		return imageButtonTab
	}()
	
	private lazy var buttonImage: UIImageView = {
		let pencilImage = UIImage(named: "Pencil")
		let buttonImage = UIImageView(image: pencilImage)
		return buttonImage
		
	}()
	
	//MARK: Description/Frame 75
	let descriptionView = UILabel()
	
	private lazy var descriptionTitleView: UILabel = {
		let descriptionTitleView = UILabel()
		textHelper(text: descriptionTitleView, backgroundColor: .white, textAligment: .left, attributedText: NSMutableAttributedString(string: "Description ", attributes: [NSAttributedString.Key.kern: 0.32]), textColor: UIColor(red: 0.39, green: 0.403, blue: 0.451, alpha: 1), font: UIFont(name: "CeraPro-Regular", size: 14))
		return descriptionTitleView
	}()
	
	private lazy var descriptionTextView: UILabel = {
		let descriptionTextView = UILabel()
		descriptionTextView.numberOfLines = 0
		descriptionTextView.lineBreakMode = .byWordWrapping
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.lineHeightMultiple = 1.19
		textHelper(text: descriptionTextView, backgroundColor: .white, textAligment: .left, attributedText: NSMutableAttributedString(string: "Membuat hidangan dengan bahan sayuran bisa jadi pilihan Sahabat Mallika. Sup makaroni dengan sayuran juga sangat cocok menu hidangan makan malam hari ini. Berikut bahan dan cara membuat sup makaroni. ", attributes: [NSAttributedString.Key.kern: 0.37, NSAttributedString.Key.paragraphStyle: paragraphStyle]), textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1), font: UIFont(name: "CeraPro-Regular", size: 16))
		return descriptionTextView
	}()
	
	//MARK: Difficulty&&Serve/Frame 95
	let difficulView = UILabel()
	
	private lazy var difficultTextView: UILabel = {
		let difficultTextView = UILabel()
		textHelper(text: difficultTextView, backgroundColor: .white, textAligment: .left, attributedText: NSMutableAttributedString(string: "Difficulty", attributes: [NSAttributedString.Key.kern: 0.32]), textColor: UIColor(red: 0.39, green: 0.403, blue: 0.451, alpha: 1), font: UIFont(name: "CeraPro-Regular", size: 14))
		return difficultTextView
	}()
	
	
	private lazy var difficultSecondTextView: UILabel = {
		let difficultSecondTextView = UILabel()
		textHelper(text: difficultSecondTextView, backgroundColor: .white, textAligment: .left, attributedText: NSMutableAttributedString(string: "Easy", attributes: [NSAttributedString.Key.kern: 0.37]), textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1), font: UIFont(name: "CeraPro-Regular", size: 16))
		return difficultSecondTextView
	}()
	
	
	let serveView = UILabel()
	
	private lazy var serveTextView: UILabel = {
		let serveTextView = UILabel()
		textHelper(text: serveTextView, backgroundColor: .white, textAligment: .left, attributedText: NSMutableAttributedString(string: "Serve", attributes: [NSAttributedString.Key.kern: 0.32]), textColor: UIColor(red: 0.39, green: 0.403, blue: 0.451, alpha: 1), font: UIFont(name: "CeraPro-Regular", size: 14))
		return serveTextView
	}()
	
	
	private lazy var serveSecondTextView: UILabel = {
		let serveSecondTextView = UILabel()
		textHelper(text: serveSecondTextView, backgroundColor: .white, textAligment: .left, attributedText: NSMutableAttributedString(string: "2 People", attributes: [NSAttributedString.Key.kern: 0.37]), textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1), font: UIFont(name: "CeraPro-Regular", size: 16))
		return serveSecondTextView
	}()
	
	//MARK: Publishing/Frame 76
	let publishingView = UILabel()
	
	private lazy var publishingTextView: UILabel = {
		let publishingTextView = UILabel()
		textHelper(text: publishingTextView, backgroundColor: .white, textAligment: .left, attributedText: NSMutableAttributedString(string: "Publish to Community?", attributes: [NSAttributedString.Key.kern: 0.32]), textColor: UIColor(red: 0.39, green: 0.403, blue: 0.451, alpha: 1), font: UIFont(name: "CeraPro-Regular", size: 14))
		return publishingTextView
	}()
	
	let mainSwitch = UISwitch()
	
	//MARK: Source/Frame 96
	let sourceView = UILabel()
	
	private lazy var sourceTextView: UILabel = {
		let sourceTextView = UILabel()
		textHelper(text: sourceTextView, backgroundColor: .white, textAligment: .left, attributedText: NSMutableAttributedString(string: "Source", attributes: [NSAttributedString.Key.kern: 0.32]), textColor: UIColor(red: 0.39, green: 0.403, blue: 0.451, alpha: 1), font: UIFont(name: "CeraPro-Regular", size: 14))
		return sourceTextView
	}()
	
	private lazy var sourceSecondTextView: UILabel = {
		let sourceSecondTextView = UILabel()
		textHelper(text: sourceSecondTextView, backgroundColor: .white, textAligment: .left, attributedText: NSMutableAttributedString(string: "Fimela", attributes: [NSAttributedString.Key.kern: 0.37]), textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1), font: UIFont(name: "CeraPro-Regular", size: 16))
		return sourceSecondTextView
	}()

	//MARK: Url/Frame 77
	let urlView = UILabel()
	
	private lazy var urlTitleView: UILabel = {
		let urlTitleView = UILabel()
		textHelper(text: urlTitleView, backgroundColor: .white, textAligment: .left, attributedText: NSMutableAttributedString(string: "URL", attributes: [NSAttributedString.Key.kern: 0.32]), textColor: UIColor(red: 0.39, green: 0.403, blue: 0.451, alpha: 1), font: UIFont(name: "CeraPro-Regular", size: 14))
		return urlTitleView
	}()
	
	private lazy var urlTextView: UILabel = {
		let urlTextView = UILabel()
		textHelper(text: urlTextView, backgroundColor: .white, textAligment: .left, attributedText: NSMutableAttributedString(string: "https://www.fimela.com/lifestyle-relationsh", attributes: [NSAttributedString.Key.kern: 0.37]), textColor: UIColor(red: 0.702, green: 0.708, blue: 0.728, alpha: 1), font: UIFont(name: "CeraPro-Regular", size: 16))
		return urlTextView
	}()
	
	private let secondView = UIView()
	private var secondTable = UITableView()
	private let thirdView = UIView()
	private var thirdTable = UITableView()
	var secondViewArray = [String]()
	var thirdViewArray = [String]()
	
	override func viewDidLoad() {
	super.viewDidLoad()
	view.backgroundColor = .white
	title = "Recipe Form"
	let image = UIImage(named: "backButton")?.withRenderingMode(.alwaysOriginal)
	navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain , target: self, action: nil)
	navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: nil)
	navigationItem.rightBarButtonItem?.tintColor = .orange

	view.addSubview(contView)
	
	mainScrollView()
	containerView()
	secondMainView()
	configureTableView()
	thirdMainView()
	configureSecondTableView()
	
	// MARK: Tab Bar
	anchorHelper(label: tabBarView, parentLabel: contView, topAnchorLabel: contView.topAnchor, bottomAnchorLabel: contView.bottomAnchor, leadingAnchorLabel: contView.leadingAnchor, trailingAnchorLabel: contView.trailingAnchor, topAnchor: 0, leadingConstant: 8, trailingConstant: -8, widthConstant: nil, heightConstant: 52, bottomAnchor: nil)

		anchorHelper(label: introButtonTab, parentLabel: view, topAnchorLabel: tabBarView.topAnchor, bottomAnchorLabel: tabBarView.bottomAnchor, leadingAnchorLabel: tabBarView.leadingAnchor, trailingAnchorLabel: nil, topAnchor: 8, leadingConstant: 8, trailingConstant: nil, widthConstant: 103.5, heightConstant: 36, bottomAnchor: nil, backgroundColor: .orange)
	
		anchorHelper(label: ingredientsButtonTab, parentLabel: view, topAnchorLabel: tabBarView.topAnchor, bottomAnchorLabel: nil, leadingAnchorLabel: tabBarView.centerXAnchor, trailingAnchorLabel: nil, topAnchor: 8, leadingConstant: -60, trailingConstant: nil, widthConstant: 120, heightConstant: 36, bottomAnchor: nil)

		anchorHelper(label: stepsButtonTab, parentLabel: view, topAnchorLabel: tabBarView.topAnchor, bottomAnchorLabel: nil, leadingAnchorLabel: nil, trailingAnchorLabel: tabBarView.trailingAnchor, topAnchor: 8, leadingConstant: nil, trailingConstant: -8, widthConstant: 103.5, heightConstant: 36, bottomAnchor: nil)
	
	// MARK: Main Lable/Frame 73
	anchorHelper(label: mainView, parentLabel: contView, topAnchorLabel: contView.topAnchor, bottomAnchorLabel: nil, leadingAnchorLabel: contView.leadingAnchor, trailingAnchorLabel: contView.trailingAnchor, topAnchor: 54.5, leadingConstant: 0, trailingConstant: 0, widthConstant: nil, heightConstant: 898.53, bottomAnchor: nil)
	
	
	// TitleBlock/Frame 71
	anchorHelper(label: titleView, parentLabel: mainView, topAnchorLabel: mainView.topAnchor, bottomAnchorLabel: mainView.bottomAnchor, leadingAnchorLabel: mainView.leadingAnchor, trailingAnchorLabel: mainView.trailingAnchor, topAnchor: 16, leadingConstant: 16, trailingConstant: nil, widthConstant: nil, heightConstant: 48, bottomAnchor: nil)

	anchorHelper(label: titleTextView, parentLabel: titleView, topAnchorLabel: titleView.topAnchor, bottomAnchorLabel: titleView.bottomAnchor, leadingAnchorLabel: titleView.leadingAnchor, trailingAnchorLabel: titleView.trailingAnchor, topAnchor: 0, leadingConstant: 0, trailingConstant: -345.5, widthConstant: nil, heightConstant: 18, bottomAnchor: nil)
	
	anchorHelper(label: titleStringTextView, parentLabel: titleView, topAnchorLabel: titleView.topAnchor, bottomAnchorLabel: titleView.bottomAnchor, leadingAnchorLabel: titleView.leadingAnchor, trailingAnchorLabel: titleView.trailingAnchor, topAnchor: 24, leadingConstant: 0, trailingConstant: 0, widthConstant: nil, heightConstant: 20, bottomAnchor: nil)
	
	
	// MARK: CookTimeBlock/Frame 80
	anchorHelper(label: frame80View, parentLabel: mainView, topAnchorLabel: mainView.topAnchor, bottomAnchorLabel: mainView.bottomAnchor, leadingAnchorLabel: mainView.leadingAnchor, trailingAnchorLabel: mainView.trailingAnchor, topAnchor: 88, leadingConstant: 16, trailingConstant: -16, widthConstant: nil, heightConstant: 74, bottomAnchor: nil)
	
	anchorHelper(label: cookTimeView, parentLabel: frame80View, topAnchorLabel: frame80View.topAnchor, bottomAnchorLabel: frame80View.bottomAnchor, leadingAnchorLabel: frame80View.leadingAnchor, trailingAnchorLabel: frame80View.trailingAnchor, topAnchor: 0, leadingConstant: 0, trailingConstant: nil, widthConstant: nil, heightConstant: nil, bottomAnchor: nil)
	
	anchorHelper(label: minutesView, parentLabel: frame80View, topAnchorLabel: frame80View.topAnchor, bottomAnchorLabel: frame80View.bottomAnchor, leadingAnchorLabel: frame80View.leadingAnchor, trailingAnchorLabel: frame80View.trailingAnchor, topAnchor: 26, leadingConstant: 0, trailingConstant: -218, widthConstant: nil, heightConstant: 48, bottomAnchor: nil)
	
	anchorHelper(label: minutesTextView, parentLabel: minutesView, topAnchorLabel: minutesView.topAnchor, bottomAnchorLabel: minutesView.bottomAnchor, leadingAnchorLabel: minutesView.leadingAnchor, trailingAnchorLabel: minutesView.trailingAnchor, topAnchor: 0, leadingConstant: 0, trailingConstant: nil, widthConstant: nil, heightConstant: nil, bottomAnchor: nil)
	
	anchorHelper(label: minutesSecondTextView, parentLabel: minutesView, topAnchorLabel: minutesView.topAnchor, bottomAnchorLabel: minutesView.bottomAnchor, leadingAnchorLabel: minutesView.leadingAnchor, trailingAnchorLabel: minutesView.trailingAnchor, topAnchor: 24, leadingConstant: 0, trailingConstant: 0, widthConstant: nil, heightConstant: nil, bottomAnchor: -4)
	
	anchorHelper(label: hoursView, parentLabel: frame80View, topAnchorLabel: frame80View.topAnchor, bottomAnchorLabel: frame80View.bottomAnchor, leadingAnchorLabel: frame80View.leadingAnchor, trailingAnchorLabel: frame80View.trailingAnchor, topAnchor: 26, leadingConstant: 218, trailingConstant: 0, widthConstant: nil, heightConstant: 48, bottomAnchor: nil)
	
	anchorHelper(label: hoursTextView, parentLabel: hoursView, topAnchorLabel: hoursView.topAnchor, bottomAnchorLabel: hoursView.bottomAnchor, leadingAnchorLabel: hoursView.leadingAnchor, trailingAnchorLabel: hoursView.trailingAnchor, topAnchor: 0, leadingConstant: 0, trailingConstant: nil, widthConstant: nil, heightConstant: nil, bottomAnchor: nil)
	
	anchorHelper(label: hoursSecondTextView, parentLabel: hoursView, topAnchorLabel: hoursView.topAnchor, bottomAnchorLabel: hoursView.bottomAnchor, leadingAnchorLabel: hoursView.leadingAnchor, trailingAnchorLabel: hoursView.trailingAnchor, topAnchor: 24, leadingConstant: 0, trailingConstant: 0, widthConstant: nil, heightConstant: nil, bottomAnchor: -4)
	
	
	//MARK: Image/Frame 78
	anchorHelper(label: imageView, parentLabel: mainView, topAnchorLabel: mainView.topAnchor, bottomAnchorLabel: mainView.bottomAnchor, leadingAnchorLabel: mainView.leadingAnchor, trailingAnchorLabel: mainView.trailingAnchor, topAnchor: 186, leadingConstant: 16, trailingConstant: -16, widthConstant: nil, heightConstant: 207.88, bottomAnchor: nil)
	
	anchorHelper(label: imageButtonTab, parentLabel: mainView, topAnchorLabel: imageView.topAnchor, bottomAnchorLabel: nil, leadingAnchorLabel: nil, trailingAnchorLabel: imageView.trailingAnchor, topAnchor: 17, leadingConstant: nil, trailingConstant: -15.45, widthConstant: 48, heightConstant: 48, bottomAnchor: nil)
	
	anchorHelper(label: buttonImage, parentLabel: imageButtonTab, topAnchorLabel: imageButtonTab.topAnchor, bottomAnchorLabel: imageButtonTab.bottomAnchor, leadingAnchorLabel: imageButtonTab.leadingAnchor, trailingAnchorLabel: imageButtonTab.trailingAnchor, topAnchor: 6, leadingConstant: 6, trailingConstant: -6, widthConstant: nil, heightConstant: nil, bottomAnchor: -6)
	
	anchorHelper(label: myImageView, parentLabel: imageView, topAnchorLabel: imageView.topAnchor, bottomAnchorLabel: imageView.bottomAnchor, leadingAnchorLabel: imageView.leadingAnchor, trailingAnchorLabel: imageView.trailingAnchor, topAnchor: 0, leadingConstant: 0, trailingConstant: 0, widthConstant: nil, heightConstant: nil, bottomAnchor: 0)
	
	
	//MARK: Description/Frame 75
	anchorHelper(label: descriptionView, parentLabel: mainView, topAnchorLabel: imageView.bottomAnchor, bottomAnchorLabel: nil, leadingAnchorLabel: mainView.leadingAnchor, trailingAnchorLabel: mainView.trailingAnchor, topAnchor: 24, leadingConstant: 16, trailingConstant: -16, widthConstant: nil, heightConstant: 172, bottomAnchor: nil)
	
	anchorHelper(label: descriptionTitleView, parentLabel: descriptionView, topAnchorLabel: descriptionView.topAnchor, bottomAnchorLabel: descriptionView.bottomAnchor, leadingAnchorLabel: descriptionView.leadingAnchor, trailingAnchorLabel: descriptionView.trailingAnchor, topAnchor: 0, leadingConstant: 0, trailingConstant: nil, widthConstant: nil, heightConstant: nil, bottomAnchor: nil)
	
	anchorHelper(label: descriptionTextView, parentLabel: descriptionView, topAnchorLabel: descriptionView.topAnchor, bottomAnchorLabel: descriptionView.bottomAnchor, leadingAnchorLabel: descriptionView.leadingAnchor, trailingAnchorLabel: descriptionView.trailingAnchor, topAnchor: 24, leadingConstant: 0, trailingConstant: 0, widthConstant: nil, heightConstant: nil, bottomAnchor: -4)
	
	
	//MARK: Difficulty&&Serve/Frame 95
	anchorHelper(label: difficulView, parentLabel: mainView, topAnchorLabel: descriptionView.bottomAnchor, bottomAnchorLabel: nil, leadingAnchorLabel: mainView.leadingAnchor, trailingAnchorLabel: mainView.trailingAnchor, topAnchor: 24, leadingConstant: 16, trailingConstant: -222.5, widthConstant: nil, heightConstant: 52, bottomAnchor: nil)
	
	anchorHelper(label: difficultTextView, parentLabel: difficulView, topAnchorLabel: difficulView.topAnchor, bottomAnchorLabel: difficulView.bottomAnchor, leadingAnchorLabel: difficulView.leadingAnchor, trailingAnchorLabel: difficulView.trailingAnchor, topAnchor: 0, leadingConstant: 0, trailingConstant: nil, widthConstant: nil, heightConstant: nil, bottomAnchor: nil)
	
	anchorHelper(label: difficultSecondTextView, parentLabel: difficulView, topAnchorLabel: difficulView.topAnchor, bottomAnchorLabel: difficulView.bottomAnchor, leadingAnchorLabel: difficulView.leadingAnchor, trailingAnchorLabel: difficulView.trailingAnchor, topAnchor: 24, leadingConstant: 0, trailingConstant: 0, widthConstant: nil, heightConstant: nil, bottomAnchor: -4)

	anchorHelper(label: serveView, parentLabel: mainView, topAnchorLabel: descriptionView.bottomAnchor, bottomAnchorLabel: nil, leadingAnchorLabel: mainView.leadingAnchor, trailingAnchorLabel: mainView.trailingAnchor, topAnchor: 24, leadingConstant: 222.5, trailingConstant: 0, widthConstant: nil, heightConstant: 52, bottomAnchor: nil)
	
	anchorHelper(label: serveTextView, parentLabel: serveView, topAnchorLabel: serveView.topAnchor, bottomAnchorLabel: serveView.bottomAnchor, leadingAnchorLabel: serveView.leadingAnchor, trailingAnchorLabel: serveView.trailingAnchor, topAnchor: 0, leadingConstant: 0, trailingConstant: nil, widthConstant: nil, heightConstant: nil, bottomAnchor: nil)

	anchorHelper(label: serveSecondTextView, parentLabel: serveView, topAnchorLabel: serveView.topAnchor, bottomAnchorLabel: serveView.bottomAnchor, leadingAnchorLabel: serveView.leadingAnchor, trailingAnchorLabel: serveView.trailingAnchor, topAnchor: 24, leadingConstant: 0, trailingConstant: 0, widthConstant: nil, heightConstant: nil, bottomAnchor: -4)
	
	
	//MARK: Publishing/Frame 76
	anchorHelper(label: publishingView, parentLabel: mainView, topAnchorLabel: serveView.bottomAnchor, bottomAnchorLabel: nil, leadingAnchorLabel: mainView.leadingAnchor, trailingAnchorLabel: mainView.trailingAnchor, topAnchor: 24, leadingConstant: 16, trailingConstant: -16, widthConstant: nil, heightConstant: 24.65, bottomAnchor: nil)
	
	anchorHelper(label: publishingTextView, parentLabel: publishingView, topAnchorLabel: publishingView.topAnchor, bottomAnchorLabel: publishingView.bottomAnchor, leadingAnchorLabel: publishingView.leadingAnchor, trailingAnchorLabel: publishingView.trailingAnchor, topAnchor: 3.32, leadingConstant: 0, trailingConstant: nil, widthConstant: nil, heightConstant: nil, bottomAnchor: nil)
	
	anchorHelper(label: mainSwitch, parentLabel: mainView, topAnchorLabel: publishingView.topAnchor, bottomAnchorLabel: publishingView.bottomAnchor, leadingAnchorLabel: nil, trailingAnchorLabel: publishingView.trailingAnchor, topAnchor: 3.32, leadingConstant: nil, trailingConstant: 0, widthConstant: nil, heightConstant: nil, bottomAnchor: -3.32)
	
	
	//MARK: Source/Frame 96
	anchorHelper(label: sourceView, parentLabel: mainView, topAnchorLabel: publishingView.bottomAnchor, bottomAnchorLabel: nil, leadingAnchorLabel: mainView.leadingAnchor, trailingAnchorLabel: mainView.trailingAnchor, topAnchor: 24, leadingConstant: 16, trailingConstant: -16, widthConstant: nil, heightConstant: 48, bottomAnchor: nil)
	
	anchorHelper(label: sourceTextView, parentLabel: sourceView, topAnchorLabel: sourceView.topAnchor, bottomAnchorLabel: sourceView.bottomAnchor, leadingAnchorLabel: sourceView.leadingAnchor, trailingAnchorLabel: sourceView.trailingAnchor, topAnchor: 0, leadingConstant: 0, trailingConstant: -100, widthConstant: nil, heightConstant: nil, bottomAnchor: nil)
	
	anchorHelper(label: sourceSecondTextView, parentLabel: sourceView, topAnchorLabel: sourceView.topAnchor, bottomAnchorLabel: sourceView.bottomAnchor, leadingAnchorLabel: sourceView.leadingAnchor, trailingAnchorLabel: sourceView.trailingAnchor, topAnchor: 24, leadingConstant: 0, trailingConstant: 0, widthConstant: nil, heightConstant: nil, bottomAnchor: -4)
	
	
	//MARK: Url/Frame 77
	anchorHelper(label: urlView, parentLabel: mainView, topAnchorLabel: sourceView.bottomAnchor, bottomAnchorLabel: nil, leadingAnchorLabel: mainView.leadingAnchor, trailingAnchorLabel: mainView.trailingAnchor, topAnchor: 24, leadingConstant: 16, trailingConstant: -16, widthConstant: nil, heightConstant: 48, bottomAnchor: nil)
	
	anchorHelper(label: urlTextView, parentLabel: urlView, topAnchorLabel: urlView.topAnchor, bottomAnchorLabel: urlView.bottomAnchor, leadingAnchorLabel: urlView.leadingAnchor, trailingAnchorLabel: urlView.trailingAnchor, topAnchor: 24, leadingConstant: 0, trailingConstant: 0, widthConstant: nil, heightConstant: nil, bottomAnchor: nil)

	anchorHelper(label: urlTitleView, parentLabel: urlView, topAnchorLabel: urlView.topAnchor, bottomAnchorLabel: urlView.bottomAnchor, leadingAnchorLabel: urlView.leadingAnchor, trailingAnchorLabel: urlView.trailingAnchor, topAnchor: 0, leadingConstant: 0, trailingConstant: nil, widthConstant: nil, heightConstant: nil, bottomAnchor: nil)

	}
	
	private func mainScrollView() {
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		self.view.addSubview(scrollView)
	
		NSLayoutConstraint.activate([
			scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
			scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
			scrollView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0),
			scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 0)
			])
	}
	
	private func containerView(){
		contView.translatesAutoresizingMaskIntoConstraints = false
		scrollView.addSubview(contView)
		  
		NSLayoutConstraint.activate([
			contView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
			contView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
			contView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: 0),
			contView.heightAnchor.constraint(equalToConstant: 950),
			contView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0)
			])
	}
	
	private func secondMainView() {
		anchorHelper(label: secondView, parentLabel: contView, topAnchorLabel: contView.topAnchor, bottomAnchorLabel: nil, leadingAnchorLabel: contView.leadingAnchor, trailingAnchorLabel: contView.trailingAnchor, topAnchor: 54.5, leadingConstant: 0, trailingConstant: 0, widthConstant: nil, heightConstant: 898.53, bottomAnchor: nil, backgroundColor: .black)
		secondView.isHidden = true
	}
	
	private func thirdMainView(){
		anchorHelper(label: thirdView, parentLabel: contView, topAnchorLabel: contView.topAnchor, bottomAnchorLabel: nil, leadingAnchorLabel: contView.leadingAnchor, trailingAnchorLabel: contView.trailingAnchor, topAnchor: 54.5, leadingConstant: 0, trailingConstant: 0, widthConstant: nil, heightConstant: 898.53, bottomAnchor: nil, backgroundColor: .black)
		thirdView.isHidden = true
	}

	private func thirdTableView(){
		anchorHelper(label: thirdTable, parentLabel: thirdView, topAnchorLabel: thirdView.topAnchor, bottomAnchorLabel: nil, leadingAnchorLabel: thirdView.leadingAnchor, trailingAnchorLabel: thirdView.trailingAnchor, topAnchor: 0, leadingConstant: 0, trailingConstant: 0, widthConstant: nil, heightConstant: 898.53, bottomAnchor: nil)
	}

	@objc private func introDidTab() {
		introButtonTab.backgroundColor = .orange
		introButtonTab.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
		changeIngredientsButton()
		changeStepsButton()
		
		UIView.transition(with: mainView, duration: 0.6, options: [.curveEaseOut, .transitionCrossDissolve], animations: {self.mainView.isHidden = false
			self.secondView.isHidden = true
			self.thirdView.isHidden = true}, completion: nil)
	}
	
	@objc private func ingredientsDidTab() {
		ingredientsButtonTab.backgroundColor = .orange
		ingredientsButtonTab.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
		changeStepsButton()
		changeIntroButton()
		
		UIView.transition(with: secondView, duration: 0.6, options: [.curveEaseOut, .transitionCrossDissolve], animations: {self.mainView.isHidden = true
			self.secondView.isHidden = false
			self.thirdView.isHidden = true}, completion: nil)
		
	}
	
	@objc private func stepsDidTab() {
		stepsButtonTab.backgroundColor = .orange
		stepsButtonTab.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
		changeIngredientsButton()
		changeIntroButton()
		
		UIView.transition(with: thirdView, duration: 0.6, options: [ .curveEaseOut, .transitionCrossDissolve], animations: {self.mainView.isHidden = true
		self.secondView.isHidden = true
		self.thirdView.isHidden = false}, completion: nil)
	}
	
	private func changeIntroButton(){
		introButtonTab.backgroundColor = .white
		introButtonTab.setTitleColor(UIColor(red: 0.39, green: 0.403, blue: 0.451, alpha: 1), for: .normal)
	}
	
	private func changeIngredientsButton(){
		ingredientsButtonTab.backgroundColor = .white
		ingredientsButtonTab.setTitleColor(UIColor(red: 0.39, green: 0.403, blue: 0.451, alpha: 1), for: .normal)
	}
	
	private func changeStepsButton(){
		stepsButtonTab.backgroundColor = .white
		stepsButtonTab.setTitleColor(UIColor(red: 0.39, green: 0.403, blue: 0.451, alpha: 1), for: .normal)
	}
	
	// MARK: firstTableView
	
	func firstTableViewDelegates() {
		secondTable.dataSource = self
		secondTable.delegate = self
	}
	
	func configureTableView() {
		firstTableViewDelegates()
		secondTable.separatorStyle = .none
		secondTable.register(Cell.self, forCellReuseIdentifier: "Cell")
		anchorHelper(label: secondTable, parentLabel: secondView, topAnchorLabel: secondView.topAnchor, bottomAnchorLabel: nil, leadingAnchorLabel: secondView.leadingAnchor, trailingAnchorLabel: secondView.trailingAnchor, topAnchor: 0, leadingConstant: 0, trailingConstant: 0, widthConstant: nil, heightConstant: 898.53, bottomAnchor: nil)
		secondViewArray.append(contentsOf: [
											"Bahan",
											"1 buah wortel, potong-potong",
											"5 potong sayap ayam",
											"200 gr makaroni atau fusilli",
											"air secukupnya",
											"Bumbu",
											"3 siung bawang putih, cincang",
											"2 siung bawang merah, iris tipis",
											"1 batang daun bawang, potong-potong",
											"1 sdt gula1 sdt garam",
											"1/2 sdt kaldu bubuk",
											"1/2 sdt pala bubuk",
											"1/2 sdt lada bubuk",
											"1 batang seledri"
											])
	}
	
	// MARK: secondTableView
	
	func secondTableViewDelegate() {
		thirdTable.dataSource = self
		thirdTable.delegate = self
	}
	
	func configureSecondTableView() {
		secondTableViewDelegate()
		thirdTable.separatorStyle = .none
		thirdTable.register(Cell.self, forCellReuseIdentifier: "Cell")
		anchorHelper(label: thirdTable, parentLabel: thirdView, topAnchorLabel: thirdView.topAnchor, bottomAnchorLabel: nil, leadingAnchorLabel: thirdView.leadingAnchor, trailingAnchorLabel: thirdView.trailingAnchor, topAnchor: 0, leadingConstant: 0, trailingConstant: 0, widthConstant: nil, heightConstant: 898.53, bottomAnchor: nil)
		thirdViewArray.append(contentsOf: [
											"CeraPro-Medium",
											"Setelah dicuci bersih, rebus sayap ayam hingga matang dengan 500 ml air. Buang busanya dan saring untuk dijadikan kaldu. ",
											"Tumis bawang putih, bawang merah dan daun bawang hingga harum. Masukkan pala dan lada bubuk, tumis sebentar. Matikan api. ",
											"Rebus lagi air kaldu, masukkan makaroni dan masak hingga setengah matang. Masukkan wortel dan masak hingga mendidih. ",
											"Masukkan bumbu dan daun seledri. Masak hingga semua bahan matang dan kuah sedap."
											])
	}
}

	extension LayoutController: UITableViewDataSource, UITableViewDelegate {
		
		func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
			if secondTable == tableView{
				return secondViewArray.count
			}
			return thirdViewArray.count
	}

		func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
			if secondTable == tableView {
				let font1 = UIFont.boldSystemFont(ofSize: 20)
				let fontDefault = UIFont.boldSystemFont(ofSize: 16)
				let mainString = secondViewArray[indexPath.row]
				if indexPath.row == 0 || indexPath.row == 5{
					return Cell(text: mainString, font: font1)
				}
				return Cell(text: mainString, font: fontDefault)
			}
				let font1 = UIFont.boldSystemFont(ofSize: 20)
				let fontDefault = UIFont.boldSystemFont(ofSize: 16)
				let mainString = thirdViewArray[indexPath.row]
				if indexPath.row == 0 {
					return Cell(text: mainString, font: font1)
			}
			return Cell(text: mainString, font: fontDefault)
		}
	}
	