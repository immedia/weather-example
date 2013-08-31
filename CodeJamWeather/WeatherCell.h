//
//  WeatherCell.h
//  CodeJamWeather
//
//  Created by Jitesh Nunnan on 2013/08/30.
//  Copyright (c) 2013 immedia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailTempLabel;

@end
