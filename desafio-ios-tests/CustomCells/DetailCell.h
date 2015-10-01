//
//  DetailCell.h
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/24/15.
//  Copyright © 2015 Bruno Rendeiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"
@class ShotModel;

@interface DetailCell : BaseTableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *shotImage;
@property (weak, nonatomic) IBOutlet UILabel *shotTitle;
@property (weak, nonatomic) IBOutlet UILabel *shotViews;
@property (weak, nonatomic) IBOutlet UILabel *playerName;
@property (weak, nonatomic) IBOutlet UILabel *shotDesc;
@property (weak, nonatomic) IBOutlet UIImageView *playerImage;



@end
