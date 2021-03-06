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
#import "DetailCell.h"
#import "Shotmodel.h"
#import "NetworkClient.h"
#import "DetailViewController.h"
#import "DetailTableViewDataSource.h"
#import "ShotTableViewDataSource.h"
#import "ShotModelContainer.h"

@interface ShotViewController ()
@property (strong, nonatomic) ShotTableViewDataSource* tableViewDataSource;
@property (strong, nonatomic) DetailTableViewDataSource* detailDataSource;
//@property (weak, nonatomic) IBOutlet UITableView *detailTable;
@property (weak, nonatomic) IBOutlet UITableView *shotTable;
@property (strong, nonatomic) NSMutableArray *posts;
@property int pageCount;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (strong, nonatomic) ShotModel *shot;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *shareButton;
@property (strong, nonatomic) ShotModelContainer *modelContainer;

-(void)setUpTableView;
@end

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
        expect(svc.shotTable).toNot.beNil();
        expect(svc.shotTable.delegate).toNot.beNil();
    });
    
    it(@"should perform a segue", ^{
        expect(svc).respondTo(@selector(prepareForSegue:sender:));
    });

    it(@"should have only one section", ^{
        expect([svc.shotTable numberOfSections]).to.equal(1);
    });

    
    it(@"should have expected ammount of cells", ^{
        NSDictionary *dictonary = [TLJsonFactory tl_jsonDictFromFile:@"dribble"];
        NSArray *array = [dictonary objectForKey:@"shots"];
        
        id managerMock = [OCMockObject niceMockForClass:[NetworkClient class]];
        [[[managerMock stub] andReturn:array] getShotsWithParameters:[OCMArg any] success:[OCMArg any] failure:[OCMArg any]];
        id classMock = OCMClassMock([NetworkClient class]);
        OCMStub(ClassMethod([classMock sharedInstance])).andReturn(managerMock);


        svc.modelContainer.items = array;

        
        NSInteger row = [svc.shotTable numberOfRowsInSection:0];
        expect(row).to.equal(15);
    });

        
});

describe(@"iPad tests", ^{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        __block ShotViewController *svc;
        beforeAll(^{
            UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            UIViewController *controller = [mainStoryboard instantiateViewControllerWithIdentifier:@"ShotViewController"];
            svc = (ShotViewController*)controller;
            [svc view];
        });
        
        it(@"should have two tables", ^{
            expect(svc.shotTable).toNot.beNil;
            expect(svc.detailTable).toNot.beNil;
        });
        

        
        
    }
});

SpecEnd

