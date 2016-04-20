应用示例：
    // 添加N个内容视图
    NSMutableArray *tempAry = [NSMutableArray array];
    for (int i = 0; i < 5; i ++) {
        UITableView *tableView = [[UITableView alloc] init];
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CELL"];
        tableView.delegate = self;
        tableView.dataSource = self;
        [tempAry addObject:tableView];
    }
    ZDXMoveAndScrollView *moveAndScrollView = [[ZDXMoveAndScrollView alloc] initWithFrame:self.view.bounds
                                                                    buttons:@[@"全部", @"待付款", @"待发货", @"待收货", @"待评价"]
                                                               contentViews:tempAry];
    
	moveAndScrollView.delegate = self;
    [self.view addSubview:moveAndScrollView];
	// 代表控制选中某行
	[moveAndScrollView chooseButtonAtIndex:3];
