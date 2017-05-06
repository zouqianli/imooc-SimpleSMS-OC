//
//  ScoreManage.h
//  
//
//  Created by 邹前立 on 2017/4/22.
//
//

#import <Foundation/Foundation.h>

@interface ScoreManage : NSObject
@property (nonatomic,strong) NSMutableArray *scoresArr;
//MARK: 显示菜单
- (void) displayMenu;
//MARK:1 初始化成绩数组
- (NSArray *) scores;
//MARK:2 求平均成绩
- (float) avarage:(NSArray *) scores;
//MARK:3 统计成绩大于85分的人数
- (int) count:(NSArray *) scores;
//MARK:4修改指定位置处成绩
- (NSArray *) update:(NSMutableArray *) scores atIndex:(int) index;
//MARK:5打印输出所有成绩
- (void) displayAllScores:(NSArray *) scores;

@end
