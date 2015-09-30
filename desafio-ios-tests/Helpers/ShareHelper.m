//
//  ShareHelper.m
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/30/15.
//  Copyright © 2015 Bruno Rendeiro. All rights reserved.
//

#import "ShareHelper.h"
#import "ShotModel.h"
#import "NSString+StripHTML.h"


@implementation ShareHelper

-(NSArray*)activityItems:(ShotModel*)shot{
    NSString *title = shot.title;
    if ([title length] == 0) title = @"";
    NSString *desc = [shot.desc removeTags];
    if ([desc length] == 0) desc = @"";
    NSURL *url = shot.image;
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
    if (image == nil) image = [UIImage imageNamed:@"placeholder.png"];
    NSArray *activityItems = @[title,desc,image];
    return activityItems;
}

@end
