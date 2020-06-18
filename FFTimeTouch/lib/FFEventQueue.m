//
//  FFEventQueue.m
//  FFTimeTouch
//
//  Created by fans on 2020/6/16.
//  Copyright © 2020 com.glority. All rights reserved.
//

#import "FFEventQueue.h"
#import "FFEvent.h"

@interface FFEventQueue ()

@property (nonatomic, strong) FFEvent *waitEvent;

@end

@implementation FFEventQueue

#pragma mark - Public Method
- (void)addTouch:(FFEvent *)event {
    if (self.waitEvent) {
        [self.waitEvent conflict];
        [self stopWait];
    }
    
    [self beginWaitForEvent:event];
}

#pragma mark - Private Method
- (void)beginWaitForEvent:(FFEvent *)event {
    event.enterQueueTime = [NSDate new].timeIntervalSince1970;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(event.conflictTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.waitEvent == event) {
            [event execute];
            [self stopWait];
        }
    });
    self.waitEvent = event;
}

- (void)stopWait {
    self.waitEvent = nil;
    [self stopTimer];
}

- (void)stopTimer {
    
}

@end
