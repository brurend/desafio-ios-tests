//
//  ShotPlayerTests.m
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/4/15.
//  Copyright (c) 2015 Bruno Rendeiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Specta.h>
#import <Expecta.h>
#import <OCMock.h>

#import "ShotPlayerModel.h"

SpecBegin(ShotPlayerTests)

describe(@"Tests shot player", ^{
    
    it(@"should exist", ^{
        ShotPlayerModel *spm = [[ShotPlayerModel alloc] init];
        expect(spm).toNot.beNil;
    });
    
    
});

SpecEnd
