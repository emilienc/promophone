//
//  Promotions.m
//  SimpleTable
//
//  Created by emilien charbonnier on 28/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PromotionDAO.h"


@implementation PromotionDAO

//@synthesize geopromoPlist;
@synthesize geopromoContent;

// ask server for promotions and put them in an array
- (id)initWithURL:(NSURL *)Url {
    if (self = [super init]) {
		geopromoContent = [[NSArray alloc] initWithContentsOfURL:Url];
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
