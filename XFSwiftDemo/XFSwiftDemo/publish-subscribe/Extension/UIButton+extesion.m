//
//  UIButton+extesion.m
//  XFSwiftDemo
//
//  Created by Aron.Li on 2024/9/13.
//

#import "UIButton+extesion.h"
#import <objc/runtime.h>

static const void  *buryIdKey = @"bury_id_key";

@implementation UIButton (extesion)

- (NSString *)buryId {
    return objc_getAssociatedObject(self, buryIdKey);
}

- (void)setBuryId:(NSString *)buryId {
    objc_setAssociatedObject(self, buryIdKey, buryId, OBJC_ASSOCIATION_COPY);
}

@end
