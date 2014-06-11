//
//  CANAnimation.h
//  Chains
//
//  Created by masafumi yoshida on 2014/06/06.
//  Copyright (c) 2014年 masafumi yoshida. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CANChain.h"



@interface CANAnimation : CANChain

@property (nonatomic) NSTimeInterval duration;
@property (nonatomic) NSTimeInterval delay;


@end

@interface CANGestureAnimation : CANAnimation

@end

@interface CANPinchScale : CANGestureAnimation

@end

@interface CANPanMove : CANGestureAnimation

@end


@interface CANScaleTo : CANAnimation
@property (nonatomic) float scale;

@end

@interface CANScaleBy : CANAnimation
@property (nonatomic) float scale;

@end

@interface CANRotateTo : CANAnimation
@property (nonatomic) float angle;

@end

@interface CANRotateBy : CANAnimation
@property (nonatomic) float angle;

@end

@interface CANMoveBy : CANAnimation
@property (nonatomic) CGPoint position;
@end

@interface CANMoveTo : CANAnimation
@property (nonatomic) CGPoint position;
@end

@interface CANFadeBy : CANAnimation
@property (nonatomic) float alpha;
@end

@interface CANFadeTo : CANAnimation
@property (nonatomic) float alpha;
@end

@interface CANBounceLeft : CANAnimation
@end



@interface CANBounceRight : CANAnimation
@end


@interface CANBounceDown : CANAnimation
@end


@interface CANBounceUp : CANAnimation
@end

@interface CANSlideLeft : CANAnimation
@end

@interface CANSlideRight : CANAnimation
@end



@interface CANSlideDown : CANAnimation
@end


@interface CANSlideUp : CANAnimation
@end

@interface CANFadeIn : CANAnimation
@end


@interface CANFadeOut : CANAnimation
@end


@interface CANFadeInLeft : CANAnimation
@end


@interface CANFadeInRight : CANAnimation
@end


@interface CANFadeInDown : CANAnimation
@end


@interface CANFadeInUp : CANAnimation
@end

@interface CANPop : CANAnimation
@end


@interface CANMorph : CANAnimation
@end


@interface CANFlash : CANAnimation
@end


@interface CANShake : CANAnimation
@end


@interface CANZoomIn : CANAnimation
@end


@interface CANZoomOut : CANAnimation
@end

