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

+(NSValueTransformer *)avatar_urlJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end
