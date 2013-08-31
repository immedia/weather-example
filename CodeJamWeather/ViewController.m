//
//  ViewController.m
//  CodeJamWeather
//
//  Created by Jitesh Nunnan on 2013/08/29.
//  Copyright (c) 2013 immedia. All rights reserved.
//

#import "ViewController.h"
#import "Weather.h"
#import "CJWeather.h"
#import "WeatherCell.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <CLLocationManagerDelegate>

@property (nonatomic, retain) NSArray *weatherArray;
@property (nonatomic, retain) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  //based on what the user has selected call the appropriate method
  switch (self.index) {
    case 0:
      [self choosenCity];
      break;
      
    case 1:
      [self updateLocation];
      break;
      
    default:
      break;
  }
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
  return self.weatherArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 60.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"CellIdentifier";
  WeatherCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
  CJWeather *weather = [self.weatherArray objectAtIndex:indexPath.row];
  cell.countryLabel.text = [NSString stringWithFormat:@"%@, %@", weather.country, weather.name];
  cell.tempLabel.text = [NSString stringWithFormat:@"%@ \u00B0C", weather.temp];
  cell.detailTempLabel.text = [NSString stringWithFormat:@"(%@ \u00B0C - %@ \u00B0C)", weather.minTemp, weather.maxTemp];
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
  CJWeather *weather = [self.weatherArray objectAtIndex:indexPath.row];
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Code Jam Weather" message:weather.description delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
  [alert show];
}


#pragma mark - utiltiy methods
- (void)choosenCity {
  [Weather getWeather:^(NSArray *weatherArray) {
    self.weatherArray = weatherArray;
    [self.tableView reloadData];
  } onError:^(NSString *message) {
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"Error"
                                                   message:message
                                                  delegate:nil
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles:nil];
    [view show];
  }];
  
}

#pragma mark - Core Location
- (void)updateLocation {
  self.locationManager = [[CLLocationManager alloc] init];
  self.locationManager.delegate = self;
  self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
  [self.locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
  UIAlertView *errorAlert = [[UIAlertView alloc]
                             initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
  [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
  CLLocation *currentLocation = [locations objectAtIndex:locations.count-1];
  [self.locationManager stopUpdatingLocation];
  [Weather getWeatherForLatitude:currentLocation.coordinate.latitude andLongitude:currentLocation.coordinate.longitude :^(NSArray *weatherArray) {
    self.weatherArray = weatherArray;
    [self.tableView reloadData];
  } onError:^(NSString *message) {
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"Error"
                                                   message:message
                                                  delegate:nil
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles:nil];
    [view show];
  }];
}


@end
