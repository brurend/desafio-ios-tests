//
//  DetailTableViewDataSource.h
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/24/15.
//  Copyright © 2015 Bruno Rendeiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShotModel;


@interface DetailTableViewDataSource : NSObject <UITableViewDelegate, UITableViewDataSource>

-(id)initWithShot:(ShotModel*)shot;

@end
