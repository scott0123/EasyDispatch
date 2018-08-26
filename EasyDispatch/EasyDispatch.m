//
//  EasyDispatch.m
//  EasyDispatch
//
//  Created by ScottLiu on 1/24/18.
//  Copyright © 2018 Scott Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLTimer.h"


void delay(float time, dispatch_block_t block){
    SLTimer *timer = [[SLTimer alloc] init];
    timer = [timer initWithTimeIntervalSinceNow:time tolerance:0 queue:dispatch_get_main_queue() block:^(SLTimer* timer){
        block();
    }];
    [timer start];
}
