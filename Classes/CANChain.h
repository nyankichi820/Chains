//
//  CANChain.h
//  Chains
//
//  Created by masafumi yoshida on 2014/06/09.
//  Copyright (c) 2014年 masafumi yoshida. All rights reserved.
//

#import <Foundation/Foundation.h>



typedef enum CANChainStatus : int {
    CANChainStatusNotRunning,
    CANChainStatusRunning,
    CANChainStatusComplete,
} CANChainStatus;

@interface CANChain : UIView
@property (weak, nonatomic) IBOutlet UIView *target;
@property (nonatomic) CANChainStatus status;
@property (weak, nonatomic) IBOutlet NSObject *delegate;
@property (strong, nonatomic) NSString *completion;

-(IBAction)startChain:(id)sender;
-(void)next;
-(void)startChain;

@end
