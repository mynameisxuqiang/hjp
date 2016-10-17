//
//  VendorViewController.m
//  StoreAnalyze
//
//  Created by xuqiang on 16/10/17.
//  Copyright © 2016年 xuqiang. All rights reserved.
//

#import "VendorViewController.h"
#import "TimeCaculator.h"
@interface VendorViewController ()
@property (nonatomic,assign) int numberWaitAccept;
@property (nonatomic,assign) int numberWaitPickup;
@property (nonatomic,assign) int numberWaitCarray;

@property (weak, nonatomic) IBOutlet UILabel *labelNumWaitOrder;
@property (weak, nonatomic) IBOutlet UILabel *labelWaitPickOrder;
@property (weak, nonatomic) IBOutlet UILabel *labelWaitCarryOrder;
@property (weak, nonatomic) IBOutlet UILabel *labelTip;

@end

@implementation VendorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.labelTip.text = [NSString stringWithFormat:@"当前有%d单待接单，%d单待拣货。预计最新用户等待时间%d分钟",self.numberWaitAccept,self.numberWaitPickup,[TimeCaculator shareInstance].arriveTime];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createOrder:(id)sender {
    self.numberWaitAccept++;
    [self refreshNumbers];
}
- (IBAction)acceptOrder:(id)sender {
    if (self.numberWaitAccept > 0) {
        self.numberWaitAccept--;
        self.numberWaitPickup++;
    }
    [self refreshNumbers];
}
- (IBAction)pickupFinish:(id)sender {
    if (self.numberWaitPickup > 0) {
        self.numberWaitPickup--;
        self.numberWaitCarray++;
    }
    [self refreshNumbers];
}
- (void)refreshNumbers{
    [TimeCaculator shareInstance].waitAccept = self.numberWaitAccept;
    [TimeCaculator shareInstance].waitPickup = self.numberWaitPickup;

    self.labelNumWaitOrder.text =[NSString stringWithFormat:@"%d",self.numberWaitAccept];
    self.labelWaitPickOrder.text =[NSString stringWithFormat:@"%d",self.numberWaitPickup];
    self.labelWaitCarryOrder.text =[NSString stringWithFormat:@"%d",self.numberWaitCarray];
    self.labelTip.text = [NSString stringWithFormat:@"当前有%d单待接单，%d单待拣货。预计最新用户等待时间%d分钟",self.numberWaitAccept,self.numberWaitPickup,[TimeCaculator shareInstance].arriveTime];
}

@end
