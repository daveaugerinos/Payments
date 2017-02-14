//
//  main.m
//  Payments
//
//  Created by Dave Augerinos on 2017-02-10.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaymentGateway.h"
#import "PaypalPaymentService.h"
#import "StripePaymentService.h"
#import "AmazonPaymentService.h"
#import "ApplePaymentService.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Generate random dollar value
        NSInteger randomDollarValue = arc4random_uniform(900) + 100;
        
        NSLog(@"\nThank you for shopping at Acme.com\nYour total today is $%lu.\nPlease select your payment method:\n1: Paypal, 2: Stripe, 3: Amazon, 4: Apple\n> ", randomDollarValue);
        
        char str[100];
        fgets (str, 100, stdin);
        
        NSString *inputString = [[NSString alloc] initWithUTF8String:str];
        inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        // Convert input to integer
        NSInteger choice = [inputString intValue];
        
        NSLog(@"Input was %lu", choice);
        
        PaymentGateway *paymentGateway = [PaymentGateway new];
        
        switch (choice) {
            case 1: {
                PaypalPaymentService *paypal = [PaypalPaymentService new];
                paymentGateway.paymentDelegate = paypal;
                [paymentGateway processPaymentAmount:randomDollarValue];
                break;
            }

            case 2: {
                StripePaymentService *stripe = [StripePaymentService new];
                paymentGateway.paymentDelegate = stripe;
                [paymentGateway processPaymentAmount:randomDollarValue];
                break;
            }

            case 3: {
                AmazonPaymentService *amazon = [AmazonPaymentService new];
                paymentGateway.paymentDelegate = amazon;
                [paymentGateway processPaymentAmount:randomDollarValue];
                break;
            }
 
            case 4: {
                ApplePaymentService *apple = [ApplePaymentService new];
                paymentGateway.paymentDelegate = apple;
                [paymentGateway processPaymentAmount:randomDollarValue];
                break;
            }
            
            default:
                NSLog(@"Invalid choice.\n");
                break;
        }
        
    }
    return 0;
}
