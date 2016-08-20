//
//  DownloadOperation.m
//  QLWebImage
//
//  Created by 黄跃奇 on 16/8/20.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "DownloadOperation.h"

@interface DownloadOperation ()

/**
 *  接收控制器传入的图片的地址
 */
@property(copy, nonatomic) NSString *URLString;


@property(copy, nonatomic) void(^finishBlock)(UIImage *image);

@end


@implementation DownloadOperation

- (void)main {
    
//    NSLog(@"%@", self.URLString);
    
    //下载图片
    NSURL *url = [NSURL URLWithString:self.URLString];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    UIImage *image = [UIImage imageWithData:data];
    
    //图片下载完后传递到vc
    if (self.finishBlock != nil) {
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            self.finishBlock(image);
            
        }];
        
    }
    
    
}

+ (instancetype)downloadWithURLString:(NSString *)URLString finishBlock:(void (^)(UIImage *))finishBlock {
    
    DownloadOperation *op = [[DownloadOperation alloc] init];
    
    op.URLString = URLString;
    
    op.finishBlock = finishBlock;
    
    return op;
}


@end
