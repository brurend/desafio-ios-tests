//
//  shotCell.h
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/4/15.
//  Copyright (c) 2015 Bruno Rendeiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShotModel;

@interface ShotCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *shotImage;
@property (weak, nonatomic) IBOutlet UILabel *shotLabel;
@property (weak, nonatomic) IBOutlet UIView *shotView;
@property (weak, nonatomic) IBOutlet UILabel *shotViewsCount;

-(void)configureCellforShot:(ShotModel*)shot;


@end
