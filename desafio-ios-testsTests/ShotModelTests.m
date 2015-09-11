//
//  ShotModelTests.m
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
#import "ShotPlayerModel.h"
#import "NetworkingController.h"

#import "ShotModel.h"

SpecBegin(ShotModelTests)

describe(@"Testes shot model", ^{
    
    it(@"should exist", ^{
        ShotModel *sm = [[ShotModel alloc] init];
        
        expect(sm).notTo.beNil();
    });
    
    it(@"should parse dictonary json", ^{
        NSDictionary *dictonary = [TLJsonFactory tl_jsonDictFromFile:@"dribble"];
        NSArray *array = [dictonary objectForKey:@"shots"];
        
        id managerMock = [OCMockObject niceMockForClass:[NetworkingController class]];
        [[[managerMock stub] andReturn:array] getShot:[OCMArg any] parameters:[OCMArg any] success:[OCMArg any] failure:[OCMArg any]];
        id classMock = OCMClassMock([NetworkingController class]);
        OCMStub(ClassMethod([classMock sharedInstance])).andReturn(managerMock);
        
        ShotModel *sm = [ShotModel parse:[array objectAtIndex:0]];
        expect(sm).toNot.beNil();
        expect(sm.player).to.beInstanceOf([ShotPlayerModel class]);
        expect(sm.image).to.beKindOf([NSURL class]);
    });
    
    it(@"should parse array json", ^{
        NSDictionary *dictonary = [TLJsonFactory tl_jsonDictFromFile:@"dribble"];
        NSArray *array = [dictonary objectForKey:@"shots"];
        
        id managerMock = [OCMockObject niceMockForClass:[NetworkingController class]];
        [[[managerMock stub] andReturn:array] getShot:[OCMArg any] parameters:[OCMArg any] success:[OCMArg any] failure:[OCMArg any]];
        id classMock = OCMClassMock([NetworkingController class]);
        OCMStub(ClassMethod([classMock sharedInstance])).andReturn(managerMock);
        
        NSArray *shotArray = [ShotModel parseArray:array];
        expect(shotArray).toNot.beNil();
        expect([shotArray objectAtIndex:0]).to.beInstanceOf([ShotModel class]);
    });
    
});

SpecEnd

