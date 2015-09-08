//
//  UIImage+CFColor.h
//  Catfish
//
//  Created by Jairo Junior on 12/12/13.
//  Copyright (c) 2013 Sook. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

typedef NS_ENUM(NSUInteger, CFShadowPositionFlag) {
    CFShadowPositionFlagLeft = 1 <<  0,
    CFShadowPositionFlagRight = 1 <<  1,
    CFShadowPositionFlagTop = 1 <<  2,
    CFShadowPositionFlagBottom = 1 <<  3
};

@interface UIView (CFShadow)

- (void)makeInsetShadow;
- (void)makeInsetShadowTop;
- (void)makeInsetShadowWithRadius:(float)radius alpha:(float)alpha;
- (void)makeInsetShadowWithRadius:(float)radius color:(UIColor *)color positionFlag:(CFShadowPositionFlag)positionFlag;

@end