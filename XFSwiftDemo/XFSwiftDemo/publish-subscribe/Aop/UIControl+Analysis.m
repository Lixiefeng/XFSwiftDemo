//
//  UIControl+Analysis.m
//  PalmPay
//
//  Created by cai on 2022/2/25.
//  Copyright © 2022 Transsnet. All rights reserved.
//

#import "UIControl+Analysis.h"
#import "NSObject+Swizzle.h"
#import "XFSwiftDemo-Swift.h"

@implementation UIControl (Analysis)

+(void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originalSelector = @selector(sendAction:to:forEvent:);
        SEL swizzingSelector = @selector(cc_sendAction:to:forEvent:);
        [self xf_exchangeMethod:originalSelector withMethod:swizzingSelector];
    });
}

-(void)cc_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    [self cc_sendAction:action to:target forEvent:event];
    if ([self isKindOfClass: UIButton.class]) {
        UIButton *b = (UIButton *)self;
        NSString *buryValue = b.buryId;
        if (buryValue != nil && ![buryValue isEqualToString:@""]) {
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                NSLog(@"发送通知的线程--==--==%@",[NSThread currentThread]);
                [[NSNotificationCenter defaultCenter] postNotificationName:@"BuryEventControl" object:nil userInfo:@{
                    @"buryId": buryValue
                }];
            });
        }
    }
}

@end
