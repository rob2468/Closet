//
//  CJCategoryManageController.swift
//  Closet
//
//  Created by chenjun on 21/08/2017.
//  Copyright © 2017 chenjun. All rights reserved.
//

import UIKit
private let kHeaderContentViewHeight = 64.0     // 头部引导视图高度
private let kFooterContentViewHeight = 44.0
private let kAddButtonEdgeLength = 34.0

class CJCategoryManageController: UIViewController, CJCategoryAddControllerDelegate {

    var headerContentView: UIView!
    var footerContentView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        // headerContentView
        self.headerContentView = UIView()
        var frame = self.view.bounds
        frame.size.height = CGFloat(kHeaderContentViewHeight)
        self.headerContentView.frame = frame
        self.headerContentView.backgroundColor = UIColor.lightGray
        self.view.addSubview(self.headerContentView)
        
        // “分类管理”
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.text = "分类管理"
        titleLabel.textColor = UIColor.white
        self.headerContentView.addSubview(titleLabel)
        
        self.view.addConstraints([
            NSLayoutConstraint.init(item: titleLabel, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: headerContentView, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: titleLabel, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: headerContentView, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 10)])
        
        // "完成"
        let doneButton = UIButton.init(type: UIButtonType.custom)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        doneButton.setTitle("完成", for: UIControlState.normal)
        doneButton.addTarget(self, action: #selector(doneButtonPressed), for: UIControlEvents.touchUpInside)
        self.headerContentView.addSubview(doneButton)
        
        self.view.addConstraints([
            NSLayoutConstraint.init(item: doneButton, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: headerContentView, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: -17),
            NSLayoutConstraint.init(item: doneButton, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: titleLabel, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)])
        
        // footerContentView
        self.footerContentView = UIView()
        frame = self.view.frame
        frame.origin.y = frame.size.height - CGFloat(kFooterContentViewHeight)
        frame.size.height = CGFloat(kFooterContentViewHeight)
        self.footerContentView.frame = frame
        self.footerContentView.backgroundColor = UIColor.clear
        self.view.addSubview(self.footerContentView)
        
        // addButton
        let addButton = UIButton.init(type: UIButtonType.custom)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        let addButtonColor = UIColor.black
        addButton.layer.borderColor = addButtonColor.cgColor
        addButton.layer.borderWidth = 1.0
        addButton.layer.cornerRadius = CGFloat(kAddButtonEdgeLength / 2.0)
        addButton.setTitleColor(addButtonColor, for: UIControlState.normal)
        addButton.setTitle("+", for: UIControlState.normal)
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        addButton.addTarget(self, action: #selector(addButtonPressed), for: UIControlEvents.touchUpInside)
        self.footerContentView.addSubview(addButton)
        
        self.footerContentView.addConstraints([
            NSLayoutConstraint.init(item: addButton, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.footerContentView, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: addButton, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self.footerContentView, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: addButton, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: self.footerContentView, attribute: NSLayoutAttribute.width, multiplier: 0, constant: CGFloat(kAddButtonEdgeLength)),
            NSLayoutConstraint.init(item: addButton, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: self.footerContentView, attribute: NSLayoutAttribute.height, multiplier: 0, constant: CGFloat(kAddButtonEdgeLength))])
    }
    
    func doneButtonPressed() -> Void {
        self.navigationController?.popViewController(animated: true)
    }
    
    func addButtonPressed() -> Void {
        let addController = CJCategoryAddController()
        addController.delegate = self
        let rootController = UIApplication.shared.keyWindow?.rootViewController
        rootController?.present(addController, animated: true, completion: nil)
    }
    
    // MARK: CJCategoryAddControllerDelegate
    
    func onAddControllerCancel() {
        let rootController = UIApplication.shared.keyWindow?.rootViewController
        rootController?.dismiss(animated: true, completion: nil)
    }
    
    func onAddControllerDone() {
        let rootController = UIApplication.shared.keyWindow?.rootViewController
        rootController?.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
