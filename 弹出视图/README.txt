
初始化代码：  
	self.popView = [[ZDXPopupView alloc] initWithFrame:self.view.bounds];
    self.popView.animationOptions = ZDXPopupViewAnimationOptionsFromBottom;
    self.popView.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.400];
//    self.popView.duration = 0.3;
    self.popView.dataSource = self;

数据源代码：
	- (UIView *)viewForContentInPopupView:(ZDXPopupView *)popupVie {
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 200, 200)];
    v.backgroundColor = [UIColor yellowColor];
    //    [v addTarget:self action:@selector(test3) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *b1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    b1.backgroundColor = [UIColor greenColor];
    [b1 setTitle:@"Look" forState:UIControlStateNormal];
    b1.tag = 1000;
    [v addSubview:b1];
    [b1 addTarget:self action:@selector(test5:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *b2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 200, 100)];
    b2.backgroundColor = [UIColor redColor];
    [b2 setTitle:@"Here" forState:UIControlStateNormal];
    b2.tag = 1001;
    [v addSubview:b2];
    [b2 addTarget:self action:@selector(test5:) forControlEvents:UIControlEventTouchUpInside];
    
    return v;
}

显示视图代码：
    [self.popView show];
