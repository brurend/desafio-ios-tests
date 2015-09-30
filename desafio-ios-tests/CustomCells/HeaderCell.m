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

-(void)configureCellforModelContainer:(ShotModelContainer*)modelContainer{
    self.categoryLabel.text = @"Popular";
    self.pageLabel.text = [NSString stringWithFormat:@"Page: %ld",(long)modelContainer.pageCount];
}

+(NSString*)cellIdentifier{
    return NSStringFromClass([self class]);
}

+(UINib*)registerNib{
    return [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
}

@end
