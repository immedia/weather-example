//
//  Weather.h
//  CodeJamWeather
//
//  Created by Jitesh Nunnan on 2013/08/30.
//  Copyright (c) 2013 immedia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject

+ (void)getWeather:(void(^)(NSArray* weatherDetails))completionBlock onError:(void(^)(NSString *message))failureBlock;

+ (void)getWeatherForLatitude:(CGFloat)latitude andLongitude:(CGFloat)longitude :(void(^)(NSArray* weatherDetails))completionBlock onError:(void(^)(NSString *message))failureBlock;

@end
