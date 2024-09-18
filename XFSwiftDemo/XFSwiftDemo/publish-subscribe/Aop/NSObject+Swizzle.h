//
//  NSObject+Swizzle.swift
//  XFSwiftDemo
//
//  Created by Aron.Li on 2024/9/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Swizzle)

+ (BOOL)xf_overrideMethod:(SEL)origSel withMethod:(SEL)altSel;
+ (BOOL)xf_overrideClassMethod:(SEL)origSel withClassMethod:(SEL)altSel;
+ (BOOL)xf_exchangeMethod:(SEL)origSel withMethod:(SEL)altSel;
+ (BOOL)xf_exchangeClassMethod:(SEL)origSel withClassMethod:(SEL)altSel;

@end

NS_ASSUME_NONNULL_END
