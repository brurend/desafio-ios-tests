//
//  DetailCell.m
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/24/15.
//  Copyright © 2015 Bruno Rendeiro. All rights reserved.
//

#import "DetailCell.h"
#import "ShotModel.h"
#import <UIImageView+WebCache.h>
#import "NSString+StripHTML.h"


@implementation DetailCell
NSString* const detailCellIdentifier = @"detailCell";

-(void)configureCellforShot:(ShotModel *)shot{
    NSRange titleRange = {0, MIN([shot.title length], 30)};
    NSString *shortTitle = [shot.title substringWithRange:titleRange];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) self.shotTitle.text = shot.title;
    else self.shotTitle.text = shortTitle;
    self.shotViews.text = [shot.views stringValue];
    [self.shotImage sd_setImageWithURL:shot.image
                      placeholderImage:[UIImage imageNamed:placeholder]];
    self.shotDesc.text = [shot.desc removeTags];
    self.playerName.text = shot.player.player_name;
    [self.playerImage sd_setImageWithURL:shot.player.player_image
                        placeholderImage:[UIImage imageNamed:placeholder]];
}

@end
