//
//  CFViewFrame.m
//  Catfish
//
//  Created by Jairo Junior on 2/26/15.
//  Copyright (c) 2015 Sook. All rights reserved.
//

#import "CFUIViewFrame.h"

@implementation CFUIViewFrame

#pragma mark - Compute the new size of frame relative to width(window)

+ (CGRect)centerFrameForView:(UIView*)view fromSize:(CGSize)size
{
    CGRect windowBounds = view.bounds;
    CGSize newImageSize = [self resizeFrameBaseOnWidth:windowBounds.size.width
                                              oldWidth:size.width
                                             oldHeight:size.height];
    // Just fit it on the size of the screen
    newImageSize.height = MIN(windowBounds.size.height,newImageSize.height);
    return CGRectMake(0.0f, windowBounds.size.height/2 - newImageSize.height/2, newImageSize.width, newImageSize.height);
}

+ (CGSize)resizeFrameBaseOnWidth:(CGFloat)newWidth oldWidth:(CGFloat) oldWidth oldHeight:(CGFloat)oldHeight
{
    CGFloat scaleFactor = newWidth / oldWidth;
    CGFloat newHeight = oldHeight * scaleFactor;
    return CGSizeMake(newWidth, newHeight);
}

@end
