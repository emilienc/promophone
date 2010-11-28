//
//  Promotions.m
//  SimpleTable
//
//  Created by emilien charbonnier on 28/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PromotionDAO.h"


@implementation PromotionDAO

@synthesize geopromoPlist;
@synthesize geopromoContent;

// Gets a plist name and reads in its contents as an array
- (id)initWithName:(NSString *)Name {
    if (self = [super init]) {
        geopromoPlist = Name;
		NSURL *theFileURL = [NSURL URLWithString:@"http://geopromo.heroku.com/promotions/list.plist?lat=43.192867&lng=5.755785"];
		UIApplication* app = [UIApplication sharedApplication];
		app.networkActivityIndicatorVisible = YES; // to stop it, set this to NO
		geopromoContent = [[NSArray alloc] initWithContentsOfURL:theFileURL];
		app.networkActivityIndicatorVisible = NO;
    }
    return self;
}

// [Safely] returns a "Promotion" from the plist. Each item in the data source is a dictionary containing data about
// the chosen Promotion.
- (NSDictionary *) ItemAtIndex:(int)index {
    return (geopromoContent != nil ? [geopromoContent count] : 0 ? index : [geopromoContent count]) ? [geopromoContent objectAtIndex:index] : nil;
}

// Returns the count of all promotions in our library
- (int)Count {
    return (geopromoContent != nil) ? [geopromoContent count] : 0;
}

@end
