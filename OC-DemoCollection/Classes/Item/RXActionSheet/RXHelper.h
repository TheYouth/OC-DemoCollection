//
//  RXHelper.h
//  RXActionSheet
//
//  Created by pingan on 2018/9/28.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface RXHelper : NSObject

UIColor * UIColorFromHexARGB(CGFloat alpha, NSInteger hexRGB);
UIColor * UIColorFromHexRGB(NSInteger hexColor);

@end

NS_ASSUME_NONNULL_END
