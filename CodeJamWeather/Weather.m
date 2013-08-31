//
//  Weather.m
//  CodeJamWeather
//
//  Created by Jitesh Nunnan on 2013/08/30.
//  Copyright (c) 2013 immedia. All rights reserved.
//

#import "Weather.h"
#import "AFNetworking.h"
#import "CJWeather.h"

@implementation Weather

+ (void)getWeather:(void (^)(NSArray *))completionBlock onError:(void (^)(NSString *))failureBlock {
  NSURL *url = [NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/find?q=London&units=metric"];
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  
  AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, NSDictionary *JSON) {
    NSMutableArray *dataArray = [NSMutableArray arrayWithCapacity:1];
    for (NSDictionary *dictionary in JSON[@"list"]) {
      CJWeather *localWeather = [[CJWeather alloc] initWithDictionary:dictionary];
      [dataArray addObject:localWeather];
    }
    completionBlock(dataArray);
  } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
    NSLog(@"error: %@", error);
    failureBlock(error.localizedDescription);
  }];
  [operation start];
}

+ (void)getWeatherForLatitude:(CGFloat)latitude andLongitude:(CGFloat)longitude :(void(^)(NSArray* weatherDetails))completionBlock onError:(void(^)(NSString *message))failureBlock {
  NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/find?lat=%f&lon=%f&units=metric", latitude, longitude]];
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  
  AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, NSDictionary *JSON) {
    NSMutableArray *dataArray = [NSMutableArray arrayWithCapacity:1];
    for (NSDictionary *dictionary in JSON[@"list"]) {
      CJWeather *localWeather = [[CJWeather alloc] initWithDictionary:dictionary];
      [dataArray addObject:localWeather];
    }
    completionBlock(dataArray);
  } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
    NSLog(@"error: %@", error);
    failureBlock(error.localizedDescription);
  }];
  [operation start];
}

@end
