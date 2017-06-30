//
//  CJCategoryController.swift
//  Closet
//
//  Created by chenjun on 30/06/2017.
//  Copyright © 2017 chenjun. All rights reserved.
//
// 首页分类面板

import UIKit
private let kPannelViewWidth = 280.0            // 分类面板宽度

protocol CJCategoryControllerDelegate {
    func closePannel() -> Void
}

class CJCategoryController: UIViewController {

    var pannelView: UIView!
    var delegate: CJCategoryControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
        self.view.isUserInteractionEnabled = true
        
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(backgroundViewTouched))
        self.view.addGestureRecognizer(tapGes)
        
        // pannelView
        self.pannelView = UIView()
        var frame = self.view.bounds
        frame.origin.x = -(CGFloat)(kPannelViewWidth)
        frame.size.width = CGFloat(kPannelViewWidth)
        self.pannelView.frame = frame
        self.pannelView.backgroundColor = UIColor.white
        self.pannelView.autoresizingMask = UIViewAutoresizing.flexibleRightMargin
        self.view.addSubview(self.pannelView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.3) { 
            // 渐现
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
            // 平移
            var frame = self.pannelView.frame
            frame.origin.x = 0
            self.pannelView.frame = frame
        }
    }
    
    func backgroundViewTouched() {
        UIView.animate(withDuration: 0.2, animations: { 
            // 渐隐
            self.view.backgroundColor = UIColor.clear
            // 平移
            var frame = self.pannelView.frame
            frame.origin.x = -(CGFloat)(kPannelViewWidth)
            self.pannelView.frame = frame
        }) { (Bool) in
            self.delegate?.closePannel()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
