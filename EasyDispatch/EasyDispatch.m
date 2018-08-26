//
//  EasyDispatch.m
//  EasyDispatch
//
//  Created by ScottLiu on 1/24/18.
//  Copyright © 2018 Scott Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLTimer.h"


void delay(double time, dispatch_block_t block){
    SLTimer *timer = [[SLTimer alloc] init];
    
    // since the block cannot assume that it's the only block running on that queue, concurrent queue
    dispatch_queue_t q = dispatch_queue_create("com.scott-liu.myqueue", DISPATCH_QUEUE_CONCURRENT);
    
    // uncomment the following line for macOS 10.7 and ealier or iOS 4.3 and ealier
    //dispatch_queue_t q = dispatch_queue_create("com.scott-liu.myqueue", NULL);
    
    timer = [timer initWithTimeIntervalSinceNow:time tolerance:0 queue:q block:^(SLTimer* timer){
        block();
    }];
    [timer start];
}

void delay_main(float time, dispatch_block_t block){
    SLTimer *timer = [[SLTimer alloc] init];
    timer = [timer initWithTimeIntervalSinceNow:time tolerance:0 queue:dispatch_get_main_queue() block:^(SLTimer* timer){
        block();
    }];
    [timer start];
}
