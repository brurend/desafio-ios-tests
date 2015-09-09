//
//  ShotPlayerModel.h
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/4/15.
//  Copyright (c) 2015 Bruno Rendeiro. All rights reserved.
//

#import "Mantle.h"

@interface ShotPlayerModel : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSString *player_name;
@property (strong, nonatomic) NSURL *player_image;

+(NSArray*)parseArray:(NSArray*)json;
+(instancetype)parse:(NSDictionary*)json;

@end
