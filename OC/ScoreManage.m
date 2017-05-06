//
//  ScoreManage.m
//  
//
//  Created by 邹前立 on 2017/4/22.
//
//

#import "ScoreManage.h"

@implementation ScoreManage
//MARK: 显示菜单
- (void) displayMenu {
    NSLog(@"*************************************");
    NSLog(@"\t1--初始化数学成绩");
    NSLog(@"\t2--求成绩的平均值");
    NSLog(@"\t3--统计成绩大于85分的人数");
    NSLog(@"\t4--修改制定位置处的成绩");
    NSLog(@"\t5--打印输出所有成绩");
    NSLog(@"\t0--退出");
    NSLog(@"*************************************");
}
//MARK:1 初始化成绩数组
- (NSArray *) scores {
    NSLog(@"请输入要存储数学成绩的数量");
    int length = 0;
    scanf("%d",&length);
    NSMutableArray *tmpArr = [NSMutableArray arrayWithCapacity:length];
    for (int i=0; i<length; i++) {
        NSLog(@"请输入第%d个学生的数学成绩",i+1);
        float score = 0;
        scanf("%f",&score);
        if (score) { // 回车
             [tmpArr addObject:[NSNumber numberWithFloat:score]];
        }
    }
    _scoresArr = tmpArr;
    return _scoresArr;
}
//MARK:2 求平均成绩
- (float) avarage:(NSArray *) scores {
    if (scores.count <= 0) {
        NSLog(@"数组内容为空，请先输入成绩");
    }
    float sum = 0.0;
    for (NSNumber *score in _scoresArr) {
        sum += score.floatValue;
    }
    float average = sum / _scoresArr.count;
    
    return average;
}
//MARK:3 统计成绩大于85分的人数
- (int) count:(NSArray *) scores {
    int count = 0;
    if (scores.count <= 0) {
        NSLog(@"数组内容为空，请先输入成绩");
    }
    for (NSNumber *score in _scoresArr) {
        if (score.intValue <= 85) {
            continue;
        }
        count++;
    }
    return count;
}
//MARK:4修改指定位置处成绩
- (NSArray *) update:(NSMutableArray *) scores atIndex:(int) index {
    if (scores.count <= 0) {
        NSLog(@"数组内容为空，请先输入成绩");
        return scores;
    }
//    NSMutableArray *newScoresArr = [NSMutableArray arrayWithCapacity:_scoresArr.count];
    NSLog(@"\n修改前%ld：\n成绩为：",scores.count);
    [self displayAllScores:scores];
    
    while (index < 0 || index >= scores.count) {
        NSLog(@"请输入要修该的合法的索引位置【0~%lu】:",(unsigned long)scores.count-1);
        scanf("%d",&index);
    }
    float newScore = -1.0;
    while (newScore < 0 || newScore > 100) {
        NSLog(@"请输入合法的成绩:【0~100】");
        scanf("%f",&newScore);
    }
    for (int i=0; i<scores.count; i++) {
        if (i == index) {
           scores[index] = [NSNumber numberWithFloat:newScore];
        }
    }
    
    NSLog(@"\n修改后：\n成绩为：");
    [self displayAllScores:_scoresArr];
//    [self displayAllScores:newScoresArr];
    return _scoresArr;
}
//MARK:5打印输出所有成绩
- (void) displayAllScores:(NSArray *) scores {
    if (scores.count <= 0) {
        NSLog(@"数组内容为空，请先输入成绩");
    }
    for (NSNumber *score in scores) {
//        NSLog(@"%.2f",score.floatValue);
        printf("%.2f",score.floatValue);
    }
    
}

@end
