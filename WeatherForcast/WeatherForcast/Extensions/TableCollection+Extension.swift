//
//  UITableView+Extension.swift
//  Travid
//
//  Created by Tuấn Bờm on 6/2/18.
//  Copyright © 2018 Tuấn Bờm. All rights reserved.
//

import UIKit

extension UITableView {
	
	func registerCells(_ identifiers: String...) {
		for identifier in identifiers {
			self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
		}
	}
    
    func reloadDataNoAnimated() {
        UIView.setAnimationsEnabled(false)
        self.reloadData()
        UIView.setAnimationsEnabled(true)
    }
    
    func reloadSectionNoAnimated(_ section: Int) {
        UIView.setAnimationsEnabled(false)
        self.reloadSections([section], with: .none)
        UIView.setAnimationsEnabled(true)
    }
    
    func reloadRowNoAnimated(_ indexPath: IndexPath) {
        UIView.setAnimationsEnabled(false)
        self.reloadRows(at: [indexPath], with: .none)
        UIView.setAnimationsEnabled(true)
    }
	
	// MARK: - Pull To Refresh
	func addPullToRefresh(_ viewController: UIViewController, tinColor: UIColor = .black, action: Selector) {
		let refreshControl = UIRefreshControl()
		if #available(iOS 10.0, *) {
			self.refreshControl = refreshControl
		} else {
			self.addSubview(refreshControl)
		}
		refreshControl.tintColor = tinColor
		refreshControl.addTarget(viewController, action: action, for: .valueChanged)
	}
	
	func startPullToRefresh() {
		var refreshControl: UIRefreshControl?
		if #available(iOS 10.0, *) {
			refreshControl = self.refreshControl
		} else {
			for view in self.subviews {
				
				if let refreshView = view as? UIRefreshControl {
					refreshControl = refreshView
					break
				}
			}
		}
		guard let refresh = refreshControl else {
			return
		}
		refresh.beginRefreshing()
		self.isUserInteractionEnabled = false
	}
	
	func stopPullToRefresh() {
		var refreshControl: UIRefreshControl?
		if #available(iOS 10.0, *) {
			refreshControl = self.refreshControl
		} else {
			for view in self.subviews {
				
				if let refreshView = view as? UIRefreshControl {
					refreshControl = refreshView
					break
				}
			}
		}
		guard let refresh = refreshControl else {
			return
		}
		refresh.endRefreshing()
		self.isUserInteractionEnabled = true
	}
}

extension UICollectionView {
	
	func registerCells(_ identifiers: String...) {
		for identifier in identifiers {
			self.register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
		}
	}
    
    func reloadDataNoAnimated() {
        UIView.setAnimationsEnabled(false)
        self.reloadData()
        UIView.setAnimationsEnabled(true)
    }
    
    func reloadSectionNoAnimated(_ section: Int) {
        UIView.setAnimationsEnabled(false)
        self.reloadSections([section])
        UIView.setAnimationsEnabled(true)
    }
    
    func reloadRowNoAnimated(_ indexPath: IndexPath) {
        UIView.setAnimationsEnabled(false)
        self.reloadItems(at: [indexPath])
        UIView.setAnimationsEnabled(true)
    }
	// MARK: - Pull To Refresh
	func addPullToRefresh(_ viewController: UIViewController, tinColor: UIColor = .black, action: Selector) {
		let refreshControl = UIRefreshControl()
		if #available(iOS 10.0, *) {
			self.refreshControl = refreshControl
		} else {
			self.addSubview(refreshControl)
		}
		refreshControl.tintColor = tinColor
		refreshControl.addTarget(viewController, action: action, for: .valueChanged)
	}
	
	func startPullToRefresh() {
		var refreshControl: UIRefreshControl?
		if #available(iOS 10.0, *) {
			refreshControl = self.refreshControl
		} else {
			for view in self.subviews {
				
				if let refreshView = view as? UIRefreshControl {
					refreshControl = refreshView
					break
				}
			}
		}
		guard let refresh = refreshControl else {
			return
		}
		refresh.beginRefreshing()
		self.isUserInteractionEnabled = false
	}
	
	func stopPullToRefresh() {
		var refreshControl: UIRefreshControl?
		if #available(iOS 10.0, *) {
			refreshControl = self.refreshControl
		} else {
			for view in self.subviews {
				
				if let refreshView = view as? UIRefreshControl {
					refreshControl = refreshView
					break
				}
			}
		}
		guard let refresh = refreshControl else {
			return
		}
		refresh.endRefreshing()
		self.isUserInteractionEnabled = true
	}
}
