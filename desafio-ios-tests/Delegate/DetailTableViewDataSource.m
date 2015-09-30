//
//  DetailTableViewDataSource.m
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/24/15.
//  Copyright © 2015 Bruno Rendeiro. All rights reserved.
//

#import "DetailTableViewDataSource.h"
#import "ShotModel.h"
#import "DetailCell.h"

@interface DetailTableViewDataSource ()

@property (strong, nonatomic) ShotModel *shot;

@end

@implementation DetailTableViewDataSource

-(id)initWithShot:(ShotModel*)shot{
    self = [super init];
    if (self){
        self.shot = shot;
    }
    return self;
}

#pragma mark UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailCell *cell = [tableView dequeueReusableCellWithIdentifier:[DetailCell cellIdentifier]];
    
    [cell configureCellforShot:self.shot];
    return cell;
}


#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 500.0f;
}


@end
