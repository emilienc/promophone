//
//  Promotions.h
//  SimpleTable
//
//  Created by emilien charbonnier on 28/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


@interface PromotionDAO : NSObject {
	
	NSString *geopromoPlist;
    NSArray *geopromoContent;

}

@property (nonatomic, readonly) NSString *geopromoPlist;
@property (nonatomic, readonly) NSArray *geopromoContent;

- (id)initWithName:(NSString *)Name;
- (NSDictionary *)ItemAtIndex:(int)index;
- (int)Count;

@end
