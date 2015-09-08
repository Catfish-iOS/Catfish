//
//  UIPageViewController+ClearCache.h
//  sprinklebit
//
//  Created by Sambya Aryasa on 3/4/14.
//  Copyright (c) 2014 mjd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIPageViewController (CFClearCache)

- (void)setViewControllers:(NSArray *)viewControllers
                 direction:(UIPageViewControllerNavigationDirection)direction
                  animated:(BOOL)animated
                completion:(void (^)(BOOL))completion
           forceClearCache:(BOOL)clearCache;

@end
