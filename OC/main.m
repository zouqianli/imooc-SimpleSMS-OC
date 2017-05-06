//
//  main.m
//  OC
//
//  Created by 邹前立 on 2017/4/22.
//  Copyright © 2017年 邹前立. All rights reserved.
//

#import "ScoreManage.h"
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int input = -1;
        int inputItem = -1;
        ScoreManage *scoreManage = [[ScoreManage alloc] init];
        while (input != 0) {
            
            // 显示菜单
            [scoreManage displayMenu];
            NSLog(@"请输入对应数字进行操作");
            
            // 输入整数菜单选项
            scanf("%d",&inputItem);
            // 根据整数调用对应方法
            switch (inputItem) {
                case 0: {
                    NSLog(@"退出程序！");
                    break;
                }
                case 1: {
                    [scoreManage scores];
                    break;
                case 2: {
                    float aver = [scoreManage avarage:scoreManage.scoresArr];
                    NSLog(@"平均成绩为：%.2f",aver);
                    break;
                }
                case 3: {
                    int count = [scoreManage count:scoreManage.scoresArr];
                    NSLog(@"大于85分的人数：%d",count);
                    break;
                }
                case 4: {
                    int index = -1;
                    [scoreManage update:scoreManage.scoresArr atIndex:index]; // 或者利用返回值赋值给属性
                    break;
                }
                case 5: {
                    [scoreManage displayAllScores:scoreManage.scoresArr];
                    break;
                }
                default: {
                        NSLog(@"输入错误！");
                }
            inputItem = -1; // 重置，不然回车有上一次输入的值，直接运行上次的选项。但是退出选项后会输出菜单。while中inputItem改为使用input判断0，退出
        }

    }
        }
    }
    return 0;
}
