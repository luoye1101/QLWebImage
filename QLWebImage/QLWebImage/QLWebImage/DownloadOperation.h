//
//  DownloadOperation.h
//  QLWebImage
//
//  Created by 黄跃奇 on 16/8/20.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DownloadOperation : NSOperation

/**
 *  接收控制器传入的图片的地址
 */
@property(copy, nonatomic) NSString *URLString;


@property(copy, nonatomic) void(^finishBlock)(UIImage *image);

@end
