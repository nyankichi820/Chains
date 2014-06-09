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
