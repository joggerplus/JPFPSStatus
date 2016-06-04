//
//  YiFPSStatus.m
//  YiFPSStatus
//
//  Created by coderyi on 16/6/4.
//  Copyright © 2016年 coderyi. All rights reserved.
//

#import "JPFPSStatus.h"

@interface JPFPSStatus (){
    CADisplayLink *displayLink;
    NSTimeInterval lastTime;
    NSUInteger count;
    
}

@end

@implementation JPFPSStatus
@synthesize fpsLabel;

- (void)dealloc {
    [displayLink setPaused:YES];
    [displayLink removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

+ (JPFPSStatus *)sharedInstance {
    static JPFPSStatus *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[JPFPSStatus alloc] init];
    });
    return sharedInstance;
}

- (id)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(applicationDidBecomeActiveNotification)
                                                     name: UIApplicationDidBecomeActiveNotification
                                                   object: nil];
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(applicationWillResignActiveNotification)
                                                     name: UIApplicationWillResignActiveNotification
                                                   object: nil];
        
        // Track FPS using display link
        displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkTick:)];
        [displayLink setPaused:YES];
        [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        
        // fpsLabel
        fpsLabel = [[UILabel alloc] initWithFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width-50)/2+50, 0, 50, 20)];
        fpsLabel.font=[UIFont boldSystemFontOfSize:12];
        fpsLabel.textColor=[UIColor colorWithRed:0.33 green:0.84 blue:0.43 alpha:1.00];
        fpsLabel.backgroundColor=[UIColor clearColor];
        fpsLabel.textAlignment=NSTextAlignmentRight;
        fpsLabel.tag=101;

    }
    return self;
}

- (void)displayLinkTick:(CADisplayLink *)link {
    if (lastTime == 0) {
        lastTime = link.timestamp;
        return;
    }
    
    count++;
    NSTimeInterval interval = link.timestamp - lastTime;
    if (interval < 1) return;
    lastTime = link.timestamp;
    float fps = count / interval;
    count = 0;
    
    NSString *text = [NSString stringWithFormat:@"%d FPS",(int)round(fps)];
    [fpsLabel setText: text];
    
}

- (void)open {
    
    NSArray *rootVCViewSubViews=[[UIApplication sharedApplication].delegate window].rootViewController.view.subviews;
    for (UIView *label in rootVCViewSubViews) {
        if ([label isKindOfClass:[UILabel class]]&& label.tag==101) {
            return;
        }
    }
    
    [[((NSObject <UIApplicationDelegate> *)([UIApplication sharedApplication].delegate)) window].rootViewController.view addSubview:fpsLabel];
}

- (void)close {
    NSArray *rootVCViewSubViews=[[UIApplication sharedApplication].delegate window].rootViewController.view.subviews;
    for (UIView *label in rootVCViewSubViews) {
        if ([label isKindOfClass:[UILabel class]]&& label.tag==101) {
            [label removeFromSuperview];
            return;
        }
    }
    
}

- (void)applicationDidBecomeActiveNotification {
    [displayLink setPaused:NO];
}

- (void)applicationWillResignActiveNotification {
    [displayLink setPaused:YES];
}

@end
