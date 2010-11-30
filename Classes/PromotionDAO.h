//
//  Promotions.h
//  SimpleTable
//
//  Created by emilien charbonnier on 28/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


@interface PromotionDAO : NSObject {
	
    NSArray *geopromoContent;

}


@property (nonatomic, readonly) NSArray *geopromoContent;

- (id)initWithURL:(NSURL *)Url;
- (NSDictionary *)ItemAtIndex:(int)index;
- (int)Count;

@end
