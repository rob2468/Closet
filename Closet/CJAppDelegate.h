//
//  CJAppDelegate.h
//  Closet
//
//  Created by chenjun on 2018/4/23.
//  Copyright © 2018年 chenjun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HSDDelegate.h"

@interface CJAppDelegate : UIResponder
<UIApplicationDelegate,
HSDDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
