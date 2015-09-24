//
//  ViewController.h
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/4/15.
//  Copyright (c) 2015 Bruno Rendeiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShotModel.h"


@interface DetailsViewController : UITableViewController


@property (strong, nonatomic) ShotModel *shot;
@property (strong, nonatomic) NSUserActivity *activity;

//-(void)search;

@end

