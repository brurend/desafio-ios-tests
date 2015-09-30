//
//  ShotViewController2.h
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/22/15.
//  Copyright © 2015 Bruno Rendeiro. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ShotModel;

@interface ShotViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *detailTable;

-(void) loadPosts:(NSInteger)page;
-(void)setUpDetailView:(ShotModel*)shot;

@end
