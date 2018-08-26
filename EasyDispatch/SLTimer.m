//
//  SLTimer.m
//  EasyDispatch
//
//  Created by ScottLiu on 1/26/18.
//  Copyright © 2018 Scott Liu. All rights reserved.
//
//  You are welcome to take the SLTimer files and integrate them into your project seperately

#import <Foundation/Foundation.h>
#import <dispatch/dispatch.h>
#import "SLTimer.h"

@interface SLTimer ()
@end

@implementation SLTimer {
    dispatch_source_t   _timer;     // the timer itself
    uint64_t            _interval;  // the delay until the timer fires
    uint64_t            _leeway;    // the leeway we allow after the interval for power savings
}

// NSTimeInterval is literally the same type as double;
// however, it is good practice to use NSTimeInterval when dealing with time quantities
- (id) initWithTimeIntervalSinceNow:(NSTimeInterval)delay
                          tolerance:(double)tolerance
                              queue:(dispatch_queue_t)queue
                              block:(SLTimerHandler)block;
{
    self = [super init];
    if (self) {
        // interval and leeway are both defined in nanoseconds
        _interval = delay * NSEC_PER_SEC;
        _leeway = tolerance * NSEC_PER_SEC;
        // Documentation:
        // dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, unsigned long mask, dispatch_queue_t queue);
        _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        
        dispatch_source_set_event_handler(_timer, ^{
            // cancel immediately since this is a one shot timer
            dispatch_source_cancel(self->_timer);
            if (block) {
                // if block is not nil, then execute it
                block(self);
            }
        });
    }
    return self;
}


// Invoking this method has no effect if the timer source has already been canceled.
- (void) start {
    assert(_timer);
    dispatch_source_set_timer(_timer, dispatch_time(DISPATCH_TIME_NOW, _interval),
                              DISPATCH_TIME_FOREVER /*one shot*/, _leeway);
    dispatch_resume(_timer);
}

- (void) cancel {
    dispatch_source_cancel(_timer);
}

// same as cancel
- (void) dealloc {
    dispatch_source_cancel(_timer);
}

- (BOOL) isValid {
    return _timer && 0 == dispatch_source_testcancel(_timer);
}

@end
