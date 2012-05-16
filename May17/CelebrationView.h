//
//  CelebrationView.h
//  May17
//
//  Created by Sunil Gopinath on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CelebrationViewController;

@interface CelebrationView : UILabel {
	CelebrationViewController *modalViewController;
}
- (id) initWithFrame: (CGRect) frame controller: (CelebrationViewController *) c;

@end
