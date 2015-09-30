//
//  ShotController.h
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/8/15.
//  Copyright (c) 2015 Bruno Rendeiro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "Mantle.h"
#import "ShotModel.h"

typedef void (^FetchShot)(NSArray * shots);
typedef void (^FetchShotFailure)(NSError *erro);


@interface NetworkClient : NSObject 

@property (strong, nonatomic) AFHTTPRequestOperationManager *manager;
@property (strong, nonatomic) NSArray *shots;

+(instancetype)sharedInstance;
-(void)getShotsWithParameters:(NSDictionary*)parameters success:(FetchShot)successBlock failure:(FetchShotFailure)failureBlock ;


@end