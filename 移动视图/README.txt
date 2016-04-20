应用示例：

    ZDXMoveView *moveView = [[ZDXMoveView alloc] initWithFrame:CGRectMake(0, 0, 375, 44) buttons:@[@"热卖", @"精品", @"促销", @"精品", @"促销"]];
    moveView.delegate = self;
    [self.view addSubview:moveView]; // 添加到主视图

	// 代码控制选中某一行
	[moveView chooseButtonAtIndex:2];
