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
#import "NetworkClient.h"

#import "ShotModel.h"

SpecBegin(ShotModelTests)

describe(@"Testes shot model", ^{
    __block NSArray *array;
    beforeAll(^{
        NSDictionary *dictonary = [TLJsonFactory tl_jsonDictFromFile:@"dribble"];
        array = [dictonary objectForKey:@"shots"];
        
        id managerMock = [OCMockObject niceMockForClass:[NetworkClient class]];
        [[[managerMock stub] andReturn:array] getShotsWithParameters:[OCMArg any] success:[OCMArg any] failure:[OCMArg any]];
        id classMock = OCMClassMock([NetworkClient class]);
        OCMStub(ClassMethod([classMock sharedInstance])).andReturn(managerMock);
    });
    
    it(@"should parse dictonary json", ^{

        
        ShotModel *sm = [ShotModel parse:[array objectAtIndex:0]];
        expect(sm).toNot.beNil();
        expect(sm.player).to.beInstanceOf([ShotPlayerModel class]);
        expect(sm.image).to.beKindOf([NSURL class]);
    });
    
    it(@"should parse array json", ^{
        
        NSArray *shotArray = [ShotModel parseArray:array];
        expect(shotArray).toNot.beNil();
        expect([shotArray objectAtIndex:0]).to.beInstanceOf([ShotModel class]);
    });
    
});

SpecEnd

