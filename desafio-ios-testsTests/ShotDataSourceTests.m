//
//  ShotDataSourceTests.m
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/29/15.
//  Copyright © 2015 Bruno Rendeiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Specta.h>
#import <Expecta.h>
#import <OCMock.h>
#import <TLJsonFactory.h>

#import "ShotTableViewDataSource.h"
#import "NetworkClient.h"

SpecBegin(ShotDataSourceSpec)

describe(@"Testes do data source da tableView de shots", ^{
    __block ShotTableViewDataSource *dataSource;
    beforeAll(^{
        NSDictionary *dictonary = [TLJsonFactory tl_jsonDictFromFile:@"dribble"];
        NSArray *array = [dictonary objectForKey:@"shots"];
        
        id managerMock = [OCMockObject niceMockForClass:[NetworkClient class]];
        [[[managerMock stub] andReturn:array] getShot:[OCMArg any] parameters:[OCMArg any] success:[OCMArg any] failure:[OCMArg any]];
        id classMock = OCMClassMock([NetworkClient class]);
        OCMStub(ClassMethod([classMock sharedInstance])).andReturn(managerMock);
        
        dataSource = [[ShotTableViewDataSource alloc] initWithItems:array];
    });
    
    
    it(@"should conform to UITableViewDataSource protocol", ^{
        expect(dataSource).to.conformTo(@protocol(UITableViewDataSource));
    });
    
    it(@"should have numberOfRows equal to array count", ^{
    });
    
});

SpecEnd

