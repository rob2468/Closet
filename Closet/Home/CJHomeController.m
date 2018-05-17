//
//  CJHomeController.m
//  Closet
//
//  Created by chenjun on 2018/5/17.
//  Copyright © 2018年 chenjun. All rights reserved.
//

#import "CJHomeController.h"
#import "CJCategoryController.h"
#import "CJCategoryManageController.h"
#import "CJExhibitController.h"

@interface CJHomeController ()
<CJCategoryControllerDelegate>

@property (strong, nonatomic) UIButton *expandButton; // 展开分类面板按钮
@property (strong, nonatomic) CJExhibitController *exhibitController; // 单品展示视图控制器
@property (strong, nonatomic) CJCategoryController *categoryController; // 分类面板视图控制器

@end

@implementation CJHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;

    self.view.backgroundColor = [UIColor whiteColor];
    
    // exhibitController
    self.exhibitController = [[CJExhibitController alloc] init];
    self.exhibitController.view.frame = self.view.bounds;
    self.exhibitController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.exhibitController.view];
    [self addChildViewController:self.exhibitController];
    
    // expandButton
    self.expandButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.expandButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.expandButton setTitle:@"展开分类" forState:UIControlStateNormal];
    [self.expandButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.expandButton setTitleColor:[[UIColor blackColor] colorWithAlphaComponent:0.2] forState:UIControlStateHighlighted];
    [self.expandButton addTarget:self action:@selector(expandButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.expandButton];
    
    [self.view addConstraints:
  @[[NSLayoutConstraint constraintWithItem:self.expandButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:17],
    [NSLayoutConstraint constraintWithItem:self.expandButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:20]]];
}

- (void)expandButtonPressed{
    // 显示分类面板
    self.categoryController = [[CJCategoryController alloc] init];
    self.categoryController.delegate = self;
    self.categoryController.view.frame = self.view.bounds;
    self.categoryController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.categoryController.view];
    [self addChildViewController:self.categoryController];
}

#pragma mark - CJCategoryControllerDelegate

- (void)closePannel {
    // 关闭分类面板
    [self.categoryController.view removeFromSuperview];
    self.categoryController = nil;
}

- (void)showCategoryManage {
    CJCategoryManageController *manageController = [[CJCategoryManageController alloc] init];
    [self.navigationController pushViewController:manageController animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
