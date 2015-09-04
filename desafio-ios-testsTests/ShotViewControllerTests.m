//
//  ShotViewControllerTests.m
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/4/15.
//  Copyright (c) 2015 Bruno Rendeiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Specta.h>
#import <Expecta.h>
#import <OCMock.h>

#import "ShotViewController.h"

SpecBegin(ShotViewControllerTests)

describe(@"Testes table view principal", ^{
    __block ShotViewController *svc;
    beforeAll(^{
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *controller = [mainStoryboard instantiateViewControllerWithIdentifier:@"ShotViewController"];
        svc = (ShotViewController*)controller;
        [svc view];
    });
    
    it(@"should exist", ^{
        expect(svc).toNot.beNil();
    });
    
    it(@"should have a tableview", ^{
        expect(svc.tableView).toNot.beNil();
    });
    
    it(@"should conform with UITableView datasource and delegate protocols", ^{
        expect(svc).conformTo(@protocol(UITableViewDataSource));
        expect(svc).conformTo(@protocol(UITableViewDelegate));
    });
    
    it(@"should respond to UITableViewDataSource required methods", ^{
        expect(svc).respondTo(@selector(tableView:numberOfRowsInSection:));
        expect(svc).respondTo(@selector(tableView:cellForRowAtIndexPath:));
    });

    
});

SpecEnd

