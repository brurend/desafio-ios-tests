//
//  ShotController.m
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/8/15.
//  Copyright (c) 2015 Bruno Rendeiro. All rights reserved.
//

#import "NetworkingController.h"
#import "ShotModel.h"
#import "ShotPlayerModel.h"

@implementation NetworkingController

@synthesize manager,shots,teste;

+(instancetype)sharedInstance{
    static NetworkingController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [[self alloc] init];
    });
    return sharedController;
}

-(void)getShot:(NSString*)json parameters:(NSDictionary*)parameters success:(FetchShot)successBlock failure:(FetchShotFailure)failureBlock {
    manager = [AFHTTPRequestOperationManager manager];
    [manager GET:json parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *model = [ShotModel parseArray:[responseObject objectForKey:@"shots"]];
            successBlock(model);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureBlock(error);
    }];
}

@end
