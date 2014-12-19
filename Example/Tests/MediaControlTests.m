//
//  MediaControlTests.m
//  Clappr
//
//  Created by Gustavo Barbosa on 12/18/14.
//  Copyright (c) 2014 globo.com. All rights reserved.
//

#import <Clappr/Clappr.h>
#import <objc/runtime.h>

SPEC_BEGIN(MediaControl)

describe(@"Media Control", ^{

    __block CLPMediaControl *mediaControl;
    __block CLPContainer *container;
    __block CLPPlayback *playback;

    beforeEach(^{
        playback = [[CLPPlayback alloc] init];
        container = [[CLPContainer alloc] initWithPlayback:playback];
        mediaControl = [[CLPMediaControl alloc] initWithContainer:container];
    });

    describe(@"General", ^{

        it(@"should have a volume property accepting values between 0 and 100", ^{
            mediaControl.volume = 57.0;
            [[theValue(mediaControl.volume) should] equal:theValue(57.0)];
        });

        it(@"should not have a volume less than 0", ^{
            mediaControl.volume = -45.0f;
            [[theValue(mediaControl.volume) should] equal:theValue(0.0)];
        });

        it(@"should not have a volume greater than 100", ^{
            mediaControl.volume = 101.2;
            [[theValue(mediaControl.volume) should] equal:theValue(100.0)];
        });

        it(@"should call container play after its play method has been called", ^{
            [[container should] receive:@selector(play)];
            [mediaControl play];
        });
    });
});

SPEC_END