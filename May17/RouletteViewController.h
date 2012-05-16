//
//  RouletteViewController.h
//  May17
//
//  Created by Sunil Gopinath on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RouletteViewController : UIViewController {
	NSString *text;
}

- (id) initWithText: (NSString *) t
              title: (NSString *) title
              image: (UIImage *) image
              badge: (NSString *) badge;

@property (nonatomic, copy) IBOutlet NSString *text;

@end
