//
//  PaymentGateway.m
//  Payments
//
//  Created by Dave Augerinos on 2017-02-10.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import "PaymentGateway.h"

@implementation PaymentGateway


-(void)processPaymentAmount:(NSInteger)amount {
    
    // Check if delegate can process the payment
    if([self.paymentDelegate canProcessPayment]) {
        
        // Pass on payment processing to delegate
        [self.paymentDelegate processPaymentAmount:amount];
    }
    
    else {
        NSLog(@"Sorry unable to process the payment.");
    }
}

@end
