//
//  LSPredicate.m
//  ProjectSet
//
//  Created by admin on 2017/10/26.
//  Copyright © 2017年 jpym.product.com. All rights reserved.
//

#import "LSPredicate.h"
/**
 谓语中常用的一些内容: NOT, IN , like
 大小写比较: [c]:表示忽略大小写,[d]：表示忽略重音
 使用正则表达式：,
 */
@implementation LSPredicate
- (void)predicateFilterArrayObj {
    
    NSArray *arrayFilter = @[@"abc1",@"abc2"];
    NSArray *arrayContent = @[@"a1",@"abc1",@"abc4",@"abc2"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"NOT (SELF in %@)",arrayFilter];
    
    
    NSString *str = @"123";
    NSPredicate *strPredicate = [NSPredicate predicateWithFormat:@"SELF in 123"];
    ;
    NSLog(@"%d",[strPredicate evaluateWithObject:str]);
    
}


@end
