//
//  NSObject+Swizzle.swift
//  XFSwiftDemo
//
//  Created by Aron.Li on 2024/9/13.
//

#import "NSObject+Swizzle.h"
#import <objc/runtime.h>

@implementation NSObject (Swizzle)

+ (BOOL)xf_overrideMethod:(SEL)origSel withMethod:(SEL)altSel {
    Method origMethod =class_getInstanceMethod(self, origSel);
    if (!origSel) {
        NSLog(@"original method %@ not found for class %@", NSStringFromSelector(origSel), [self class]);
        return NO;
    }

    Method altMethod =class_getInstanceMethod(self, altSel);
    if (!altMethod) {
        NSLog(@"original method %@ not found for class %@", NSStringFromSelector(altSel), [self class]);
        return NO;
    }

    method_setImplementation(origMethod, class_getMethodImplementation(self, altSel));

    return YES;
}
+ (BOOL)xf_overrideClassMethod:(SEL)origSel withClassMethod:(SEL)altSel {
    Class c = object_getClass((id)self);
    return [c xf_overrideMethod:origSel withMethod:altSel];
}
+ (BOOL)xf_exchangeMethod:(SEL)origSel withMethod:(SEL)altSel {
    Method origMethod =class_getInstanceMethod(self, origSel);
    if (!origSel) {
        NSLog(@"original method %@ not found for class %@", NSStringFromSelector(origSel), [self class]);
        return NO;
    }

    Method altMethod =class_getInstanceMethod(self, altSel);
    if (!altMethod) {
        NSLog(@"original method %@ not found for class %@", NSStringFromSelector(altSel), [self class]);
        return NO;
    }

    class_addMethod(self,
                    origSel,
                    class_getMethodImplementation(self, origSel),
                    method_getTypeEncoding(origMethod));
    class_addMethod(self,
                    altSel,
                    class_getMethodImplementation(self, altSel),
                    method_getTypeEncoding(altMethod));

    method_exchangeImplementations(class_getInstanceMethod(self, origSel),class_getInstanceMethod(self, altSel));

    return YES;
}

+ (BOOL)xf_exchangeClassMethod:(SEL)origSel withClassMethod:(SEL)altSel {
    Class c = object_getClass((id)self);
    return [c xf_exchangeMethod:origSel withMethod:altSel];
}

@end
