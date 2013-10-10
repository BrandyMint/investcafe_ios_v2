//
//  SectionTableView.h
//  InvestCafe
//
//  Created by Viktor Bespalov on 10/9/13.
//  Copyright (c) 2013 bespalown. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SectionModel.h"
#import "SectionManager.h"

@interface SectionsViewController : UITableViewController <SectionManagerDelegate>

@property (nonatomic, retain) IBOutlet UITableView* tableSections;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil sectionManager:(SectionManager*)sectionManager;

@end
