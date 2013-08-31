//
//  ChooseAPIViewController.m
//  CodeJamWeather
//
//  Created by Jitesh Nunnan on 2013/08/31.
//  Copyright (c) 2013 immedia. All rights reserved.
//

#import "ChooseAPIViewController.h"
#import "ViewController.h"

@interface ChooseAPIViewController ()

@end

@implementation ChooseAPIViewController

- (id)initWithStyle:(UITableViewStyle)style
{
  self = [super initWithStyle:style];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.navigationItem.title = @"Choose the API call";
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

  switch (indexPath.row) {
    case 0:
      cell.textLabel.text = @"Use a constant city";
      cell.detailTextLabel.text = @"London";
      break;
      
    default:
      cell.textLabel.text = @"Use users location";
      cell.detailTextLabel.text = @"San Francisco";
      break;
  }
  
  return cell;
}

#pragma mark - Table view delegate

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  NSIndexPath *path = [self.tableView indexPathForSelectedRow];
  ViewController *viewController =  (ViewController *)segue.destinationViewController;
  viewController.index = path.row;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
