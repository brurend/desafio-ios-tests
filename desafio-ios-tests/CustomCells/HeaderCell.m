//
//  HeaderCell.m
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/30/15.
//  Copyright © 2015 Bruno Rendeiro. All rights reserved.
//

#import "HeaderCell.h"
#import "ShotModelContainer.h"

@implementation HeaderCell

-(void)setup:(id)obj{
    ShotModelContainer *modelContainer = (ShotModelContainer*)obj;
    self.categoryLabel.text = @"Popular";
    self.pageLabel.text = [NSString stringWithFormat:@"Page: %ld",(long)modelContainer.pageCount];

}

+(CGFloat)cellHeight{
    return 44.0f;
}

@end
