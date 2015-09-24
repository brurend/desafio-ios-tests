//
//  ShotViewController.h
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/4/15.
//  Copyright (c) 2015 Bruno Rendeiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"


@interface ShotViewController : UITableViewController

@property (strong, nonatomic) AFHTTPRequestOperationManager *manager;
@property NSMutableArray *posts;
@property int pageCount;

@end
