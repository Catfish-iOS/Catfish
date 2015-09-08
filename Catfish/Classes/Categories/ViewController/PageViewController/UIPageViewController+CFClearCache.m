//
//  UIPageViewController+ClearCache.m
//  sprinklebit
//
//  Created by Sambya Aryasa on 3/4/14.
//  Copyright (c) 2014 mjd. All rights reserved.
//

#import "UIPageViewController+CFClearCache.h"

@implementation UIPageViewController (CFClearCache)

- (void)setViewControllers:(NSArray *)viewControllers
                 direction:(UIPageViewControllerNavigationDirection)direction
                  animated:(BOOL)animated
                completion:(void (^)(BOOL))completion
           forceClearCache:(BOOL)forceClearCache
{
    if (forceClearCache) {
        __block UIPageViewController *weakSelf = self;
        [self setViewControllers:viewControllers
                       direction:direction
                        animated:animated
                      completion:^(BOOL finished) {
                          // Fix for page view controller not properly clearing cache
                          // ref: http://stackoverflow.com/a/17330606/3198047
                          if(finished) {
                              dispatch_async(dispatch_get_main_queue(), ^{
                                  [weakSelf setViewControllers:viewControllers
                                                     direction:direction
                                                      animated:NO
                                                    completion:completion];
                              });
                          } else {
                              if (completion) { completion(finished); }
                          }
                      }];
    } else {
        [self setViewControllers:viewControllers
                       direction:direction
                        animated:animated
                      completion:completion];
    }
}
@end
