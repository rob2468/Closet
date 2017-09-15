//
//  ViewController.swift
//  Closet
//
//  Created by chenjun on 21/06/2017.
//  Copyright © 2017 chenjun. All rights reserved.
//

import UIKit

class CJRootController: UIViewController {
    
    var rootNav: UINavigationController!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let homeController = CJHomeController()
        self.rootNav = UINavigationController(rootViewController: homeController)
        self.rootNav.view.frame = self.view.bounds;
        self.rootNav.view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, .flexibleHeight]
        self.rootNav.isNavigationBarHidden = true
        self.view.addSubview(self.rootNav.view);
    }
    
    class func fetchRootController() -> CJRootController? {
        let rootController = UIApplication.shared.keyWindow?.rootViewController as? CJRootController
        return rootController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

