//
//  CustomCell.h
//  SimpleTable
//
//  Created by emilien charbonnier on 05/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//



@interface CustomCell : UITableViewCell {
	UILabel *primaryLabel;
	UILabel *secondaryLabel;
	UIImageView *myImageView;
}
@property(nonatomic,retain)UILabel *primaryLabel;
@property(nonatomic,retain)UILabel *secondaryLabel;
@property(nonatomic,retain)UIImageView *myImageView;
@end

