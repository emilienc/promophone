//
//  SimpleTableViewController.m
//  SimpleTable
//
//  Created by emilien charbonnier on 28/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SimpleTableViewController.h"

@implementation SimpleTableViewController


@synthesize locationManager;
@synthesize locationMeasurements;
@synthesize tblSimpleTable;



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	// Create the manager object 
	
    self.locationManager = [[[CLLocationManager alloc] init] autorelease];
	
    locationManager.delegate = self;
    
	// This is the most important property to set for the manager. It ultimately determines how the manager will
    // attempt to acquire location and thus, the amount of power that will be consumed.
    
	//locationManager.desiredAccuracy = [[setupInfo objectForKey:kSetupInfoKeyAccuracy] doubleValue];
    
	// Once configured, the location manager must be "started".
    
	[locationManager startUpdatingLocation];
	
	UIApplication* app = [UIApplication sharedApplication];
	app.networkActivityIndicatorVisible = YES; // to stop it, set this to NO
	
    [super viewDidLoad];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

#pragma mark Table view methods



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	
	return 1;
	
}



// Customize the number of rows in the table view.

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	return [dao Count];
	
}



// Customize the appearance of table view cells.

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	

	static NSString *CellIdentifier = @"Cell";

	

	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

	if (cell == nil) {
	
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
	
	}
	
	
	
	// Set up the cell...
	
	[cell.textLabel setText:[[dao ItemAtIndex:indexPath.row] valueForKey:@"description"]];
	return cell;

}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
}

/*
 * We want to get and store a location measurement that meets the desired accuracy. For this example, we are
 *      going to use horizontal accuracy as the deciding factor. In other cases, you may wish to use vertical
 *      accuracy, or both together.
 */
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
	
	// store all of the measurements, just so we can see what kind of data we might receive
	
	// [locationMeasurements addObject:newLocation];
	
    // test the age of the location measurement to determine if the measurement is cached
    // in most cases you will not want to rely on cached measurements
    // NSTimeInterval locationAge = -[newLocation.timestamp timeIntervalSinceNow];
    
	// if (locationAge > 5.0) return;
    // test that the horizontal accuracy does not indicate an invalid measurement
    // if (newLocation.horizontalAccuracy < 0) return;
	
    // test the measurement to see if it is more accurate than the previous measurement
	
	//  if (bestEffortAtLocation == nil || bestEffortAtLocation.horizontalAccuracy > newLocation.horizontalAccuracy) {
	// store the location as the "best effort"
    //    self.bestEffortAtLocation = newLocation;
	// test the measurement to see if it meets the desired accuracy
	//
	// IMPORTANT!!! kCLLocationAccuracyBest should not be used for comparison with location coordinate or altitidue 
	// accuracy because it is a negative value. Instead, compare against some predetermined "real" measure of 
	// acceptable accuracy, or depend on the timeout to stop updating. This sample depends on the timeout.
	//
	//  if (newLocation.horizontalAccuracy <= locationManager.desiredAccuracy) {
	// we have a measurement that meets our requirements, so we can stop updating the location
	// 
	// IMPORTANT!!! Minimize power usage by stopping the location manager as soon as possible.
	//
	//          [self stopUpdatingLocation:NSLocalizedString(@"Acquired Location", @"Acquired Location")];
	// we can also cancel our previous performSelector:withObject:afterDelay: - it's no longer necessary
    //        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(stopUpdatingLocation:) object:nil];
	// }
	// }
    // update the display with the new location data
    // [self.tableView reloadData];   
	
	// récupération des promotions sur le serveur en lui passant les coordonnés géographiques
	
	//newLocation.coordinate.latitude
	//newLocation.coordinate.longitude
	
	//CLLocation *location = [locationMeasurements objectAtIndex:0];
	//	NSString *locChaine			= location.localizedCoordinateString; 
	
	//	printf("localisation = lat = %l long = %d\n", newLocation.coordinate.latitude, newLocation.coordinate.longitude);
	//	printf("description = %@ %@", newLocation.description,@"toto");
	
	
	//NSString *urlNextPage		= [NSString stringWithFormat:@"http://geopromo.heroku.com/promotions/list.plist?lat=43.192867&lng=5.755785"];
	
	CLLocationCoordinate2D	coordinate = [newLocation coordinate];
	NSString *urlNextPage		= [NSString stringWithFormat:@"http://geopromo.heroku.com/promotions/list.plist?lat=%l long=%d", [NSNumber numberWithDouble:coordinate.latitude],	[NSNumber numberWithDouble:coordinate.longitude]];
	NSURL	*theFileURL				= [NSURL URLWithString:urlNextPage];
	
	
	//NSURL *theFileURL = [NSURL URLWithString:@"http://geopromo.heroku.com/promotions/list.plist?lat=43.192867&lng=5.755785"];
	dao = [[PromotionDAO alloc] initWithURL:theFileURL];
	
		
	[self.tblSimpleTable reloadData];
	
	UIApplication* app = [UIApplication sharedApplication];
	app.networkActivityIndicatorVisible = NO;

	
}



@end
