//
//  FFEventQueue.h
//  FFTimeTouch
//
//  Created by fans on 2020/6/16.
//  Copyright © 2020 com.glority. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class FFEvent;
typedef void(^FFEventQueueBlock)(void);
@interface FFEventQueue : NSObject

- (void)addTouch:(FFEvent *)event;

@end

NS_ASSUME_NONNULL_END
