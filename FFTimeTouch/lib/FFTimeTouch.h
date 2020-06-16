//
//  FFTimeTouch.h
//  FFTimeTouch
//
//  Created by fans on 2020/6/16.
//  Copyright © 2020 com.glority. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^FFTimeTouchBlock)(void);
@interface FFTimeTouch : NSObject

@property (nonatomic, assign) NSTimeInterval executeTime;

- (void)addTouchWithBlock:(FFTimeTouchBlock)block;
- (void)addTouch

@end

NS_ASSUME_NONNULL_END
