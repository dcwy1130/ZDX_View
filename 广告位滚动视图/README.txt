
初始化代码：  
	self.loopScrollView = [[ZDXLoopScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
	self.loopScrollView.delegate = self;
	self.loopScrollView.dataSource = self;
	[self.view addSubview:self.loopScrollView];

数据源和代理方法代码：
#pragma mark - LoopScrollView DataSource And Delegate
- (NSInteger)numberOfItemsInLoopScrollView:(ZDXLoopScrollView *)loopScrollView {
    return 8;
}

- (UIView *)loopScrollView:(ZDXLoopScrollView *)loopScrollView viewForItemAtIndex:(NSInteger)index {
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:loopScrollView.bounds];
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld", (long)index]];
    return imageView;
}

- (void)loopScrollView:(ZDXLoopScrollView *)loopScrollView didSelectItemAtIndex:(NSInteger)index {
    NSString *message = [NSString stringWithFormat:@"点击了第%ld个", index + 1];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提醒" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"确定");
    }];
    [alertController addAction:alertAction];
    [self presentViewController:alertController animated:YES completion:nil];
}
