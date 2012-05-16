//
//  May17AppDelegate.h
//  May17
//
//  Created by Sunil Gopinath on 5/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>	//needed for SystemSoundID

@interface May17AppDelegate : UIResponder <UIApplicationDelegate> {
	UIWindow *_window;
    SystemSoundID sid;
}

- (void) playSound:(id) sender;
@property (strong, nonatomic) UIWindow *window;

@end
