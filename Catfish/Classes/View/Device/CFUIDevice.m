//
//  CFUIDevice.m
//  Catfish
//
//  Created by Jairo Junior on 2/16/15.
//  Copyright (c) 2015 Sook. All rights reserved.
//

#import "CFUIDevice.h"
#import <objc/message.h>

@implementation CFUIDevice

+ (void)setInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    void (*action)(id, SEL, NSInteger) = (void (*)(id, SEL, NSInteger)) objc_msgSend;
    action([UIDevice currentDevice], @selector(setOrientation:), orientation);
}

@end
