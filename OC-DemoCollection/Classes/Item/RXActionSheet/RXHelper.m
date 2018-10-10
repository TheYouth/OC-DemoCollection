//
//  RXHelper.m
//  RXActionSheet
//
//  Created by pingan on 2018/9/28.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import "RXHelper.h"

@implementation RXHelper
UIColor * UIColorFromHexARGB(CGFloat alpha, NSInteger hexRGB)
{
    return [UIColor colorWithRed:((float)((hexRGB & 0xFF0000) >> 16))/255.0
                           green:((float)((hexRGB & 0xFF00) >> 8))/255.0
                            blue:((float)(hexRGB & 0xFF))/255.0
                           alpha:alpha];
}

UIColor * UIColorFromHexRGB(NSInteger hexRGB)
{
    return UIColorFromHexARGB(1, hexRGB);
}

@end
