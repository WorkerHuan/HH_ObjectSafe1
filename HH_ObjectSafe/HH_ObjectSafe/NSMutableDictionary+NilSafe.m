//
//  NSMutableDictionary+NilSafe.m
//  HH_ObjectSafe
//
//  Created by mac on 2018/6/10.
//  Copyright © 2018年 JS. All rights reserved.
//

#import "NSMutableDictionary+NilSafe.h"
#import "NSObject+NilCrash.h"

@implementation NSMutableDictionary (NilSafe)


+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = NSClassFromString(@"__NSDictionaryM");
        [NSObject hh_exchangeInstanceMethodWithClass:class originalSelector:@selector(setObject:forKey:) swizzledSelector:@selector(gl_setObject:forKey:)];
        [NSObject hh_exchangeInstanceMethodWithClass:class originalSelector:@selector(setObject:forKeyedSubscript:) swizzledSelector:@selector(gl_setObject:forKeyedSubscript:)];
    });
}

- (void)gl_setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    if (!aKey || !anObject) {
        return;
    }
    [self gl_setObject:anObject forKey:aKey];
}

- (void)gl_setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key {
    if (!key || !obj) {
        return;
    }
    [self gl_setObject:obj forKeyedSubscript:key];
}

@end
