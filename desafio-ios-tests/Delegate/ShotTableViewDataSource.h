//
//  BaseTableViewDataSource.h
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/22/15.
//  Copyright © 2015 Bruno Rendeiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ShotTableViewDataSource <NSObject>

-(void)loadPosts:(int)page;

@end


@interface ShotTableViewDataSource : NSObject <UITableViewDelegate, UITableViewDataSource>

-(id)initWithItems:(NSArray*)items;

@end
