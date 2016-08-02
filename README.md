# UITableViewBlock
UITableView代理和数据源方法都可使用Block方式调用.<br/>
宝宝们再也不用担心一不小心忘记设置(tableView.dataSource = self和tableView.delegate = self)或者忘记遵循<UITableViewDataSource, UITabBarDelegate>协议带来的种种烦恼!<br/>
避免使用UITableViewDataSource和UITabBarDelegate的API带来的代码分块不方便集中式查找和修改,多个tableView集中在一起逻辑复杂.<br/><br/>
可以使用Pod install<br/>
platform :ios, '7.0'<br/>
target :'The project name' do<br/>
pod 'UITableViewBlock'<br/>
end  <br/>
```objective-c
- (void)setTestTableViewContent {
// UITableView三大基本方法
[[[self.testTableView hd_numberOfSectionsInTableViewBlock:^NSInteger(UITableView * _Nonnull tableView) {
return 2;
}] hd_tableViewNumberOfRowsInSectionBlock:^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
return 3;
}] hd_tableViewCellForRowAtIndexPathBlock:^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
static NSString *const cellID = @"cellID";
UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
cell.textLabel.text = @"textLabel";
cell.detailTextLabel.text = @"detailTextLabel";

return cell;
}];

// 组头尾标题
[[self.testTableView hd_tableViewTitleForHeaderInSectionBlock:^NSString * _Nonnull(UITableView * _Nonnull tableView, NSInteger section) {
return @"You";
}] hd_tableViewTitleForFooterInSectionBlock:^NSString * _Nonnull(UITableView * _Nonnull tableView, NSInteger section) {
return @"Me";
}];

//  避免Block循环引用!!!
//  __weak typeof(self) weakSelf = self;
//  __strong typeof(weakSelf) strongSelf = weakSelf;
__weak typeof(self) weakSelf = self;
[self.testTableView hd_tableViewDidSelectRowAtIndexPathBlock:^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
__strong typeof(weakSelf) strongSelf = weakSelf;
if (!strongSelf) {
return;
}

NSLog(@"S = %@", indexPath);
[self.testTableView deselectRowAtIndexPath:indexPath animated:YES];
TestViewController *t = [[TestViewController alloc] init];
[self.navigationController pushViewController:t animated:YES];
}];
}
[downloadTask resume];
```
