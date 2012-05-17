//
//  May17AppDelegate.m
//  May17
//
//  Created by Sunil Gopinath on 5/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "May17AppDelegate.h"
#include "SlotViewController.h"
#include "RouletteViewController.h"

@implementation May17AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    /*************************
     *** SET UP SLOT SOUND ***
     *************************/
    // Override point for customization after application launch.
	NSBundle *bundle = [NSBundle mainBundle];
	NSLog(@"bundle.bundlePath == \"%@\"", bundle.bundlePath);	
    
	NSString *filename = [bundle pathForResource: @"chaching" ofType: @"mp3"];
	NSLog(@"filename == \"%@\"", filename);
    
	NSURL *url = [NSURL fileURLWithPath: filename isDirectory: NO];
	NSLog(@"url == \"%@\"", url);
    
	OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &sid);
	if (error != kAudioServicesNoError) {
		NSLog(@"AudioServicesCreateSystemSoundID error == %ld", error);
	}
    
    /******************************
     *** SET UP CONGRATULATIONS ***
     ******************************/
    // Override point for customization after application launch.
	NSBundle *bundleCongratulations = [NSBundle mainBundle];
	NSLog(@"bundle.bundlePath == \"%@\"", bundleCongratulations.bundlePath);	
    
	NSString *filenameCongratulations = [bundleCongratulations pathForResource: @"spinningsound" ofType: @"mp3"];
	NSLog(@"filename == \"%@\"", filenameCongratulations);
    
	NSURL *urlCongratulations = [NSURL fileURLWithPath: filenameCongratulations isDirectory: NO];
	NSLog(@"url == \"%@\"", urlCongratulations);
    
	OSStatus errorCongratulations = AudioServicesCreateSystemSoundID((__bridge CFURLRef)urlCongratulations, &sidCongratulations);
	if (errorCongratulations != kAudioServicesNoError) {
		NSLog(@"AudioServicesCreateSystemSoundID error == %ld", errorCongratulations);
	}
    
    /**********************
     ** SET UP CELEBRATE **
     *********************/
    // Override point for customization after application launch.
	NSBundle *bundleCelebrate = [NSBundle mainBundle];
	NSLog(@"bundle.bundelPath == \"%@\"", bundleCelebrate.bundlePath);
    
	NSString *filenameCelebrate = [bundleCelebrate pathForResource: @"cel" ofType: @"mp3"];
	NSLog(@"filename == \"%@\"", filenameCelebrate);
    
	NSURL *urlCelebrate = [NSURL fileURLWithPath: filenameCelebrate isDirectory: NO];
	NSLog(@"url == \"%@\"", urlCelebrate);
    
	NSError *errorCelebrate = nil;
	player = [[AVAudioPlayer alloc] initWithContentsOfURL: urlCelebrate error: &errorCelebrate];
    
	if (player == nil) {
		NSLog(@"could not initialize player:  %@", error);
		return YES;
	}
    
	player.volume = 1.0;		//the default
	player.numberOfLoops = -1;	//negative for infinite loop
	player.delegate = self;
	//mono or stereo
	NSLog(@"player.numberOfChannels == %u", player.numberOfChannels);
    
	if (![player prepareToPlay]) {
		NSLog(@"prepareToPlay failed");
		return YES;
	}
    
    
    self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
	// Override point for customization after application launch.
	UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
	tabBarController.viewControllers = [NSArray arrayWithObjects:
                                        
                                        [[SlotViewController alloc]
                                         initWithText: @"Come lose some money!"	//apostophe, not prime
                                         title: @"Slot Machine"
                                         image: [UIImage imageNamed: @"slot_machine.png"]
                                         badge: nil
                                         ],
                                        [[RouletteViewController alloc]
                                         initWithText: @"You spin me right round!"	//apostophe, not prime
                                         title: @"Roulette"
                                         image: [UIImage imageNamed: @"wheeltabicon.png"]
                                         badge: nil
                                         ],
                                        nil
                                        ];
    
	tabBarController.selectedIndex = 0;	//0 (the leftmost one) is the default
	self.window.rootViewController = tabBarController;
	[self.window makeKeyAndVisible];
	return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void) playSound: (id) sender {
	//The sender is the button that was pressed.
    
	NSLog(@"The \"%@\" button was pressed.",
		  [sender titleForState: UIControlStateNormal]);
    
	//AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
	AudioServicesPlaySystemSound(sid);
}

- (void) playCelebration {
    if (![player play]) {
        NSLog(@"could not play");
    }
}

- (void) stopCelebration {
    NSLog(@"Paused at %g of %g seconds.", player.currentTime, player.duration);
    [player pause];
    
    if (![player prepareToPlay]) {
        NSLog(@"prepareToPlay failed");
    }
}

- (void) playCongratulations: (id) sender {
	//The sender is the button that was pressed.
    
	NSLog(@"The \"%@\" button was pressed.",
		  [sender titleForState: UIControlStateNormal]);
    
	//AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
	AudioServicesPlaySystemSound(sidCongratulations);
}

@end
