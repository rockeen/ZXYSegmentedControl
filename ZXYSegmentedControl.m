 //
//  ZXYSegmentedControl.m
//
//  Created by Rockeen on 15/11/28.
//  Copyright (c) 2015年 Rockeen https://github.com/rockeen. All rights reserved.
//

#import "ZXYSegmentedControl.h"




@implementation ZXYSegmentedControl{

    UIButton *_lastBtn;//上一个btn

    CGFloat with;//btn宽度
    
    UIImageView *_selectImageV;//选中图片的imagev
    
    PageNum blockTwo;//负责接收值的block

    
    //正常状态下
    UIColor *normalColor;
    
    CGFloat normalTitleSize;
    
    
    //选中状态下
    UIColor *selectColor;
    
    CGFloat selectTitleSize;
    

    
    
}

//初始化方法
- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles{

    if (self=[super initWithFrame:frame]) {
        
        self.titles=titles;
        
        with=self.frame.size.width/titles.count;
        
        
        [self variable];
        
        [self creatImageV];

        [self creatSegmentControl:titles];

        
    }


    return self;

}

//初始化变量
- (void)variable{

//正常状态下
    normalColor=[UIColor whiteColor];
    
    normalTitleSize=20;
    
    
    
//选中状态下
    selectColor=[UIColor orangeColor];
    
    selectTitleSize=25;
    


}




//创建SegmentControl给view上加上button
- (void)creatSegmentControl:(NSArray *)title{

    

    for (int i=0; i<title.count; i++) {
        
        CGFloat x=i*with;
        CGFloat y=0;
        CGFloat width=with;
        CGFloat height=self.frame.size.height;
        
        
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(x, y, width, height)];
        
        [btn setTitle:title[i] forState:UIControlStateNormal];

        
        [btn setTitleColor:normalColor forState:UIControlStateNormal];
        [btn setTitleColor:selectColor forState:UIControlStateSelected];
        
        btn.titleLabel.font=[UIFont systemFontOfSize:normalTitleSize];
        
        
        [btn addTarget:self action:@selector(btnAct:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.tag=100+i;
        
        [self addSubview:btn];
        
        if (i==0) {
            
            btn.selected=YES;
            btn.titleLabel.font=[UIFont systemFontOfSize:selectTitleSize];
            
            _lastBtn=btn;
            
            //选中图片的位置
             _selectImageV.frame=CGRectMake(btn.bounds.origin.x, self.frame.size.height-3, with, 3);
            
        }
        
        
    }



}


//创建imageV
- (void)creatImageV{


    _selectImageV=[[UIImageView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-3, with, 3)];

    [self addSubview:_selectImageV];

}


//btn点击事件
- (void)btnAct:(UIButton *)sender{

    
    if (_lastBtn!=sender) {
        
        _lastBtn.selected=NO;
        
        _lastBtn.titleLabel.font=[UIFont systemFontOfSize:normalTitleSize];
        
        
        sender.selected=YES;
        
        sender.titleLabel.font=[UIFont systemFontOfSize:selectTitleSize];
        
        
        //设置选中图片的位置
        [UIView animateWithDuration:.3 animations:^{
            _selectImageV.transform=CGAffineTransformMakeTranslation(with*(sender.tag-100), 0);
        }];
        
        
        //回调
        blockTwo(sender.tag-100);

        
    }
    

    _lastBtn=sender;

}



//block回调
- (void)returnPageNum:(PageNum)block{



    blockTwo=block;



}


//选中图片的setter方法
- (void)setSelectImage:(UIImage *)selectImage{
    
    _selectImage=selectImage;

    _selectImageV.image=selectImage;
    
    
    

}



//默认选中btn的setter方法
- (void)setFirstIndix:(NSInteger)firstIndix{


    _firstIndix=firstIndix;
    
    if (_firstIndix>=0&&_firstIndix<_titles.count-1) {
        
        
        UIButton *btn=(UIButton *)[self viewWithTag:100+_firstIndix];
        
        [self btnAct:btn];
        
    }




}
@end
