//
//  BaseTableViewCell.m
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/30/15.
//  Copyright © 2015 Bruno Rendeiro. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell


+(CGFloat)cellHeight{
    return 0;
}
-(void)setup:(id)obj{

}

+(NSString*)cellIdentifier{
    return NSStringFromClass([self class]);
}

+(void)registerNibforTableView:(UITableView*)tableView{
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:[self cellIdentifier]];
}


@end
