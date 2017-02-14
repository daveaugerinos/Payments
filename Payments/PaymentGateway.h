//
//  PaymentGateway.h
//  Payments
//
//  Created by Dave Augerinos on 2017-02-10.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PaymentDelegate <NSObject>

-(void)processPaymentAmount:(NSInteger)amount;
-(BOOL)canProcessPayment;

@end


@interface PaymentGateway : NSObject

@property (nonatomic, weak) id <PaymentDelegate> paymentDelegate;

-(void)processPaymentAmount:(NSInteger)amount;

@end
