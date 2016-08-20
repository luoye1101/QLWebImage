//
//  DownloadOperation.m
//  QLWebImage
//
//  Created by 黄跃奇 on 16/8/20.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "DownloadOperation.h"


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


@end
