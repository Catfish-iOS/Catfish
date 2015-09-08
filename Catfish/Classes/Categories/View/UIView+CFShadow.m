//
//  UIImage+CFColor.m
//  Catfish
//
//  Created by Jairo Junior on 12/12/13.
//  Copyright (c) 2013 Sook. All rights reserved.
//
//  Credits to: https://github.com/Seitk/UIView-Shadow-Maker
//

#import "UIView+CFShadow.h"

#define kShadowViewTag 2132

@implementation UIView (CFShadow)

- (void)makeInsetShadowTop
{
    CFShadowPositionFlag positionFlag = CFShadowPositionFlagTop;
    UIColor *color = [UIColor colorWithRed:(0.0) green:(0.0) blue:(0.0) alpha:0.5];
    
    UIView *shadowView = [self createShadowViewWithRadius:3 color:color positionFlag:positionFlag];
    shadowView.tag = kShadowViewTag;
    
    [self addSubview:shadowView];
}

- (void)makeInsetShadow
{
    CFShadowPositionFlag positionFlag = CFShadowPositionFlagLeft | CFShadowPositionFlagRight | CFShadowPositionFlagTop | CFShadowPositionFlagBottom;
    UIColor *color = [UIColor colorWithRed:(0.0) green:(0.0) blue:(0.0) alpha:0.5];
    
    UIView *shadowView = [self createShadowViewWithRadius:3 color:color positionFlag:positionFlag];
    shadowView.tag = kShadowViewTag;
    
    [self addSubview:shadowView];
}

- (void)makeInsetShadowWithRadius:(float)radius alpha:(float)alpha
{
    CFShadowPositionFlag positionFlag = CFShadowPositionFlagLeft | CFShadowPositionFlagRight | CFShadowPositionFlagTop | CFShadowPositionFlagBottom;
    UIColor *color = [UIColor colorWithRed:(0.0) green:(0.0) blue:(0.0) alpha:alpha];
    
    UIView *shadowView = [self createShadowViewWithRadius:radius color:color positionFlag:positionFlag];
    shadowView.tag = kShadowViewTag;
    
    [self addSubview:shadowView];
}

- (void)makeInsetShadowWithRadius:(float)radius color:(UIColor *)color positionFlag:(CFShadowPositionFlag)positionFlag
{
    UIView *shadowView = [self createShadowViewWithRadius:radius color:color positionFlag:positionFlag];
    shadowView.tag = kShadowViewTag;
    
    [self addSubview:shadowView];
}

- (UIView *)createShadowViewWithRadius:(float)radius color:(UIColor *)color positionFlag:(CFShadowPositionFlag)positionFlag
{
    UIView *shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    shadowView.backgroundColor = [UIColor clearColor];

    CAGradientLayer *shadow = [CAGradientLayer layer];
    if (positionFlag & CFShadowPositionFlagTop) {
        [shadow setStartPoint:CGPointMake(0.5, 0.0)];
        [shadow setEndPoint:CGPointMake(0.5, 1.0)];
        shadow.frame = CGRectMake(0, 0, self.bounds.size.width, radius);
    }
    if (positionFlag & CFShadowPositionFlagBottom) {
        [shadow setStartPoint:CGPointMake(0.5, 1.0)];
        [shadow setEndPoint:CGPointMake(0.5, 0.0)];
        shadow.frame = CGRectMake(0, self.bounds.size.height - radius, self.bounds.size.width, radius);
    }
    if (positionFlag & CFShadowPositionFlagLeft) {
        shadow.frame = CGRectMake(0, 0, radius, self.bounds.size.height);
        [shadow setStartPoint:CGPointMake(0.0, 0.5)];
        [shadow setEndPoint:CGPointMake(1.0, 0.5)];
    }
    if (positionFlag & CFShadowPositionFlagRight) {
        shadow.frame = CGRectMake(self.bounds.size.width - radius, 0, radius, self.bounds.size.height);
        [shadow setStartPoint:CGPointMake(1.0, 0.5)];
        [shadow setEndPoint:CGPointMake(0.0, 0.5)];
    }
    
    shadow.colors = [NSArray arrayWithObjects:(id)[color CGColor], (id)[[UIColor clearColor] CGColor], nil];
    [shadowView.layer insertSublayer:shadow atIndex:0];
    
    return shadowView;
}

@end
