//
//  WeatherCell.m
//  CodeJamWeather
//
//  Created by Jitesh Nunnan on 2013/08/30.
//  Copyright (c) 2013 immedia. All rights reserved.
//

#import "WeatherCell.h"

@implementation WeatherCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
