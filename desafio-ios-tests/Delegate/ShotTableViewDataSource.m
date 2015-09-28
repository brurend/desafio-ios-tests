//
//  BaseTableViewDataSource.m
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/22/15.
//  Copyright © 2015 Bruno Rendeiro. All rights reserved.
//

#import "ShotTableViewDataSource.h"
#import "ShotCell.h"
#import "ShotModel.h"
#import "NetworkingController.h"

@interface ShotTableViewDataSource ()

@property (strong, nonatomic) NSArray* items;

@end

@implementation ShotTableViewDataSource


-(id)initWithItems:(NSArray*)items{
    [super self];
    if (self){
        self.items = items;
    }
    return self;
}


#pragma mark UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.items count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShotCell *cell = [tableView dequeueReusableCellWithIdentifier:shotCellIdentifier];
    ShotModel *item = [self.items objectAtIndex:[indexPath row]];

    [cell configureCellforShot:item];
    return cell;
}

@end
