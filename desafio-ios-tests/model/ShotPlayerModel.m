//
//  ShotPlayerModel.m
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/4/15.
//  Copyright (c) 2015 Bruno Rendeiro. All rights reserved.
//

#import "ShotPlayerModel.h"

@implementation ShotPlayerModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"player_name": @"name",
             @"player_image": @"avatar_url"
            };
}

+(NSValueTransformer *)player_imageJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end
