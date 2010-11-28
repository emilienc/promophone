//
//  SimpleTableAppDelegate.h
//  SimpleTable
//
//  Created by emilien charbonnier on 28/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SimpleTableViewController;

@interface SimpleTableAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SimpleTableViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SimpleTableViewController *viewController;

@end

