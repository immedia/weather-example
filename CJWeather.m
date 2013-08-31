//
//  CJWeather.m
//  CodeJamWeather
//
//  Created by Jitesh Nunnan on 2013/08/30.
//  Copyright (c) 2013 immedia. All rights reserved.
//

#import "CJWeather.h"

@implementation CJWeather

- (id)initWithDictionary:(NSDictionary *)dictionary {
  self = [super init];
  
  if (self) {
    self.name = dictionary[@"name"];
    self.country = dictionary[@"sys"][@"country"];
    self.maxTemp = dictionary[@"main"][@"temp_max"];
    self.minTemp = dictionary[@"main"][@"temp_min"];
    self.temp = dictionary[@"main"][@"temp"];
    self.description = dictionary[@"weather"][0][@"description"];
  }
  
  return self;
}

@end
