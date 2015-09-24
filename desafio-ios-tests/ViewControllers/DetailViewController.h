//
//  DetailViewController.h
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/24/15.
//  Copyright © 2015 Bruno Rendeiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailTableViewDataSource.h"

@interface DetailViewController : UIViewController <DetailTableViewDataSource>

@property (strong, nonatomic) ShotModel *shot;


@end
