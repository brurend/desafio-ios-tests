//
//  DetailsCell.m
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/9/15.
//  Copyright (c) 2015 Bruno Rendeiro. All rights reserved.
//

#import "DetailsCell.h"
#import "ShotModel.h"
#import <UIImageView+WebCache.h>

@implementation DetailsCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//NSString* const placeholder = @"placeholder.png";

-(void)configurePlayerCell:(ShotModel *)shot{
    self.nameLabel.text = shot.player.player_name;
    [self.avatarImage sd_setImageWithURL:shot.player.player_image
                        placeholderImage:[UIImage imageNamed:placeholder]];
    self.descLabel.text = shot.desc;
}

@end
