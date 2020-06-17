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

@property (nonatomic, assign) dispatch_source_t timer;
@property (nonatomic, strong) FFEvent *waitEvent;

@end

@implementation FFEventQueue

#pragma mark - Public Method
- (void)addTouch:(FFEvent *)event {
    if (self.waitEvent) {
        [self stopWait];
    }
    
    [self beginWaitForEvent:event];
}

#pragma mark - Private Method
- (void)beginWaitForEvent:(FFEvent *)event {
    event.enterQueueTime = [NSDate new].timeIntervalSince1970;
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, event.conflictTime * NSEC_PER_SEC, 0.f * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        [event execute];
        [self stopWait];
    });
    dispatch_resume(timer);
    self.timer = timer;
    self.waitEvent = event;
}

- (void)stopWait {
    [self.waitEvent conflict];
    self.waitEvent = nil;
    [self stopTimer];
}

- (void)stopTimer {
//    dispatch_source_cancel(self.timer);
    self.timer = NULL;
}

@end
