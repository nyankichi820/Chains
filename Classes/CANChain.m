//
//  CANChain.m
//  Chains
//
//  Created by masafumi yoshida on 2014/06/09.
//  Copyright (c) 2014年 masafumi yoshida. All rights reserved.
//

#import "CANChain.h"

@implementation CANChain

-(void)layoutSubviews{
    [super layoutSubviews];
    [self startChain];
    
}

-(void)awakeFromNib{
    self.backgroundColor = [UIColor clearColor];
}

-(IBAction)startChain:(id)sender{
    NSLog(@"start  %@",NSStringFromClass(self.class));
    [self startChain];
    
    
}

-(void)chain{
    NSLog(@"chain  %@",NSStringFromClass(self.class));
    for (CANChain *chain  in self.subviews ) {
        [chain startChain];
    }
    
}

-(void)next{
    self.status = CANChainStatusRunning;
    if(self.subviews.count == 0){
        [self completeChain];
    }
    else{
        [self chain];
    }
    
    
}

-(void)completeChain{
    NSLog(@"end  %@",NSStringFromClass(self.class));
    
    for (CANChain *chain  in self.subviews ) {
        if(chain.status == CANChainStatusRunning){
            return;
        }
    }
    
    if(self.delegate && self.completion && [self.delegate respondsToSelector:NSSelectorFromString(self.completion)]){
        NSLog(@"completion  %@",NSStringFromClass(self.class));
        dispatch_async(dispatch_get_main_queue(),^{
            [self.delegate performSelector:NSSelectorFromString(self.completion)];
        });
    }
    
    if(self.superview && [self.superview isKindOfClass:self.class]){
        CANChain *chain =  (CANChain*)self.superview;
        [chain completeChain];
    }
    
    
}

-(void) performAction{
    
    
}

-(void)startChain{
    dispatch_async(dispatch_get_main_queue(),^{
        self.status = CANChainStatusRunning;
        [self performAction];
    });
}

@end
