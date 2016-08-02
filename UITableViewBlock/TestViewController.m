//
//  TestViewController.m
//  UITableViewBlock
//
//  Created by HeDong on 16/8/2.
//  Copyright © 2016年 hedong. All rights reserved.
//

#import "TestViewController.h"
#import "UITableView+HDExtension.h"

@interface TestViewController ()

@property (nonatomic, weak) UITableView *testTableView;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSubviews];
    [self setTestTableViewContent];
}

- (void)setUpSubviews {
    UITableView *testTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //    testTableView.delegate = self;
    //    testTableView.dataSource = self;
    [self.view addSubview:testTableView];
    self.testTableView = testTableView;
}

- (void)setTestTableViewContent {
    // UITableView三大基本方法
    [[[self.testTableView hd_numberOfSectionsInTableViewBlock:^NSInteger(UITableView * _Nonnull tableView) {
        return 2;
    }] hd_tableViewNumberOfRowsInSectionBlock:^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
        return 3;
    }] hd_tableViewCellForRowAtIndexPathBlock:^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        static NSString *const cellID = @"cellID";
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        cell.textLabel.text = @"避免循环引用";
        cell.detailTextLabel.text = @"detailTextLabel";
        
        return cell;
    }];
    
    // 组头尾标题
    [[self.testTableView hd_tableViewTitleForHeaderInSectionBlock:^NSString * _Nonnull(UITableView * _Nonnull tableView, NSInteger section) {
        return @"ABC";
    }] hd_tableViewTitleForFooterInSectionBlock:^NSString * _Nonnull(UITableView * _Nonnull tableView, NSInteger section) {
        return @"ZXC";
    }];
    
    // 点击cell
    __weak typeof(self) weakSelf = self;
    [self.testTableView hd_tableViewDidSelectRowAtIndexPathBlock:^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (!strongSelf) {
            return;
        }
        
        NSLog(@"S = %@", indexPath);
        [strongSelf.testTableView deselectRowAtIndexPath:indexPath animated:YES];
    }];
}

- (void)dealloc {
    NSLog(@"dealloc");
}

@end
