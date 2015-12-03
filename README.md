# ZXYSegmentedControl
自定义的SegmentedControl

使用方法：    
1.直接拖入工程中。  
2.创建自定义的SegmentedControl 对象。
    
    
Demo:    


    //创建titleView
    - (void)creatTitleView{
    
        ZXYSegmentedControl *segment=[[ZXYSegmentedControl alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 44) titles:@[@"新闻",@"预告片",@"排行榜",@"影评"]];
        
        segment.firstIndix=0;
        [segment returnPageNum:^(NSInteger num) {
            [self pageChange:num];
            
        }];
        
        
        self.navigationItem.titleView=segment;
    
    
    }

