//
//  BaseTableViewDataSource.h
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/22/15.
//  Copyright © 2015 Bruno Rendeiro. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ShotViewController, ShotModelContainer;

@interface ShotTableViewDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

-(id)initWithModelContainer:(ShotModelContainer*)modelContainer;
@property (strong, nonatomic) ShotViewController* shotViewController;


@end
