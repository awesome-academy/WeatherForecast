//
//  BaseViewController.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/7/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
<<<<<<< HEAD

    init() {
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    deinit {
        debugPrint("deinit \(self.className)")
    }

=======
    
    init() {
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        debugPrint("deinit \(self.className)")
    }
    
>>>>>>> [task][18064]create_ui_search_screen
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    private func configureNavigation() {
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
<<<<<<< HEAD

    func showViewControllerAsDialog(controller: UIViewController, transitionStyle: UIModalTransitionStyle) {
=======
    
    func showViewControllerAsDialog(controller : UIViewController, transitionStyle :UIModalTransitionStyle){
>>>>>>> [task][18064]create_ui_search_screen
        controller.modalTransitionStyle = transitionStyle
        controller.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        self.present(controller, animated: true, completion: nil)
        //        self.navigationController?.pushViewController(controller, animated: true)
    }
<<<<<<< HEAD

    func alertShow(title: String?, message: String?, view: UIViewController, handler: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        let okButton = UIAlertAction(title: "ok", style: .default) { (action) in
            handler?()
        }
        alertController.addAction(cancelButton)
        alertController.addAction(okButton)
        view.present(alertController, animated: true, completion: nil)
    }

=======
    
    func alertShow(title: String?, message: String?,view: UIViewController, handler: (() -> Void)? = nil ) {
        let alertCTL = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelBtn = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        let okBtn = UIAlertAction(title: "ok", style: .default) { (action) in
            handler?()
        }
        alertCTL.addAction(cancelBtn)
        alertCTL.addAction(okBtn)
        view.present(alertCTL, animated: true, completion: nil)
    }
    
>>>>>>> [task][18064]create_ui_search_screen

}
