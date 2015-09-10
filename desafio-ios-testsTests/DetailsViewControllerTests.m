//
//  DetailsViewControllerTests.m
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/9/15.
//  Copyright (c) 2015 Bruno Rendeiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Specta.h>
#import <Expecta.h>
#import <OCMock.h>

#import "DetailsViewController.h"
#import "ShotCell.h"
#import "DetailsCell.h"

SpecBegin(DetailsViewControllerSpec)

describe(@"Testes detail view controller", ^{
    __block DetailsViewController *dvc;
    __block ShotCell *cell;
    __block DetailsCell *dCell;
    beforeAll(^{
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *controller = [mainStoryboard instantiateViewControllerWithIdentifier:@"detailsViewController"];
        dvc = (DetailsViewController*)controller;
        cell = [dvc.tableView dequeueReusableCellWithIdentifier:@"shotCell"];
        dCell = [dvc.tableView dequeueReusableCellWithIdentifier:@"detailsCell"];
        [dvc view];
    });
    
    it(@"should exist", ^{
        expect(dvc).toNot.beNil();
    });
    
    it(@"should have a table view", ^{
        expect(dvc.tableView).toNot.beNil();
    });
    
    it(@"should have a prototype shot cell", ^{
        expect(cell).toNot.beNil();
    });
    
    it(@"should have a prototype details cell", ^{
        expect(dCell).toNot.beNil();
    });
    
    it(@"should have an imageview", ^{
        expect(cell.shotImage).toNot.beNil();
    });
    
    it(@"should have a title label", ^{
        expect(cell.shotLabel).toNot.beNil();
    });
    
    it(@"should have a viewsCount label", ^{
        expect(cell.shotViewsCount).toNot.beNil();
    });
    
    it(@"should have a container view", ^{
        expect(cell.shotView).toNot.beNil();
    });
    
    it(@"should have a player name label", ^{
        expect(dCell.nameLabel).toNot.beNil();
    });
    
    it(@"should have a player image", ^{
        expect(dCell.avatarImage).toNot.beNil();
    });

    it(@"should have a description", ^{
        expect(dCell.descLabel).toNot.beNil();
    });
    
    it(@"should conform with UITableView datasource and delegate protocols", ^{
        expect(dvc).conformTo(@protocol(UITableViewDataSource));
        expect(dvc).conformTo(@protocol(UITableViewDelegate));
    });
    
    it(@"should respond to UITableViewDataSource required methods", ^{
        expect(dvc).respondTo(@selector(tableView:numberOfRowsInSection:));
        expect(dvc).respondTo(@selector(tableView:cellForRowAtIndexPath:));
    });
    
    
});

SpecEnd

