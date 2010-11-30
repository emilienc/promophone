//
//  SimpleTableViewController.h
//  SimpleTable
//
//  Created by emilien charbonnier on 28/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "PromotionDAO.h"
#import <CoreLocation/CoreLocation.h>

@interface SimpleTableViewController : UIViewController <CLLocationManagerDelegate> {
	IBOutlet UITableView *tblSimpleTable;
	
	PromotionDAO *dao;
	
	CLLocationManager	*locationManager;
	NSMutableArray		*locationMeasurements;
}

@property (nonatomic, retain) UITableView *tblSimpleTable;
@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) NSMutableArray	*locationMeasurements;

@end

