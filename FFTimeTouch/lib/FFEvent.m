//
//  FFEvent.m
//  FFTimeTouch
//
//  Created by fans on 2020/6/16.
//  Copyright © 2020 com.glority. All rights reserved.
//

#import "FFEvent.h"

static NSTimeInterval const kNormalConflictTime = 0.5f;

@interface FFEvent ()

@property (nonatomic, copy) FFEventBlock block;
@property (nonatomic, copy) FFEventBlock conflictBlock;
@property (nonatomic, assign, readwrite) NSTimeInterval createTime;
@property (nonatomic, assign, readwrite) NSTimeInterval conflictTime;

@end

@implementation FFEvent

#pragma mark - Public Method
+ (instancetype)touchWithBlock:(FFEventBlock)block conflictBlock:(FFEventBlock)conflictBlock {
    return [self touchWithConflictTime:kNormalConflictTime block:block conflictBlock:conflictBlock];
}

+ (instancetype)touchWithConflictTime:(NSTimeInterval)conflictTime block:(FFEventBlock)block conflictBlock:(FFEventBlock)conflictBlock {
    FFEvent *event = [[FFEvent alloc] initWithConflictTime:conflictTime block:block conflictBlock:conflictBlock];
    return event;
}

- (void)execute {
    if (self.block) {
        self.block();
    }
}

- (void)conflict {
    if (self.conflictBlock) {
        self.conflictBlock();
    }
}

#pragma mark - Private Method
- (instancetype)initWithConflictTime:(NSTimeInterval)conflictTime block:(FFEventBlock)block conflictBlock:(FFEventBlock)conflictBlock {
    if (self = [super init]) {
        self.conflictTime = conflictTime;
        self.block = block;
        self.conflictBlock = conflictBlock;
        self.createTime = [NSDate new].timeIntervalSince1970;
    }
    return self;
}

@end
