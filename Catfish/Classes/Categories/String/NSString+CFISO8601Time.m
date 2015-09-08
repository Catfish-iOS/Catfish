//
//  NSString+ACISO8601Time.m
//  AppChannel
//
//  Created by Jairo Junior on 8/7/14.
//  Copyright (c) 2014 Sook Apps. All rights reserved.
//

#import "NSString+CFISO8601Time.h"

@implementation NSString (CFISO8601Time)

- (NSString*)ISO8601Time
{
    NSString *duration = self;
    
    NSInteger hours = 0;
    NSInteger minutes = 0;
    NSInteger seconds = 0;
    
    //Get Time part from ISO 8601 formatted duration http://en.wikipedia.org/wiki/ISO_8601#Durations
    duration = [duration substringFromIndex:[duration rangeOfString:@"T"].location];
    
    while ([duration length] > 1) { //only one letter remains after parsing
        duration = [duration substringFromIndex:1];
        
        NSScanner *scanner = [[NSScanner alloc] initWithString:duration];
        
        NSString *durationPart = [[NSString alloc] init];
        [scanner scanCharactersFromSet:[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] intoString:&durationPart];
        
        NSRange rangeOfDurationPart = [duration rangeOfString:durationPart];
        
        duration = [duration substringFromIndex:rangeOfDurationPart.location + rangeOfDurationPart.length];
        
        if ([[duration substringToIndex:1] isEqualToString:@"H"]) {
            hours = [durationPart intValue];
        }
        if ([[duration substringToIndex:1] isEqualToString:@"M"]) {
            minutes = [durationPart intValue];
        }
        if ([[duration substringToIndex:1] isEqualToString:@"S"]) {
            seconds = [durationPart intValue];
        }
    }
    
    if (hours == 0) {
        return [NSString stringWithFormat:@"%2d:%02d", (int)minutes, (int)seconds];
    }
    
    return [NSString stringWithFormat:@"%2d:%02d:%02d", (int)hours, (int)minutes, (int)seconds];
}

@end
