//
//  DetailsCell.h
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/9/15.
//  Copyright (c) 2015 Bruno Rendeiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShotModel;

@interface DetailsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImage;

-(void)configurePlayerCell:(ShotModel*)shot;

@end
