//
//  NSObject+NilCrash.h
//  HH_ObjectSafe
//
//  Created by mac on 2018/6/10.
//  Copyright © 2018年 JS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (NilCrash)
+ (void)hh_exchangeInstanceMethodWithClass:(Class)selfClass
                           originalSelector:(SEL)originalSelector
                           swizzledSelector:(SEL)swizzledSelector;
@end
