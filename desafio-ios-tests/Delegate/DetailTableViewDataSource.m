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
    [super self];
    if (self){
        self.shot = shot;
    }
    return self;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailCell *cell = [tableView dequeueReusableCellWithIdentifier:detailCellIdentifier];
    
    [cell configureCellforShot:self.shot];
    return cell;
}

@end
