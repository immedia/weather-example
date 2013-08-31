//
//  CJWeather.h
//  CodeJamWeather
//
//  Created by Jitesh Nunnan on 2013/08/30.
//  Copyright (c) 2013 immedia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJWeather : NSObject

- initWithDictionary:(NSDictionary*)dictionary;

@property (nonatomic, strong) NSString *name, *minTemp, *maxTemp, *temp, *country, *description;

@end
