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


@interface ShotController : NSObject

@property (strong, nonatomic) AFHTTPRequestOperationManager *manager;
@property (strong, nonatomic) NSArray *shots;

+(instancetype)sharedInstance;
-(NSArray*)loadPosts:(int)pageCount;


@end
