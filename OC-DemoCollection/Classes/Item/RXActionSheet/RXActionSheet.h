//
//  RXActionSheet.h
//  RXActionSheet
//
//  Created by pingan on 2018/9/28.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, RXActionHeadImageType) {
    RXActionHeadImageTypeCamera,
    RXActionHeadImageTypeAlbum,
};
@protocol RXActionSheetDelegate <NSObject>

- (void)takePhoto;
- (void)serarchFromAlbum;

@end

@interface RXActionSheet : NSObject

@property(nonatomic, assign)id<RXActionSheetDelegate>delegate;

- (void)show;
@end

NS_ASSUME_NONNULL_END
