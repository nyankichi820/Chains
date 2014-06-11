//
//  CANAnimation.m
//  Chains
//
//  Created by masafumi yoshida on 2014/06/06.
//  Copyright (c) 2014年 masafumi yoshida. All rights reserved.
//

#import "CANAnimation.h"

@implementation CANAnimation


-(void) performAction{
    [self next];
}


@end



@implementation CANGestureAnimation

-(IBAction)startChain:(UIGestureRecognizer*)sender{
    self.sender = sender;
    if(!self.target){
        self.target = sender.view;
    }
    NSLog(@"start  %@",NSStringFromClass(self.class));
    [self startChain];
    
    
}

@end

@implementation CANScaleTo
-(void)performAction{
    // Start
    [UIView animateKeyframesWithDuration:self.duration delay:self.delay options:0 animations:^{
        // End
        self.target.transform = CGAffineTransformMakeScale(self.scale, self.scale);
    } completion:^(BOOL finished) {
        [self next];
    }];
}
@end


@implementation CANScaleBy
-(void)performAction{
    // Start
    CGAffineTransform transform = self.target.transform;
    self.target.transform =  CGAffineTransformMakeScale(self.scale, self.scale);
    [UIView animateKeyframesWithDuration:self.duration delay:self.delay options:0 animations:^{
        // End
        self.target.transform = transform;
    } completion:^(BOOL finished) {
        [self next];
    }];
}
@end

@implementation CANRotateTo
-(void)performAction{
    // Start
    [UIView animateKeyframesWithDuration:self.duration delay:self.delay options:0 animations:^{
        // End
        self.target.transform = CGAffineTransformMakeRotation(self.angle);
    } completion:^(BOOL finished) {
        [self next];
    }];
}
@end


@implementation CANRotateBy
-(void)performAction{
    // Start
    CGAffineTransform transform = self.target.transform;
    self.target.transform = CGAffineTransformMakeRotation(self.angle);
    [UIView animateKeyframesWithDuration:self.duration delay:self.delay options:0 animations:^{
        // End
        self.target.transform = transform;
    } completion:^(BOOL finished) {
        [self next];
    }];
}
@end

@interface CANPinchScale ()
@property(nonatomic) CGAffineTransform startTransform;
@property(nonatomic,strong) NSNumber *minScale;
@property(nonatomic,strong) NSNumber *maxScale;
@end

@implementation CANPinchScale

-(void)performAction{
    UIPinchGestureRecognizer *gesture = (UIPinchGestureRecognizer*)self.sender;
    if(gesture.state == UIGestureRecognizerStateBegan){
        self.startTransform = self.target.transform;
    }
    else if(gesture.state == UIGestureRecognizerStateChanged){
        CGFloat scale = [gesture scale];
        NSLog(@"%f",scale);
        if(self.minScale && self.minScale.floatValue > scale){
            return;
        }
        if(self.maxScale && self.maxScale.floatValue < scale){
            return;
        }
        self.target.transform = CGAffineTransformConcat(self.startTransform, CGAffineTransformMakeScale(gesture.scale, gesture.scale));
    }
    else if(gesture.state == UIGestureRecognizerStatePossible){
        [self next];
    }
}

@end

@interface CANPanMove ()
@property(nonatomic) CGPoint startPoint;

@end

@implementation CANPanMove

-(void)performAction{
    UIPanGestureRecognizer *gesture = (UIPanGestureRecognizer*)self.sender;
    CGPoint p = [gesture translationInView:self.target.superview];
    if(gesture.state == UIGestureRecognizerStateBegan){
        self.startPoint = self.target.center;
    }
    else if(gesture.state == UIGestureRecognizerStateChanged){
        self.target.center = CGPointMake(self.startPoint.x + p.x, self.startPoint.y + p.y);
    }
    else if(gesture.state == UIGestureRecognizerStatePossible){
        [self next];
    }
}

@end

@implementation CANMoveBy

-(void)performAction{
    CGPoint center = self.target.center;
    self.target.center = self.position;
    [UIView animateKeyframesWithDuration:self.duration delay:self.delay options:0 animations:^{
        // End
        self.target.center = center;
    } completion:^(BOOL finished) {
        [self next];
    }];
}

@end

@implementation CANMoveTo

