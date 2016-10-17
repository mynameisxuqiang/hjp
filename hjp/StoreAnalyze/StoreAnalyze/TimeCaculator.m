//
//  TimeCaculator.m
//  StoreAnalyze
//
//  Created by xuqiang on 16/10/17.
//  Copyright © 2016年 xuqiang. All rights reserved.
//

#import "TimeCaculator.h"

#define kAcceptTime  1
#define kWaitPickup  2
#define kLogisticalTime  20

@implementation TimeCaculator

+ (instancetype)shareInstance{
    static TimeCaculator *c = nil;
    if (c == nil) {
        c = [[self alloc]init];
    }
    return c;
}

- (instancetype)init{
    if (self = [super init]) {
        [self addObserver:self forKeyPath:@"waitAccept" options:NSKeyValueObservingOptionNew context:NULL];
        [self addObserver:self forKeyPath:@"waitPickup" options:NSKeyValueObservingOptionNew context:NULL];
    }
    return self;
}
//平均接单时间m 1 平均拣货完成时间n 2  物流时长 s
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"waitPickup"] ||[keyPath isEqualToString:@"waitAccept"] ) {
        self.arriveTime = ((self.waitAccept) * kAcceptTime + (self.waitAccept) * kWaitPickup) + (self.waitPickup) * kWaitPickup + kLogisticalTime + kAcceptTime + kWaitPickup;
    }
}

- (int)arriveTime{
    if (_arriveTime == 0) {
        _arriveTime = kAcceptTime + kWaitPickup + kLogisticalTime;
    }
    return _arriveTime;
}
@end
