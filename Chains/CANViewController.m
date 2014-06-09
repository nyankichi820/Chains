//
//  CANViewController.m
//  Chains
//
//  Created by masafumi yoshida on 2014/06/06.
//  Copyright (c) 2014年 masafumi yoshida. All rights reserved.
//

#import "CANViewController.h"

@interface CANViewController ()

@end

@implementation CANViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)endAnimation{
    [[[UIAlertView alloc] initWithTitle:@"hoge" message:@"hoge" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil] show];
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