-(void)performAction{
    [UIView animateKeyframesWithDuration:self.duration delay:self.delay options:0 animations:^{
        // End
        self.target.center = self.position;
    } completion:^(BOOL finished) {
        [self next];
    }];
}

@end

@implementation CANFadeBy

-(void)performAction{
    float alpha = self.target.alpha;
    self.target.alpha = self.alpha;
    [UIView animateKeyframesWithDuration:self.duration delay:self.delay options:0 animations:^{
        // End
        self.target.alpha = alpha;
    } completion:^(BOOL finished) {
        [self next];
    }];
}

@end

@implementation CANFadeTo

-(void)performAction{
    [UIView animateKeyframesWithDuration:self.duration delay:self.delay options:0 animations:^{
        // End
        self.target.alpha = self.alpha;
    } completion:^(BOOL finished) {
        [self next];
    }];
}

@end




@implementation CANFadeIn
-(void)performAction{
    // Start
    self.target.alpha = 0;
    [UIView animateKeyframesWithDuration:self.duration delay:self.delay options:0 animations:^{
        // End
        self.target.alpha = 1;
    } completion:^(BOOL finished) {
        [self next];
    }];
}
@end

@implementation CANFadeOut
-(void)performAction{
    // Start
    self.target.alpha = 1;
    [UIView animateKeyframesWithDuration:self.duration delay:self.delay options:0 animations:^{
        // End
        self.target.alpha = 0;
    } completion:^(BOOL finished) {
        [self next];
    }];
}
@end

@implementation CANFadeInDown
-(void)performAction{
    // Start
    self.target.alpha = 0;
    self.target.transform = CGAffineTransformMakeTranslation(0, -300);
    [UIView animateKeyframesWithDuration:self.duration delay:self.delay options:0 animations:^{
        // End
        self.target.alpha = 1;
        self.target.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) {
        [self next];
    }];
}
@end

@implementation CANFadeInUp
-(void)performAction{
    // Start
    self.target.alpha = 0;
    self.target.transform = CGAffineTransformMakeTranslation(0, 300);
    [UIView animateKeyframesWithDuration:self.duration delay:self.delay options:0 animations:^{
        // End
        self.target.alpha = 1;
        self.target.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) {
        [self next];
    }];
}
@end

@implementation CANBounceLeft

-(void)performAction{
    // Start
    self.target.transform = CGAffineTransformMakeTranslation(300, 0);
    [UIView animateKeyframesWithDuration:self.duration/4 delay:self.delay options:0 animations:^{
        // End
        self.target.transform = CGAffineTransformMakeTranslation(-10, 0);
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:self.duration/4 delay:0 options:0 animations:^{
            // End
            self.target.transform = CGAffineTransformMakeTranslation(5, 0);
        } completion:^(BOOL finished) {
            [UIView animateKeyframesWithDuration:self.duration/4 delay:0 options:0 animations:^{
                // End
                self.target.transform = CGAffineTransformMakeTranslation(-2, 0);
            } completion:^(BOOL finished) {
                [UIView animateKeyframesWithDuration:self.duration/4 delay:0 options:0 animations:^{
                    // End
                    self.target.transform = CGAffineTransformMakeTranslation(0, 0);
                } completion:^(BOOL finished) {
                    [self next];
                }];
            }];
        }];
    }];
}
@end

@implementation CANBounceRight
-(void)performAction{
    // Start
    self.target.transform = CGAffineTransformMakeTranslation(-300, 0);
    [UIView animateKeyframesWithDuration:self.duration/4 delay:self.delay options:0 animations:^{
        // End
        self.target.transform = CGAffineTransformMakeTranslation(10, 0);
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:self.duration/4 delay:0 options:0 animations:^{
            // End
            self.target.transform = CGAffineTransformMakeTranslation(-5, 0);
        } completion:^(BOOL finished) {
            [UIView animateKeyframesWithDuration:self.duration/4 delay:0 options:0 animations:^{
                // End
                self.target.transform = CGAffineTransformMakeTranslation(2, 0);
            } completion:^(BOOL finished) {
                [UIView animateKeyframesWithDuration:self.duration/4 delay:0 options:0 animations:^{
                    // End
                    self.target.transform = CGAffineTransformMakeTranslation(0, 0);
                } completion:^(BOOL finished) {
                     [self next];
                }];
            }];
        }];
    }];
}
@end

@implementation CANBounceDown

