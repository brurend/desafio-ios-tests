//
//  BaseTableViewCell.m
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/30/15.
//  Copyright © 2015 Bruno Rendeiro. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

NSString* const placeholder = @"placeholder.png";

+(NSString*)cellIdentifier{
    return NSStringFromClass([self class]);
}

+(UINib*)registerNib{
    return [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
}


@end
