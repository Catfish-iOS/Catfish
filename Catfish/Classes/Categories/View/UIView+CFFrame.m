//
//  UIImage+CFFrame.m
//  Catfish
//
//  Created by Jairo Junior on 12/12/13.
//  Copyright (c) 2013 Sook. All rights reserved.
//
//  Credits to: https://github.com/Seitk/UIView-Shadow-Maker
//

#import "UIView+CFFrame.h"

@implementation UIView (CFFrame)

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setOriginX:(CGFloat)originX
{
    CGRect frame = self.frame;
    frame.origin.x = originX;
    self.frame = frame;
}

- (void)setOriginY:(CGFloat)originY
{
    CGRect frame = self.frame;
    frame.origin.y = originY;
    self.frame = frame;
}

@end
