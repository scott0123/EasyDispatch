//
//  SLTimer.h
//  EasyDispatch
//
//  Created by ScottLiu on 1/26/18.
//  Copyright © 2018 Scott Liu. All rights reserved.
//  Inspired by Andreas Grosam, who could be found at https://github.com/couchdeveloper
//
//  You are welcome to take the SLTimer files and integrate them into your project seperately

#ifndef SLTimer_h
#define SLTimer_h

#import <Foundation/Foundation.h>

@class SLTimer;

// typedef the "SLTimerHandler" block that takes a single SLTimer as a parameter and returns nothing
typedef void (^SLTimerHandler)(SLTimer* timer);

@interface SLTimer : NSObject

/**
 Initializes a cancelable, one-shot timer in suspended state.
 
 @param delay  The delay in seconds after the timer will fire
 
 @param tolerance Setting a tolerance for a timer allows it to fire later than the scheduled fire date. Allowing the system flexibility in when a timer fires increases the ability of the system to optimize for increased power savings and responsiveness.
 
 @param queue  The queue on which to submit the block.
 
 @param block  The block to submit. This parameter cannot be NULL.
 
 @return A SLTimer object that has been initialized.
 */
- (id)initWithTimeIntervalSinceNow:(NSTimeInterval)delay
                         tolerance:(double)tolerance
                             queue:(dispatch_queue_t)queue
                             block:(SLTimerHandler)block;
/**
 Starts the timer.
 */
- (void) start;

/**
 Cancels the timer.
 
 @description Before you call this it is your own responsibility to check that the timer is still valid.
 */
- (void)cancel;

/**
 This function checks if the timer is still valid
 
 @description Returns YES if the timer has not yet been fired and it is not cancelled.
 Otherwise returns NO
 */
- (BOOL)isValid;


@end

#endif /* SLTimer_h */
