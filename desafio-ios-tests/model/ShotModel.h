//
//  ShotModel.h
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/4/15.
//  Copyright (c) 2015 Bruno Rendeiro. All rights reserved.
//

#import "Mantle.h"
#import "ShotPlayerModel.h"
#import "BaseMantle.h"

@interface ShotModel : BaseMantle

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *desc;
@property (strong, nonatomic) NSNumber *views;
@property (strong, nonatomic) NSURL *image;
@property (strong, nonatomic) ShotPlayerModel *player;

extern NSString* const placeholder;
extern NSString* const shotCellIdentifier;

//+(NSArray*)parseArray:(NSArray*)json;
//+(instancetype)parse:(NSDictionary*)json;

@end
