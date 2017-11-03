//
//  SQLiteUsage.m
//  ProjectSet
//
//  Created by admin on 2017/10/30.
//  Copyright © 2017年 jpym.product.com. All rights reserved.
//

#import "SQLiteUsage.h"
#import <sqlite3.h>

static sqlite3 *db;

@interface SQLiteUsage()

@end

@implementation SQLiteUsage

- (void)openSqlite3 {
    if (db) {
        return;
    }
    NSString *str = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *strPath = [str stringByAppendingPathComponent:@"my.sqlite"];
    
   
    @try {
       int result = sqlite3_open([strPath UTF8String], &db);
        if (result == SQLITE_OK) {
             NSLog(@"%@",str);
        }

    } @catch (NSException *exception) {
        NSLog(@"%@",exception.description);
    } @finally {
        NSLog(@"finally");
    }
   
}

- (void)createTable {
    NSString *sqlite = [NSString stringWithFormat:@"create table if not exists 'student' ('number' integer primary key autoincrement not null,'name' text,'sex' text,'age'integer)"];
    //2.执行sqlite语句
    char *error = NULL;//执行sqlite语句失败的时候,会把失败的原因存储到里面
    int result = sqlite3_exec(db, [sqlite UTF8String], nil, nil, &error);
    if (result == SQLITE_OK) {
        
    }
}
- (void)queryDataWithNumber:(NSInteger) num {
    //参数化SQL语句防止，SQL注入
    NSString *sql = [NSString stringWithFormat:@"select * from student where number = '%ld'",num];
    //2.伴随指针
    sqlite3_stmt *stmt = NULL;
    //3.预执行sqlite语句
    int result = sqlite3_prepare(db, [sql UTF8String], -1, &stmt, NULL);
    if (result == SQLITE_OK) {
        while (sqlite3_step(stmt) == SQLITE_ROW) {
             sqlite3_column_int(stmt, 0); //0表示一行中的第一列
        }
    }
    
    
}

- (void)closeSqlite3 {
    int result = sqlite3_close(db);
    if (result == SQLITE_OK) {
        NSLog(@"cose_success");
    }
}

@end