-(void)performAction{
    // Start
    self.target.transform = CGAffineTransformMakeTranslation(0, -300);
    [UIView animateKeyframesWithDuration:self.duration/4 delay:self.delay options:0 animations:^{
        // End
        self.target.transform = CGAffineTransformMakeTranslation(0, -10);
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:self.duration/4 delay:0 options:0 animations:^{
            // End
            self.target.transform = CGAffineTransformMakeTranslation(0, 5);
        } completion:^(BOOL finished) {
            [UIView animateKeyframesWithDuration:self.duration/4 delay:0 options:0 animations:^{
                // End
                self.target.transform = CGAffineTransformMakeTranslation(0, -2);
            } completion:^(BOOL finished) {
                [UIView animateKeyframesWithDuration:self.duration/4 delay:0 options:0 animations:^{
                    // End
                    self.target.transform = CGAffineTransformMakeTranslation(0, 0);
                } completion:^(BOOL finished) {
                     [self next];
                }];
            }];
        }];
    }];
}
@end

@implementation CANBounceUp

-(void)performAction{
    // Start
    self.target.transform = CGAffineTransformMakeTranslation(0, 300);
    [UIView animateKeyframesWithDuration:self.duration/4 delay:self.delay options:0 animations:^{
        // End
        self.target.transform = CGAffineTransformMakeTranslation(0, 10);
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:self.duration/4 delay:0 options:0 animations:^{
            // End
            self.target.transform = CGAffineTransformMakeTranslation(0, -5);
        } completion:^(BOOL finished) {
            [UIView animateKeyframesWithDuration:self.duration/4 delay:0 options:0 animations:^{
                // End
                self.target.transform = CGAffineTransformMakeTranslation(0, 2);
            } completion:^(BOOL finished) {
                [UIView animateKeyframesWithDuration:self.duration/4 delay:0 options:0 animations:^{
                    // End
                    self.target.transform = CGAffineTransformMakeTranslation(0, 0);
                } completion:^(BOOL finished) {
                     [self next];
                }];
            }];
        }];
    }];
}
@end


@implementation CANSlideLeft

-(void)performAction{
    // Start
    self.target.transform = CGAffineTransformMakeTranslation(300, 0);
    [UIView animateKeyframesWithDuration:self.duration delay:self.delay options:0 animations:^{
        // End
        self.target.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) {
    
     [self next];
    }];
}
@end


@implementation CANSlideRight
-(void)performAction{
    // Start
    self.target.transform = CGAffineTransformMakeTranslation(-300, 0);
    [UIView animateKeyframesWithDuration:self.duration delay:self.delay options:0 animations:^{
        // End
        self.target.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) {
     [self next];
    }];
}
@end

@implementation CANSlideDown
-(void)performAction{
    // Start
    self.target.transform = CGAffineTransformMakeTranslation(0, -300);
    [UIView animateKeyframesWithDuration:self.duration delay:self.delay options:0 animations:^{
        // End
        self.target.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) {
     [self next];
    }];
}
@end

@implementation CANSlideUp
-(void)performAction{
    // Start
    self.target.transform = CGAffineTransformMakeTranslation(0, 300);
    [UIView animateKeyframesWithDuration:self.duration delay:self.delay options:0 animations:^{
        // End
        self.target.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) {
     [self next];
    }];
}
@end


@implementation CANFadeInLeft
-(void)performAction{
    // Start
    self.target.alpha = 0;
    self.target.transform = CGAffineTransformMakeTranslation(300, 0);
    [UIView animateKeyframesWithDuration:self.duration delay:self.delay options:0 animations:^{
        // End
        self.target.alpha = 1;
        self.target.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) {
     [self next];
    }];
}
@end

@implementation CANFadeInRight
-(void)performAction{
    // Start
    self.target.alpha = 0;
    self.target.transform = CGAffineTransformMakeTranslation(-300, 0);
    [UIView animateKeyframesWithDuration:self.duration delay:self.delay options:0 animations:^{
        // End
        self.target.alpha = 1;
        self.target.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) {
     [self next];
    }];
}
@end



