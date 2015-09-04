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

#import "ShotModel.h"

SpecBegin(ShotModelTests)

describe(@"Testes shot model", ^{
    
    it(@"should exist", ^{
        ShotModel *sm = [[ShotModel alloc] init];
        expect(sm).notTo.beNil;
    });
    
});

SpecEnd

