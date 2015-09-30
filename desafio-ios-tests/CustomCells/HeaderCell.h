//
//  HeaderCell.h
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/30/15.
//  Copyright © 2015 Bruno Rendeiro. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ShotModelContainer;

@interface HeaderCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *pageLabel;

-(void)configureCellforModelContainer:(ShotModelContainer*)modelContainer;
+(NSString*)cellIdentifier;
+(UINib*)registerNib;

@end
