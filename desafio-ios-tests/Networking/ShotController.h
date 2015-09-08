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

typedef void (^FetchShot)(NSArray * shot);


@interface ShotController : NSObject

@property (strong, nonatomic) AFHTTPRequestOperationManager *manager;
@property (strong, nonatomic) NSArray *shots;
@property (strong, nonatomic) NSDictionary *teste;

+(instancetype)sharedInstance;
//-(NSArray*)loadPosts:(int)pageCount;
-(void)test:(NSString*)json parameters:(NSDictionary*)parameters success:(FetchShot)success;


@end
