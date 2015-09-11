//
//  BaseMantle.h
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/11/15.
//  Copyright (c) 2015 Bruno Rendeiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mantle.h"

@interface BaseMantle : MTLModel <MTLJSONSerializing>

+(NSArray*)parseArray:(NSArray*)json;
+(NSDictionary *)JSONKeyPathsByPropertyKey;
+(instancetype)parse:(NSDictionary*)json;

@end
