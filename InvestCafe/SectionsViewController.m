//
//  SectionTableView.m
//  InvestCafe
//
//  Created by Viktor Bespalov on 10/9/13.
//  Copyright (c) 2013 bespalown. All rights reserved.
//

#import "SectionsViewController.h"


@interface SectionsViewController ()
@property (nonatomic, strong) SectionManager* _sectionManager;
@end

@implementation SectionsViewController
{
    NSArray* sections;
}

@synthesize _sectionManager;
@synthesize tableSections;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil sectionManager:(SectionManager *)sectionManager
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _sectionManager = sectionManager;
        _sectionManager.delegate = self;
    }
    return self;
}

-(void)sectionArray:(NSArray *)sectionArray
{
    sections = sectionArray;
    NSLog(@"Получил данные rss");
    [tableSections reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [sections count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SectionModel *section = [[SectionModel alloc]init];
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    section = [sections objectAtIndex:indexPath.row];
    cell.textLabel.text = section.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d",section.section_id];
    return cell;
}

@end
