//
// Created by succlz123 on 15/8/26.
// Copyright (c) 2015 succlz123. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPRequestOperation;

typedef void (^AppHttpClientPercentBlock)(NSString *url, float percent);

typedef void (^AppHttpClientCompleteBlock)(NSString *responseContent, NSError *error);


@interface AppHttpClient : NSObject

+ (instancetype)sharedInstance;

- (AFHTTPRequestOperation *)downloadFile:(NSURL *)url
                              toLocation:(NSString *)location
                                 headers:(NSDictionary *)headers
                            percentBlock:(AppHttpClientPercentBlock)percentBlock
                           completeBlock:(AppHttpClientCompleteBlock)completeBlock;

- (NSString *)doGet:(NSString *)url error:(NSError **)error;
@end