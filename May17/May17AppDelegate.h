//
//  May17AppDelegate.h
//  May17
//
//  Created by Sunil Gopinath on 5/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>	//needed for SystemSoundID
#import <AVFoundation/AVAudioPlayer.h>


@interface May17AppDelegate : UIResponder <UIApplicationDelegate, AVAudioPlayerDelegate> {
	UIWindow *_window;
    SystemSoundID sid;
    AVAudioPlayer *player;
    SystemSoundID sidCongratulations;
}

- (void) playSound:(id) sender;
- (void) playCelebration;
- (void) stopCelebration;
- (void) playCongratulations:(id) sender;

@property (strong, nonatomic) UIWindow *window;

@end
