//
//  PaypalPaymentService.m
//  Payments
//
//  Created by Dave Augerinos on 2017-02-10.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import "PaypalPaymentService.h"

@implementation PaypalPaymentService

-(void)processPaymentAmount:(NSInteger)amount {
    
    NSLog(@"PayPal processed amount $%lu.", amount);
    
}

-(BOOL)canProcessPayment {
    
    // Randomly determined ability to process payment
    if(arc4random_uniform(2) == 0) {
        return NO;
    }
    
    else {
        return YES;
    }
}

@end
