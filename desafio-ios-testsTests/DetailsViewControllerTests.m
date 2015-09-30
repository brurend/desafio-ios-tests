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
#import <TLJsonFactory.h>


#import "DetailViewController.h"
#import "DetailCell.h"
#import "DetailTableViewDataSource.h"
#import "NetworkClient.h"


@interface DetailViewController ()

@property (strong, nonatomic) DetailTableViewDataSource *detailDataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

SpecBegin(DetailsViewControllerSpec)

describe(@"Testes detail view controller", ^{
    __block DetailViewController *dvc;
    beforeAll(^{
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *controller = [mainStoryboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
        dvc = (DetailViewController*)controller;

        [dvc view];
    });
    
    it(@"should exist", ^{
        expect(dvc).toNot.beNil();
    });
    
    it(@"should have a table view", ^{
        expect(dvc.tableView).toNot.beNil();
    });
    
    it(@"should conform with UITableView datasource and delegate protocols", ^{
        expect(dvc).conformTo(@protocol(DetailTableViewDataSource));
    });
    
    it(@"should have only one row", ^{
        expect([dvc.tableView numberOfRowsInSection:0]).to.equal(1);
    });
    
});

SpecEnd

