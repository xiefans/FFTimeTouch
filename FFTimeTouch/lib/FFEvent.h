//
//  FFTouch.h
//  FFTimeTouch
//
//  Created by fans on 2020/6/16.
//  Copyright © 2020 com.glority. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^FFEventBlock)(void);
@interface FFEvent : NSObject

+ (instancetype)touchWithBlock:(FFEventBlock)block conflictBlock:(FFEventBlock)conflictBlock;
+ (instancetype)touchWithConflictTime:(NSTimeInterval)conflictTime block:(FFEventBlock)block conflictBlock:(FFEventBlock)conflictBlock;

- (void)execute;
- (void)conflict;

@property (nonatomic, assign, readonly) NSTimeInterval createTime;
@property (nonatomic, assign) NSTimeInterval enterQueueTime;
/**
 从 enterQueueTime 往后计算， 过了 conflictTime 才会执行该事件， 否则会被冲突掉，释放掉；
 单位： s
 */
@property (nonatomic, assign, readonly) NSTimeInterval conflictTime;

@end

NS_ASSUME_NONNULL_END
