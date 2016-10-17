//
//  TimeCaculator.h
//  StoreAnalyze
//
//  Created by xuqiang on 16/10/17.
//  Copyright © 2016年 xuqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeCaculator : NSObject
@property (nonatomic,assign) int waitAccept;
@property (nonatomic,assign) int waitPickup;

@property (nonatomic,assign) int arriveTime;

+ (instancetype)shareInstance;
@end
