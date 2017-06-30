//
//  CJCategoryController.swift
//  Closet
//
//  Created by chenjun on 30/06/2017.
//  Copyright © 2017 chenjun. All rights reserved.
//
// 首页分类面板

import UIKit

protocol CJCategoryControllerDelegate {
    func closePannel() -> Void
}

class CJCategoryController: UIViewController {

    private let kPannelViewWidth = 280.0
    var pannelView: UIView!
    var delegate: CJCategoryControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.view.isUserInteractionEnabled = true
        
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(backgroundViewTouched))
        self.view.addGestureRecognizer(tapGes)
        
        // pannelView
        self.pannelView = UIView()
        var frame = self.view.bounds
        frame.size.width = CGFloat(kPannelViewWidth)
        self.pannelView.frame = frame
        self.pannelView.backgroundColor = UIColor.white
        self.pannelView.autoresizingMask = UIViewAutoresizing.flexibleRightMargin
        self.view.addSubview(self.pannelView)
    }
    
    func backgroundViewTouched() {
        self.delegate?.closePannel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
