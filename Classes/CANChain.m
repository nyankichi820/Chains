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
    if(self.superview && ![self.superview isKindOfClass:NSClassFromString(@"CANChain")]){
        [self startChain];
    }
    
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
    for (UIView *view  in self.subviews ) {
        if([view isKindOfClass:NSClassFromString(@"CANChain")]){
            CANChain *chain = (CANChain*)view;
            [chain startChain];
        }
    }
    
}

-(void)next{
    self.status = CANChainStatusComplete;
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
   
    if(self.status != CANChainStatusComplete ){
        return;
    }
    
    self.status = CANChainStatusNotRunning;
    
    if(self.delegate ){
        if(self.completion && [self.delegate respondsToSelector:NSSelectorFromString(self.completion)]){
            NSLog(@"completion  %@",NSStringFromClass(self.class));
            dispatch_async(dispatch_get_main_queue(),^{
                [self.delegate performSelector:NSSelectorFromString(self.completion)];
            });
        }
        else if([self.delegate isKindOfClass:NSClassFromString(@"CANChain")]){
            CANChain *chain = (CANChain*)self.delegate;
            dispatch_async(dispatch_get_main_queue(),^{
                [chain startChain];
            });
        }
    }
    
    
    if(self.superview && [self.superview isKindOfClass:NSClassFromString(@"CANChain")]){
        CANChain *chain =  (CANChain*)self.superview;
        [chain completeChain];
    }
    
    
}

-(void) performAction{
    
    
}

-(void)startChain{
    if(!self.target){
        self.target = self;
    }
    dispatch_async(dispatch_get_main_queue(),^{
        self.status = CANChainStatusRunning;
        [self performAction];
    });
}

@end
