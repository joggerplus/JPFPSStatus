//
//  YiFPSStatus.h
//  YiFPSStatus
//
//  Created by coderyi on 16/6/4.
//  Copyright © 2016年 coderyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface JPFPSStatus : NSObject

@property (nonatomic,strong)UILabel *fpsLabel;

+ (JPFPSStatus *)sharedInstance;

- (void)open;
- (void)close;

@end
