# JPFPSStatus
[![Pod Version](http://img.shields.io/cocoapods/v/JPFPSStatus.svg?style=flat)](http://cocoadocs.org/docsets/JPFPSStatus/)
[![Pod Platform](http://img.shields.io/cocoapods/p/JPFPSStatus.svg?style=flat)](http://cocoadocs.org/docsets/JPFPSStatus/)
[![Pod License](http://img.shields.io/cocoapods/l/JPFPSStatus.svg?style=flat)](https://opensource.org/licenses/MIT)

[README English](https://github.com/joggerplus/JPFPSStatus/blob/master/README.md)

JPFPSStatus是用来显示FPS状态在iOS状态栏，FPS是一秒钟渲染多少帧 Frame Per Second = FPS，FPS的值最佳为60左右，一般来说小于这个值就较为卡顿了。

#### Podfile

```ruby
platform :ios, '7.0'
pod 'JPFPSStatus', '~> 0.1'
```


######使用:
注意请在DEBUG模式下使用 JPFPSStatus
在AppDelegate.m里面加入下面代码就可以了
<pre>
#import "JPFPSStatus.h"
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
#if defined(DEBUG)||defined(_DEBUG)
    [[JPFPSStatus sharedInstance] open];
#endif
    return YES;
}

</pre>

不需要的时候可以关闭它在状态栏显示
<pre>
#if defined(DEBUG)||defined(_DEBUG)
    [[JPFPSStatus sharedInstance] open];
#endif
</pre>


JPFPSStatus的显示效果如图：

<img  src="https://raw.githubusercontent.com/joggerplus/JPFPSStatus/master/JPFPSStatus/Resources/jpfpsstatus1.jpg" width="320" height="570">


#### Licenses

All source code is licensed under the [MIT License](https://github.com/joggerplus/JPFPSStatus/blob/master/LICENSE).
