//
//  SimpleTableViewController.m
//  SimpleTable
//
//  Created by emilien charbonnier on 28/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SimpleTableViewController.h"

@implementation SimpleTableViewController



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
	//arrayData = [[NSArray alloc] initWithObjects:@"promo1",@"promo2",@"promo3",nil];
	//NSString * theFile = [[NSBundle mainBundle] pathForResource:@"TestData" ofType:@"plist"];
	//arrayData = [[NSArray alloc] initWithContentsOfFile:theFile];
	//arrayData = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TestData" ofType:@"plist"]];
	//printf("%s",arrayData);
	dao = [[PromotionDAO alloc] initWithName:@"TestData"];
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


@end
