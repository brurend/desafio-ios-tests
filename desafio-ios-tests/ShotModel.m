//
//  ShotModel.m
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/4/15.
//  Copyright (c) 2015 Bruno Rendeiro. All rights reserved.
//

#import "ShotModel.h"

@implementation ShotModel

@synthesize title, desc, views, image;

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"title": @"title",
             @"desc": @"description",
             @"views": @"views_count",
             @"image": @"image_url",
             @"player": @"player"
             };
}

+(NSValueTransformer *)imageJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+(NSValueTransformer *)playerJSONTransformer
{
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[ShotPlayerModel class]];
}

@end
