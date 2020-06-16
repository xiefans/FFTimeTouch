//
//  FFTouch.h
//  FFTimeTouch
//
//  Created by fans on 2020/6/16.
//  Copyright © 2020 com.glority. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^FFTouchBlock)(void);
@interface FFTouch : NSObject

+ (instancetype)touchWithBlock:(FFTouchBlock)block;

- (void)execute;

@property (nonatomic, assign) NSTimeInterval createTime;

/// 希望执行的时间， 如果没有
@property (nonatomic, assign) NSTimeInterval hopeExecuteTime;

@end

NS_ASSUME_NONNULL_END