@implementation CANPop
-(void)performAction{
    // Start
    self.target.transform = CGAffineTransformMakeScale(1, 1);
    [UIView animateKeyframesWithDuration:self.duration/3 delay:self.delay options:0 animations:^{
        // End
        self.target.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:self.duration/3 delay:0 options:0 animations:^{
            // End
            self.target.transform = CGAffineTransformMakeScale(0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateKeyframesWithDuration:self.duration/3 delay:0 options:0 animations:^{
                // End
                self.target.transform = CGAffineTransformMakeScale(1, 1);
            } completion:^(BOOL finished) {
                 [self next];
            }];
        }];
    }];
}
@end

@implementation CANMorph
-(void)performAction{
    // Start
    self.target.transform = CGAffineTransformMakeScale(1, 1);
    [UIView animateKeyframesWithDuration:self.duration/4 delay:self.delay options:0 animations:^{
        // End
        self.target.transform = CGAffineTransformMakeScale(1, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:self.duration/4 delay:0 options:0 animations:^{
            // End
            self.target.transform = CGAffineTransformMakeScale(1.2, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateKeyframesWithDuration:self.duration/4 delay:0 options:0 animations:^{
                // End
                self.target.transform = CGAffineTransformMakeScale(0.9, 0.9);
            } completion:^(BOOL finished) {
                [UIView animateKeyframesWithDuration:self.duration/4 delay:0 options:0 animations:^{
                    // End
                    self.target.transform = CGAffineTransformMakeScale(1, 1);
                } completion:^(BOOL finished) {
                     [self next];
                }];
            }];
        }];
    }];
}
@end

@implementation CANFlash
-(void)performAction{
    // Start
    self.target.alpha = 0;
    [UIView animateKeyframesWithDuration:self.duration/3 delay:self.delay options:0 animations:^{
        // End
        self.target.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:self.duration/3 delay:0 options:0 animations:^{
            // End
            self.target.alpha = 0;
        } completion:^(BOOL finished) {
            [UIView animateKeyframesWithDuration:self.duration/3 delay:0 options:0 animations:^{
                // End
                self.target.alpha = 1;
            } completion:^(BOOL finished) {
                 [self next];
            }];
        }];
    }];
}
@end

@implementation CANShake
-(void)performAction{
    // Start
    self.target.transform = CGAffineTransformMakeTranslation(0, 0);
    [UIView animateKeyframesWithDuration:self.duration/5 delay:self.delay options:0 animations:^{
        // End
        self.target.transform = CGAffineTransformMakeTranslation(30, 0);
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:self.duration/5 delay:0 options:0 animations:^{
            // End
            self.target.transform = CGAffineTransformMakeTranslation(-30, 0);
        } completion:^(BOOL finished) {
            [UIView animateKeyframesWithDuration:self.duration/5 delay:0 options:0 animations:^{
                // End
                self.target.transform = CGAffineTransformMakeTranslation(15, 0);
            } completion:^(BOOL finished) {
                [UIView animateKeyframesWithDuration:self.duration/5 delay:0 options:0 animations:^{
                    // End
                    self.target.transform = CGAffineTransformMakeTranslation(-15, 0);
                } completion:^(BOOL finished) {
                    [UIView animateKeyframesWithDuration:self.duration/5 delay:0 options:0 animations:^{
                        // End
                        self.target.transform = CGAffineTransformMakeTranslation(0, 0);
                    } completion:^(BOOL finished) {
                        // End
                         [self next];
                    }];
                }];
            }];
        }];
    }];
}
@end

@implementation CANZoomIn
-(void)performAction{
    // Start
    self.target.transform = CGAffineTransformMakeScale(1, 1);
    self.target.alpha = 1;
    [UIView animateKeyframesWithDuration:self.duration delay:self.delay options:0 animations:^{
        // End
        self.target.transform = CGAffineTransformMakeScale(2, 2);
        self.target.alpha = 0;
    } completion:^(BOOL finished) {
        //        self.target.transform = CGAffineTransformMakeScale(1, 1);
        //        self.target.alpha = 1;
         [self next];
    }];
}
@end

@implementation CANZoomOut
-(void)performAction{
    // Start
    self.target.transform = CGAffineTransformMakeScale(2, 2);
    self.target.alpha = 0;
    [UIView animateKeyframesWithDuration:self.duration delay:self.delay options:0 animations:^{
        // End
        self.target.transform = CGAffineTransformMakeScale(1, 1);
        self.target.alpha = 1;
    } completion:^(BOOL finished) {
         [self next];
    }];
}

@end
