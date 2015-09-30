//
//  ShotController.m
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/8/15.
//  Copyright (c) 2015 Bruno Rendeiro. All rights reserved.
//

#import "NetworkClient.h"
#import "ShotModel.h"

@implementation NetworkClient

@synthesize manager,shots;

+(instancetype)sharedInstance{
    static NetworkClient *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [[self alloc] init];
    });
    return sharedController;
}

-(void)getShotsWithParameters:(NSDictionary*)parameters success:(FetchShot)successBlock failure:(FetchShotFailure)failureBlock {
    manager = [AFHTTPRequestOperationManager manager];
    NSString *json = @"https://api.dribbble.com/shots/popular";
    [manager GET:json parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *model = [ShotModel parseArray:[responseObject objectForKey:@"shots"]];
            successBlock(model);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureBlock(error);
    }];
}

@end
