//
//  CelebrationViewController.h
//  May17
//
//  Created by Sunil Gopinath on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SlotViewController;

@interface CelebrationViewController : UIViewController {
    SlotViewController *viewController;
}

- (void) dismissModalViewController;

- (id) initWithController:(SlotViewController *) c;

@end
