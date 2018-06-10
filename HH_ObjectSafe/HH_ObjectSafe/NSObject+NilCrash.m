//
//  NSObject+NilCrash.m
//  HH_ObjectSafe
//
//  Created by mac on 2018/6/10.
//  Copyright © 2018年 JS. All rights reserved.
//

#import "NSObject+NilCrash.h"
#import <objc/runtime.h>

@implementation NSObject (NilCrash)

+ (void)hh_exchangeInstanceMethodWithClass:(Class)selfClass
                          originalSelector:(SEL)originalSelector
                          swizzledSelector:(SEL)swizzledSelector
{
    Method originalMethod = class_getInstanceMethod(selfClass, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(selfClass, swizzledSelector);
    BOOL didAddMethod = class_addMethod(selfClass,
                                        originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(selfClass,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
