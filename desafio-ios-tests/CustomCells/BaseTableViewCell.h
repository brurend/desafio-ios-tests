//
//  BaseTableViewCell.h
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/30/15.
//  Copyright © 2015 Bruno Rendeiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell

extern NSString* const placeholder;

+(NSString*)cellIdentifier;
+(UINib*)registerNib;

@end
