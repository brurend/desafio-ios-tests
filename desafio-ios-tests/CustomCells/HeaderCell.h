//
//  HeaderCell.h
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/30/15.
//  Copyright © 2015 Bruno Rendeiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"
@class ShotModelContainer;

@interface HeaderCell : BaseTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *pageLabel;




@end
