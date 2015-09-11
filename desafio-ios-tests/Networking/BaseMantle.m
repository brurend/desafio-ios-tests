//
//  BaseMantle.m
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/11/15.
//  Copyright (c) 2015 Bruno Rendeiro. All rights reserved.
//

#import "BaseMantle.h"

@implementation BaseMantle

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return [NSDictionary mtl_identityPropertyMapWithModel:self];
}

+(NSArray*)parseArray:(NSArray*)json{
    return [MTLJSONAdapter modelsOfClass:self fromJSONArray:json error:nil];
}

+(instancetype)parse:(NSDictionary*)json{
    return [MTLJSONAdapter modelOfClass:self fromJSONDictionary:json error:nil];
}

@end
