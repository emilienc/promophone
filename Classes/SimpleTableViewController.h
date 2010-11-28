//
//  SimpleTableViewController.h
//  SimpleTable
//
//  Created by emilien charbonnier on 28/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "PromotionDAO.h"

@interface SimpleTableViewController : UIViewController {
	IBOutlet UITableView *tblSimpleTable;
	//NSArray *arrayData;
	PromotionDAO *dao;
}

@end

