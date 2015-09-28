//
//  shotCell.m
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/4/15.
//  Copyright (c) 2015 Bruno Rendeiro. All rights reserved.
//

#import "ShotCell.h"
#import "ShotModel.h"
#import <UIImageView+WebCache.h>

@implementation ShotCell

-(void)configureCellforShot:(ShotModel *)shot{
    NSRange titleRange = {0, MIN([shot.title length], 30)};
    NSString *shortTitle = [shot.title substringWithRange:titleRange];
    self.shotLabel.text = shortTitle;
    self.shotViewsCount.text = [shot.views stringValue];
    [self.shotImage sd_setImageWithURL:shot.image
                      placeholderImage:[UIImage imageNamed:placeholder]];
}

@end
