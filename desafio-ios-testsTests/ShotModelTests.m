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
        
        expect(sm).notTo.beNil;
    });
    
//    it(@"should parse", ^{
//        NSDictionary *dictonary = [TLJsonFactory tl_jsonDictFromFile:@"dribble.json"];
//        NSArray *array = [dictonary objectForKey:@"shots"];
//        
//        id managerMock = [OCMockObject niceMockForClass:[NetworkingController class]];
//        [[[managerMock stub] andReturn:array] getShot:[OCMArg any] parameters:[OCMArg any] success:[OCMArg any] failure:[OCMArg any]];
//        id classMock = OCMClassMock([NetworkingController class]);
//        OCMStub(ClassMethod([classMock sharedInstance])). andReturn(managerMock);
//        
//        ShotModel *sm = [array objectAtIndex:1];
//        expect(sm).toNot.beNil;
//    });
    

    
});

SpecEnd

