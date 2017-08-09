//
//  BDHttpServerControlPannelController.m
//  BaiduBrowser
//
//  Created by chenjun on 18/07/2017.
//  Copyright © 2017 Baidu Inc. All rights reserved.
//

#import "BDHttpServerControlPannelController.h"
#import "BDHttpServerManager.h"

@interface BDHttpServerControlPannelController ()

@property (strong, nonatomic) UIButton *startButton;
@property (strong, nonatomic) UILabel *siteLabel;
@property (strong, nonatomic) UIButton *stopButton;

@end

@implementation BDHttpServerControlPannelController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // startButton
    self.startButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.startButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.startButton setTitle:@"启动服务器" forState:(UIControlStateNormal)];
    [self.startButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.startButton addTarget:self action:@selector(startHttpServer) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.startButton];
    
    // siteLabel
    self.siteLabel = [[UILabel alloc] init];
    self.siteLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.siteLabel.textColor = [UIColor blackColor];
    if ([BDHttpServerManager isHttpServerRunning]) {
        self.siteLabel.text = [BDHttpServerManager fetchServerSite];
    }
    [self.view addSubview:self.siteLabel];
    
    // stopButton
    self.stopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.stopButton setTitle:@"关闭服务器" forState:(UIControlStateNormal)];
    [self.stopButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.stopButton addTarget:self action:@selector(stopHttpServer) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.stopButton];

    [self.view addConstraints:
  @[[NSLayoutConstraint constraintWithItem:self.startButton attribute:NSLayoutAttributeCenterX relatedBy:(NSLayoutRelationEqual) toItem:self.view attribute:(NSLayoutAttributeCenterX) multiplier:1 constant:0],
    [NSLayoutConstraint constraintWithItem:self.startButton attribute:(NSLayoutAttributeCenterY) relatedBy:(NSLayoutRelationEqual) toItem:self.view attribute:(NSLayoutAttributeCenterY) multiplier:1 constant:0]]];
    [self.view addConstraints:
  @[[NSLayoutConstraint constraintWithItem:self.siteLabel attribute:(NSLayoutAttributeCenterX) relatedBy:(NSLayoutRelationEqual) toItem:self.view attribute:(NSLayoutAttributeCenterX) multiplier:1 constant:0],
    [NSLayoutConstraint constraintWithItem:self.siteLabel attribute:(NSLayoutAttributeTop) relatedBy:(NSLayoutRelationEqual) toItem:self.startButton attribute:(NSLayoutAttributeBottom) multiplier:1 constant:20]]];
    [self.view addConstraints:
  @[[NSLayoutConstraint constraintWithItem:self.stopButton attribute:(NSLayoutAttributeCenterX) relatedBy:(NSLayoutRelationEqual) toItem:self.view attribute:(NSLayoutAttributeCenterX) multiplier:1 constant:0],
    [NSLayoutConstraint constraintWithItem:self.stopButton attribute:(NSLayoutAttributeTop) relatedBy:(NSLayoutRelationEqual) toItem:self.siteLabel attribute:(NSLayoutAttributeBottom) multiplier:1 constant:20]]];
}

- (void)startHttpServer
{
    [BDHttpServerManager startHttpServer];
    
    self.siteLabel.text = [BDHttpServerManager fetchServerSite];
}

- (void)stopHttpServer
{
    [BDHttpServerManager stopHttpServer];
    
    self.siteLabel.text = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
