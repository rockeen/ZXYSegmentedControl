//
//  ZXYSegmentedControl.h
//  时光电影
//
//  Created by Rockeen on 15/11/28.
//  Copyright (c) 2015年 Rockeen https://github.com/rockeen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PageNum)(NSInteger num);


@interface ZXYSegmentedControl : UIView

/**
 *选中图片
 */
@property (nonatomic, strong) UIImage *selectImage;


/*
 如果要改变默认btn的值要先在创建方法里调用returnPageNum方法接收block回调的值
   在改变 默认btn
 */

/**
 * 默认选中的btn
 */
@property (nonatomic, assign) NSInteger firstIndix;


@property (nonatomic, strong) NSArray *titles;



//自定义初始化方法
- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;

- (void)returnPageNum:(PageNum)block;

@end
