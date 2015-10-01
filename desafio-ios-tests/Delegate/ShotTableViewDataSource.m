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
#import "NetworkClient.h"
#import "ShotViewController.h"
#import "HeaderCell.h"
#import "ShotModelContainer.h"

@interface ShotTableViewDataSource ()

@property (strong, nonatomic) ShotModelContainer* modelContainer;

@end

@implementation ShotTableViewDataSource


-(id)initWithModelContainer:(ShotModelContainer*)modelContainer{
    self = [super init];
    if (self){
        self.modelContainer = modelContainer;
    }
    return self;
}


#pragma mark UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return [self.modelContainer.items count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShotCell *cell = [tableView dequeueReusableCellWithIdentifier:[ShotCell cellIdentifier]];
    ShotModel *item = [self.modelContainer.items objectAtIndex:[indexPath row]];

    
    
    [cell setup:item];
    return cell;
    
}

#pragma mark UITableViewDelegate
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == [self.modelContainer.items count]-3 && self.modelContainer.pageCount <= 50 && tableView.tag == 1){
        
        [self.shotViewController loadPosts:self.modelContainer.pageCount++];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [ShotCell cellHeight];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag == 1 && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        [self.shotViewController setUpDetailView:[self.modelContainer.items objectAtIndex:indexPath.row]];
        [self.shotViewController.detailTable reloadData];
    }
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    [HeaderCell registerNibforTableView:tableView];
    HeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:[HeaderCell cellIdentifier]];
    [cell setup:self.modelContainer];
    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return [HeaderCell cellHeight];
}

@end
