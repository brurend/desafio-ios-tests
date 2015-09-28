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
#import <TLJsonFactory.h>

#import "ShotViewController.h"
#import "ShotCell.h"
#import "Shotmodel.h"
#import "NetworkingController.h"


SpecBegin(ShotViewControllerTests)

//describe(@"Testes table view principal", ^{
//    __block ShotViewController *svc;
//    __block ShotCell *cell;
//    beforeAll(^{
//        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        UIViewController *controller = [mainStoryboard instantiateViewControllerWithIdentifier:@"ShotViewController"];
//        svc = (ShotViewController*)controller;
//        cell = [svc.tableView dequeueReusableCellWithIdentifier:@"shotCell"];
//        [svc view];
//    });
//    
//    it(@"should exist", ^{
//        expect(svc).toNot.beNil();
//    });
//    
//    it(@"should have a tableview", ^{
//        expect(svc.tableView).toNot.beNil();
//        expect(svc.tableView.delegate).toNot.beNil();
//    });
//    
//    it(@"should have a prototype cell", ^{
//        expect(cell).toNot.beNil();
//    });
//    
//    it(@"should have an imageview", ^{
//        expect(cell.shotImage).toNot.beNil();
//    });
//    
//    it(@"should have a title label", ^{
//        expect(cell.shotLabel).toNot.beNil();
//    });
//    
//    it(@"should have a viewsCount label", ^{
//        expect(cell.shotViewsCount).toNot.beNil();
//    });
//    
//    it(@"should have a container view", ^{
//        expect(cell.shotView).toNot.beNil();
//    });
//    
//    it(@"should perform a segue", ^{
//        expect(svc).respondTo(@selector(prepareForSegue:sender:));
//    });
//    
//    it(@"should have only one section", ^{
//        expect([svc.tableView numberOfSections]).to.equal(1);
//    });
//    
//    it(@"should conform with UITableView datasource and delegate protocols", ^{
//        expect(svc).conformTo(@protocol(UITableViewDataSource));
//        expect(svc).conformTo(@protocol(UITableViewDelegate));
//    });
//    
//    it(@"should respond to UITableViewDataSource required methods", ^{
//        expect(svc).respondTo(@selector(tableView:numberOfRowsInSection:));
//        expect(svc).respondTo(@selector(tableView:cellForRowAtIndexPath:));
//    });
//    
//    it(@"should have expected ammount of cells", ^{
//        NSDictionary *dictonary = [TLJsonFactory tl_jsonDictFromFile:@"dribble"];
//        NSArray *array = [dictonary objectForKey:@"shots"];
//        
//        id managerMock = [OCMockObject niceMockForClass:[NetworkingController class]];
//        [[[managerMock stub] andReturn:array] getShot:[OCMArg any] parameters:[OCMArg any] success:[OCMArg any] failure:[OCMArg any]];
//        id classMock = OCMClassMock([NetworkingController class]);
//        OCMStub(ClassMethod([classMock sharedInstance])).andReturn(managerMock);
//        
//        for (int i = 0; i < [array count]; i++){
//            [svc.posts addObject:[ShotModel parse:[array objectAtIndex:i]]];
//        }
//        
//        NSInteger row = [svc.tableView numberOfRowsInSection:0];
//        expect(row).to.equal(15);
//    });
//
//    
//});

SpecEnd

