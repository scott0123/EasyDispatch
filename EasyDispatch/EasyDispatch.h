//
//  EasyDispatch.h
//  EasyDispatch
//
//  Created by ScottLiu on 1/24/18.
//  Copyright © 2018 Scott Liu. All rights reserved.
//

#import <Cocoa/Cocoa.h>

//! Project version number for EasyDispatch.
FOUNDATION_EXPORT double EasyDispatchVersionNumber;

//! Project version string for EasyDispatch.
FOUNDATION_EXPORT const unsigned char EasyDispatchVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <EasyDispatch/PublicHeader.h>

/**
 Applies a user specified time delay to a block of code.
 
 @param time The delay in seconds before the timer fires
 
 @param block  The block to submit. This parameter cannot be NULL.
 */
void delay(double time, dispatch_block_t block);

// Use this version if you want to be able to update your UI elements or access
// the main thread from within the block.
void delay_main(double time, dispatch_block_t block);
