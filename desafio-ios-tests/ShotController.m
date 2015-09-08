//
//  ShotController.m
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/8/15.
//  Copyright (c) 2015 Bruno Rendeiro. All rights reserved.
//

#import "ShotController.h"
#import "ShotModel.h"

@implementation ShotController

@synthesize manager,shots;

+(instancetype)sharedInstance{
    static ShotController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [[self alloc] init];
    });
    return sharedController;
}

-(NSArray*)loadPosts:(int)page{
    NSDictionary *parameters = @{@"page": [@(page) stringValue]};
    
    [manager GET:@"http://api.dribbble.com/shots/popular" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //Conversão do JSON para array com objetos "shot"
        shots = [MTLJSONAdapter modelsOfClass:[ShotModel class] fromJSONArray:[responseObject objectForKey:@"shots"] error:nil];
    

     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Erro: %@",error);
     }];
    
    return shots;
}

@end
