//
//  UITableView+HDExtension.m
//  PortableTreasure
//
//  Created by HeDong on 15/7/30.
//  Copyright © 2015年 hedong. All rights reserved.
//

#import "UITableView+HDExtension.h"
#import <objc/runtime.h>

@implementation UITableView (HDExtension)

#pragma mark - 重写UITableViewDataSource
+ (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView.hd_tableViewNumberOfRowsInSectionBlock) {
        return tableView.hd_tableViewNumberOfRowsInSectionBlock(tableView, section);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDataSourceKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:numberOfRowsInSection:)]) {
        return [dataSource tableView:tableView numberOfRowsInSection:section];
    }
    
    return 0;
}

+ (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.hd_tableViewCellForRowAtIndexPathBlock) {
        return tableView.hd_tableViewCellForRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDataSourceKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:numberOfRowsInSection:)]) {
        return [dataSource tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    
    NSAssert(tableView.hd_tableViewCellForRowAtIndexPathBlock, @"hd_tableViewCellForRowAtIndexPathBlock must be set to return to UITableViewCell!!!");
    return nil;
}

+ (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView.hd_numberOfSectionsInTableViewBlock) {
        return tableView.hd_numberOfSectionsInTableViewBlock(tableView);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDataSourceKey);
    
    if ([dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
        return [dataSource numberOfSectionsInTableView:tableView];
    }

    return 1; // 默认是1组
}

+ (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (tableView.hd_tableViewTitleForHeaderInSectionBlock) {
        return tableView.hd_tableViewTitleForHeaderInSectionBlock(tableView, section);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDataSourceKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:titleForHeaderInSection:)]) {
        return [dataSource tableView:tableView titleForHeaderInSection:section];
    }
    
    return nil;
}

+ (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if (tableView.hd_tableViewTitleForFooterInSectionBlock) {
        return tableView.hd_tableViewTitleForFooterInSectionBlock(tableView, section);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDataSourceKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:titleForFooterInSection:)]) {
        return [dataSource tableView:tableView titleForFooterInSection:section];
    }
    
    return nil;
}

+ (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.hd_tableViewCanEditRowAtIndexPathBlock) {
        return tableView.hd_tableViewCanEditRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDataSourceKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:canEditRowAtIndexPath:)]) {
        return [dataSource tableView:tableView canEditRowAtIndexPath:indexPath];
    }
    
    return YES; // 默认可编辑
}

+ (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.hd_tableViewCanMoveRowAtIndexPathBlock) {
        return tableView.hd_tableViewCanMoveRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDataSourceKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:canMoveRowAtIndexPath:)]) {
        return [dataSource tableView:tableView canMoveRowAtIndexPath:indexPath];
    }
    
    return YES; // 默认允许重新排序附属视图选择为一个特定的行显示
}

//+ (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView __TVOS_PROHIBITED {
//    if (tableView.hd_sectionIndexTitlesForTableViewBlock) {
//        return tableView.hd_sectionIndexTitlesForTableViewBlock(tableView);
//    }
//    
//    id dataSource = objc_getAssociatedObject(self, UITableViewDataSourceKey);
//    
//    if ([dataSource respondsToSelector:@selector(sectionIndexTitlesForTableView:)]) {
//        return [dataSource sectionIndexTitlesForTableView:tableView];
//    }
//    
//    return nil;
//}

//+ (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index __TVOS_PROHIBITED {
//    if (tableView.hd_tableViewSectionForSectionIndexTitleAtIndexBlock) {
//        return tableView.hd_tableViewSectionForSectionIndexTitleAtIndexBlock(tableView, title, index);
//    }
//    
//    id dataSource = objc_getAssociatedObject(self, UITableViewDataSourceKey);
//    
//    if ([dataSource respondsToSelector:@selector(tableView:sectionForSectionIndexTitle:atIndex:)]) {
//        return [dataSource tableView:tableView sectionForSectionIndexTitle:title atIndex:index];
//    }
//    
//    return 0;
//}

+ (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.hd_tableViewCommitEditingStyleForRowAtIndexPathBlock) {
        return tableView.hd_tableViewCommitEditingStyleForRowAtIndexPathBlock(tableView, editingStyle, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDataSourceKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:commitEditingStyle:forRowAtIndexPath:)]) {
        return [dataSource tableView:tableView commitEditingStyle:editingStyle forRowAtIndexPath:indexPath];
    }
}

+ (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    if (tableView.hd_tableViewMoveRowAtIndexPathToIndexPathBlock) {
        return tableView.hd_tableViewMoveRowAtIndexPathToIndexPathBlock(tableView, sourceIndexPath, destinationIndexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDataSourceKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:moveRowAtIndexPath:toIndexPath:)]) {
        return [dataSource tableView:tableView moveRowAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
    }
}

#pragma mark - UITableViewDataSourceBlcok
//_______________________________________________________________________________________________________________
// this protocol represents the data model object. as such, it supplies no information about appearance (including the cells)
static const void *UITableViewDataSourceKey                          = &UITableViewDataSourceKey;

static const void *UITableViewNumberOfRowsInSectionKey               = &UITableViewNumberOfRowsInSectionKey;
static const void *UITableViewCellForRowAtIndexPathKey               = &UITableViewCellForRowAtIndexPathKey;
static const void *UITableViewNumberOfSectionsInTableViewKey         = &UITableViewNumberOfSectionsInTableViewKey;
static const void *UITableViewTitleForHeaderInSectionKey             = &UITableViewTitleForHeaderInSectionKey;
static const void *UITableViewTitleForFooterInSectionKey             = &UITableViewTitleForFooterInSectionKey;
static const void *UITableViewCanEditRowAtIndexPathKey               = &UITableViewCanEditRowAtIndexPathKey;
static const void *UITableViewCanMoveRowAtIndexPathKey               = &UITableViewCanMoveRowAtIndexPathKey;
//static const void *UITableViewSectionIndexTitlesForTableViewKey      = &UITableViewSectionIndexTitlesForTableViewKey;
//static const void *UITableViewSectionForSectionIndexTitleAtIndexKey  = &UITableViewSectionForSectionIndexTitleAtIndexKey;
static const void *UITableViewCommitEditingStyleForRowAtIndexPathKey = &UITableViewCommitEditingStyleForRowAtIndexPathKey;
static const void *UITableViewMoveRowAtIndexPathToIndexPathKey       = &UITableViewMoveRowAtIndexPathToIndexPathKey;

/******* @required *******/
- (NSInteger (^)(UITableView *tableView, NSInteger section))hd_tableViewNumberOfRowsInSectionBlock {
    return objc_getAssociatedObject(self, UITableViewNumberOfRowsInSectionKey);
}

- (instancetype)hd_tableViewNumberOfRowsInSectionBlock:(NSInteger (^)(UITableView *tableView, NSInteger section))hd_tableViewNumberOfRowsInSectionBlock {
    [self hd_setDataSourceIfDataSourceSet];
    objc_setAssociatedObject(self, UITableViewNumberOfRowsInSectionKey, hd_tableViewNumberOfRowsInSectionBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
- (UITableViewCell * (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewCellForRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewCellForRowAtIndexPathKey);
}

- (instancetype)hd_tableViewCellForRowAtIndexPathBlock:(UITableViewCell * (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewCellForRowAtIndexPathBlock {
    [self hd_setDataSourceIfDataSourceSet];
    objc_setAssociatedObject(self, UITableViewCellForRowAtIndexPathKey, hd_tableViewCellForRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

/******* @optional *******/
- (NSInteger (^)(UITableView *tableView))hd_numberOfSectionsInTableViewBlock {
    return objc_getAssociatedObject(self, UITableViewNumberOfSectionsInTableViewKey);
}

- (instancetype)hd_numberOfSectionsInTableViewBlock:(NSInteger (^)(UITableView *tableView))hd_numberOfSectionsInTableViewBlock { // Default is 1 if not implemented
    [self hd_setDataSourceIfDataSourceSet];
    objc_setAssociatedObject(self, UITableViewNumberOfSectionsInTableViewKey, hd_numberOfSectionsInTableViewBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (NSString * (^)(UITableView *tableView, NSInteger section))hd_tableViewTitleForHeaderInSectionBlock {
    return objc_getAssociatedObject(self, UITableViewTitleForHeaderInSectionKey);
}

// fixed font style. use custom view (UILabel) if you want something different
- (instancetype)hd_tableViewTitleForHeaderInSectionBlock:(NSString * (^)(UITableView *tableView, NSInteger section))hd_tableViewTitleForHeaderInSectionBlock {
    [self hd_setDataSourceIfDataSourceSet];
    objc_setAssociatedObject(self, UITableViewTitleForHeaderInSectionKey, hd_tableViewTitleForHeaderInSectionBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (NSString * (^)(UITableView *tableView, NSInteger section))hd_tableViewTitleForFooterInSectionBlock {
    return objc_getAssociatedObject(self, UITableViewTitleForFooterInSectionKey);
}

- (instancetype)hd_tableViewTitleForFooterInSectionBlock:(NSString * (^)(UITableView *tableView, NSInteger section))hd_tableViewTitleForFooterInSectionBlock {
    [self hd_setDataSourceIfDataSourceSet];
    objc_setAssociatedObject(self, UITableViewTitleForFooterInSectionKey, hd_tableViewTitleForFooterInSectionBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// Editing

// Individual rows can opt out of having the -editing property set for them. If not implemented, all rows are assumed to be editable.
- (BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewCanEditRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewCanEditRowAtIndexPathKey);
}

- (instancetype)hd_tableViewCanEditRowAtIndexPathBlock:(BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewCanEditRowAtIndexPathBlock {
    [self hd_setDataSourceIfDataSourceSet];
    objc_setAssociatedObject(self, UITableViewCanEditRowAtIndexPathKey, hd_tableViewCanEditRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// Moving/reordering

// Allows the reorder accessory view to optionally be shown for a particular row. By default, the reorder control will be shown only if the datasource implements -tableView:moveRowAtIndexPath:toIndexPath:
- (BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewCanMoveRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewCanMoveRowAtIndexPathKey);
}

- (instancetype)hd_tableViewCanMoveRowAtIndexPathBlock:(BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewCanMoveRowAtIndexPathBlock {
    [self hd_setDataSourceIfDataSourceSet];
    objc_setAssociatedObject(self, UITableViewCanMoveRowAtIndexPathKey, hd_tableViewCanMoveRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// Index

// return list of section titles to display in section index view (e.g. "ABCD...Z#")
//- (NSArray<NSString *> * (^)(UITableView *tableView))hd_sectionIndexTitlesForTableViewBlock {
//    return objc_getAssociatedObject(self, UITableViewSectionIndexTitlesForTableViewKey);
//}

//- (instancetype)hd_sectionIndexTitlesForTableViewBlock:(NSArray<NSString *> * (^)(UITableView *tableView))hd_sectionIndexTitlesForTableViewBlock __TVOS_PROHIBITED {
//    [self hd_setDataSourceIfDataSourceSet];
//    objc_setAssociatedObject(self, UITableViewSectionIndexTitlesForTableViewKey, hd_sectionIndexTitlesForTableViewBlock, OBJC_ASSOCIATION_COPY);
//    
//    return self;
//}

// tell table which section corresponds to section title/index (e.g. "B",1))
//- (NSInteger (^)(UITableView *tableView, NSString *title, NSInteger index))hd_tableViewSectionForSectionIndexTitleAtIndexBlock {
//    return objc_getAssociatedObject(self, UITableViewSectionForSectionIndexTitleAtIndexKey);
//}

//- (instancetype)hd_tableViewSectionForSectionIndexTitleAtIndexBlock:(NSInteger (^)(UITableView *tableView, NSString *title, NSInteger index))hd_tableViewSectionForSectionIndexTitleAtIndexBlock __TVOS_PROHIBITED {
//    [self hd_setDataSourceIfDataSourceSet];
//    objc_setAssociatedObject(self, UITableViewSectionForSectionIndexTitleAtIndexKey, hd_tableViewSectionForSectionIndexTitleAtIndexBlock, OBJC_ASSOCIATION_COPY);
//    
//    return self;
//}

// Data manipulation - insert and delete support

// After a row has the minus or plus button invoked (based on the UITableViewCellEditingStyle for the cell), the dataSource must commit the change
// Not called for edit actions using UITableViewRowAction - the action's handler will be invoked instead
- (void (^)(UITableView *tableView, UITableViewCellEditingStyle editingStyle, NSIndexPath *indexPath))hd_tableViewCommitEditingStyleForRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewCommitEditingStyleForRowAtIndexPathKey);
}

- (instancetype)hd_tableViewCommitEditingStyleForRowAtIndexPathBlock:(void (^)(UITableView *tableView, UITableViewCellEditingStyle editingStyle, NSIndexPath *indexPath))hd_tableViewCommitEditingStyleForRowAtIndexPathBlock {
    [self hd_setDataSourceIfDataSourceSet];
    objc_setAssociatedObject(self, UITableViewCommitEditingStyleForRowAtIndexPathKey, hd_tableViewCommitEditingStyleForRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// Data manipulation - reorder / moving support
- (void (^)(UITableView *tableView, NSIndexPath *sourceIndexPath, NSIndexPath *destinationIndexPath))hd_tableViewMoveRowAtIndexPathToIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewMoveRowAtIndexPathToIndexPathKey);
}

- (instancetype)hd_tableViewMoveRowAtIndexPathToIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *sourceIndexPath, NSIndexPath *destinationIndexPath))hd_tableViewMoveRowAtIndexPathToIndexPathBlock {
    [self hd_setDataSourceIfDataSourceSet];
    objc_setAssociatedObject(self, UITableViewMoveRowAtIndexPathToIndexPathKey, hd_tableViewMoveRowAtIndexPathToIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

/**
 *  避免使用UITableView-block而没有设置dataSource将自己设置为dataSource
 */
- (void)hd_setDataSourceIfDataSourceSet {
    if (self.dataSource != (id<UITableViewDataSource>)[self class]) {
        objc_setAssociatedObject(self, UITableViewDataSourceKey, self.dataSource, OBJC_ASSOCIATION_ASSIGN);
        self.dataSource = (id<UITableViewDataSource>)[self class];
    }
}

#pragma mark - 重写UITableViewDelegate
+ (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.hd_tableViewWillDisplayCellForRowAtIndexPathBlock) {
        return tableView.hd_tableViewWillDisplayCellForRowAtIndexPathBlock(tableView, cell, indexPath);
    }

    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:willDisplayCell:forRowAtIndexPath:)]) {
        return [dataSource tableView:tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
    }
}

+ (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0) {
    if (tableView.hd_tableViewWillDisplayHeaderViewForSectionBlock) {
        return tableView.hd_tableViewWillDisplayHeaderViewForSectionBlock(tableView, view, section);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:willDisplayHeaderView:forSection:)]) {
        return [dataSource tableView:tableView willDisplayHeaderView:view forSection:section];
    }
}

+ (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0) {
    if (tableView.hd_tableViewWillDisplayFooterViewForSectionBlock) {
        return tableView.hd_tableViewWillDisplayFooterViewForSectionBlock(tableView, view, section);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:willDisplayFooterView:forSection:)]) {
        return [dataSource tableView:tableView willDisplayFooterView:view forSection:section];
    }
}

+ (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath NS_AVAILABLE_IOS(6_0) {
    if (tableView.hd_tableViewDidEndDisplayingCellForRowAtIndexPathBlock) {
        return tableView.hd_tableViewDidEndDisplayingCellForRowAtIndexPathBlock(tableView, cell, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:didEndDisplayingCell:forRowAtIndexPath:)]) {
        return [dataSource tableView:tableView didEndDisplayingCell:cell forRowAtIndexPath:indexPath];
    }
}

+ (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0) {
    if (tableView.hd_tableViewDidEndDisplayingHeaderViewForSectionBlock) {
        return tableView.hd_tableViewDidEndDisplayingHeaderViewForSectionBlock(tableView, view, section);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:didEndDisplayingHeaderView:forSection:)]) {
        return [dataSource tableView:tableView didEndDisplayingHeaderView:view forSection:section];
    }
}

+ (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0) {
    if (tableView.hd_tableViewDidEndDisplayingFooterViewForSectionBlock) {
        return tableView.hd_tableViewDidEndDisplayingFooterViewForSectionBlock(tableView, view, section);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:didEndDisplayingFooterView:forSection:)]) {
        return [dataSource tableView:tableView didEndDisplayingFooterView:view forSection:section];
    }
}

+ (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.hd_tableViewHeightForRowAtIndexPathBlock) {
        return tableView.hd_tableViewHeightForRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)]) {
        return [dataSource tableView:tableView heightForRowAtIndexPath:indexPath];
    }
    
    return tableView.rowHeight;
}

+ (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (tableView.hd_tableViewHeightForHeaderInSectionBlock) {
        return tableView.hd_tableViewHeightForHeaderInSectionBlock(tableView, section);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:heightForHeaderInSection:)]) {
        return [dataSource tableView:tableView heightForHeaderInSection:section];
    }
    
    return tableView.sectionHeaderHeight;
}

+ (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (tableView.hd_tableViewHeightForFooterInSectionBlock) {
        return tableView.hd_tableViewHeightForFooterInSectionBlock(tableView, section);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:heightForFooterInSection:)]) {
        return [dataSource tableView:tableView heightForFooterInSection:section];
    }
    
    return tableView.sectionFooterHeight;
}

+ (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(7_0) {
    if (tableView.hd_tableViewEstimatedHeightForRowAtIndexPathBlock) {
        return tableView.hd_tableViewEstimatedHeightForRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:estimatedHeightForRowAtIndexPath:)]) {
        return [dataSource tableView:tableView estimatedHeightForRowAtIndexPath:indexPath];
    }
    
    return tableView.estimatedRowHeight;
}

+ (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section NS_AVAILABLE_IOS(7_0) {
    if (tableView.hd_tableViewEstimatedHeightForHeaderInSectionBlock) {
        return tableView.hd_tableViewEstimatedHeightForHeaderInSectionBlock(tableView, section);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:estimatedHeightForHeaderInSection:)]) {
        return [dataSource tableView:tableView estimatedHeightForHeaderInSection:section];
    }
    
    return 1; // tableView.estimatedSectionHeaderHeight;
}

+ (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section NS_AVAILABLE_IOS(7_0) {
    if (tableView.hd_tableViewEstimatedHeightForFooterInSectionBlock) {
        return tableView.hd_tableViewEstimatedHeightForFooterInSectionBlock(tableView, section);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:estimatedHeightForFooterInSection:)]) {
        return [dataSource tableView:tableView estimatedHeightForFooterInSection:section];
    }
    
    return 1; // tableView.estimatedSectionFooterHeight;
}

+ (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (tableView.hd_tableViewViewForHeaderInSectionBlock) {
        return tableView.hd_tableViewViewForHeaderInSectionBlock(tableView, section);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:viewForHeaderInSection:)]) {
        return [dataSource tableView:tableView viewForHeaderInSection:section];
    }
    
    return nil;
}

+ (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (tableView.hd_tableViewViewForFooterInSectionBlock) {
        return tableView.hd_tableViewViewForFooterInSectionBlock(tableView, section);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:viewForFooterInSection:)]) {
        return [dataSource tableView:tableView viewForFooterInSection:section];
    }
    
    return nil;
}

//+ (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath NS_DEPRECATED_IOS(2_0, 3_0) __TVOS_PROHIBITED {
//    if (tableView.hd_tableViewAccessoryTypeForRowWithIndexPathBlock) {
//        return tableView.hd_tableViewAccessoryTypeForRowWithIndexPathBlock(tableView, indexPath);
//    }
//    
//    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
//    
//    if ([dataSource respondsToSelector:@selector(tableView:accessoryTypeForRowWithIndexPath:)]) {
//        return [dataSource tableView:tableView accessoryTypeForRowWithIndexPath:indexPath];
//    }
//    
//    return UITableViewCellAccessoryNone; // 默认为none
//}

+ (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    if (tableView.hd_tableViewAccessoryButtonTappedForRowWithIndexPathBlock) {
        return tableView.hd_tableViewAccessoryButtonTappedForRowWithIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:accessoryButtonTappedForRowWithIndexPath:)]) {
        return [dataSource tableView:tableView accessoryButtonTappedForRowWithIndexPath:indexPath];
    }
}

+ (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0) {
    if (tableView.hd_tableViewShouldHighlightRowAtIndexPathBlock) {
        return tableView.hd_tableViewShouldHighlightRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:shouldHighlightRowAtIndexPath:)]) {
        return [dataSource tableView:tableView shouldHighlightRowAtIndexPath:indexPath];
    }
    
    return YES;
}

+ (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0) {
    if (tableView.hd_tableViewDidHighlightRowAtIndexPathBlock) {
        return tableView.hd_tableViewDidHighlightRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:didHighlightRowAtIndexPath:)]) {
        return [dataSource tableView:tableView didHighlightRowAtIndexPath:indexPath];
    }
}

+ (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0) {
    if (tableView.hd_tableViewDidUnhighlightRowAtIndexPathBlock) {
        return tableView.hd_tableViewDidUnhighlightRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:didUnhighlightRowAtIndexPath:)]) {
        return [dataSource tableView:tableView didUnhighlightRowAtIndexPath:indexPath];
    }
}

+ (nullable NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.hd_tableViewWillSelectRowAtIndexPathBlock) {
        return tableView.hd_tableViewWillSelectRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:willSelectRowAtIndexPath:)]) {
        return [dataSource tableView:tableView willSelectRowAtIndexPath:indexPath];
    }
    
    return indexPath;
}

+ (nullable NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0) {
    if (tableView.hd_tableViewWillDeselectRowAtIndexPathBlock) {
        return tableView.hd_tableViewWillDeselectRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:willDeselectRowAtIndexPath:)]) {
        return [dataSource tableView:tableView willDeselectRowAtIndexPath:indexPath];
    }
    
    return indexPath;
}

+ (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.hd_tableViewDidSelectRowAtIndexPathBlock) {
        return tableView.hd_tableViewDidSelectRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        return [dataSource tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}

+ (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0) {
    if (tableView.hd_tableViewDidDeselectRowAtIndexPathBlock) {
        return tableView.hd_tableViewDidDeselectRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:didDeselectRowAtIndexPath:)]) {
        return [dataSource tableView:tableView didDeselectRowAtIndexPath:indexPath];
    }
}

+ (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.hd_tableViewEditingStyleForRowAtIndexPathBlock) {
        return tableView.hd_tableViewEditingStyleForRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:editingStyleForRowAtIndexPath:)]) {
        return [dataSource tableView:tableView editingStyleForRowAtIndexPath:indexPath];
    }
    
    return UITableViewCellEditingStyleNone;
}

//+ (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0) __TVOS_PROHIBITED {
//    if (tableView.hd_tableViewTitleForDeleteConfirmationButtonForRowAtIndexPathBlock) {
//        return tableView.hd_tableViewTitleForDeleteConfirmationButtonForRowAtIndexPathBlock(tableView, indexPath);
//    }
//    
//    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
//    
//    if ([dataSource respondsToSelector:@selector(tableView:titleForDeleteConfirmationButtonForRowAtIndexPath:)]) {
//        return [dataSource tableView:tableView titleForDeleteConfirmationButtonForRowAtIndexPath:indexPath];
//    }
//    
//    return nil;
//}

//+ (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED {
//    if (tableView.hd_tableViewEditActionsForRowAtIndexPathBlock) {
//        return tableView.hd_tableViewEditActionsForRowAtIndexPathBlock(tableView, indexPath);
//    }
//    
//    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
//    
//    if ([dataSource respondsToSelector:@selector(tableView:editActionsForRowAtIndexPath:)]) {
//        return [dataSource tableView:tableView editActionsForRowAtIndexPath:indexPath];
//    }
//    
//    return nil;
//}

+ (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.hd_tableViewShouldIndentWhileEditingRowAtIndexPathBlock) {
        return tableView.hd_tableViewShouldIndentWhileEditingRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:shouldIndentWhileEditingRowAtIndexPath:)]) {
        return [dataSource tableView:tableView shouldIndentWhileEditingRowAtIndexPath:indexPath];
    }
    
    return YES;
}

//+ (void)tableView:(UITableView*)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath __TVOS_PROHIBITED {
//    if (tableView.hd_tableViewWillBeginEditingRowAtIndexPathBlock) {
//        return tableView.hd_tableViewWillBeginEditingRowAtIndexPathBlock(tableView, indexPath);
//    }
//    
//    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
//    
//    if ([dataSource respondsToSelector:@selector(tableView:willBeginEditingRowAtIndexPath:)]) {
//        return [dataSource tableView:tableView willBeginEditingRowAtIndexPath:indexPath];
//    }
//}

//+ (void)tableView:(UITableView*)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath __TVOS_PROHIBITED {
//    if (tableView.hd_tableViewDidEndEditingRowAtIndexPathBlock) {
//        return tableView.hd_tableViewDidEndEditingRowAtIndexPathBlock(tableView, indexPath);
//    }
//    
//    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
//    
//    if ([dataSource respondsToSelector:@selector(tableView:didEndEditingRowAtIndexPath:)]) {
//        return [dataSource tableView:tableView didEndEditingRowAtIndexPath:indexPath];
//    }
//}

+ (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath {
    if (tableView.hd_tableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathBlock) {
        return tableView.hd_tableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathBlock(tableView, sourceIndexPath, proposedDestinationIndexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:targetIndexPathForMoveFromRowAtIndexPath:toProposedIndexPath:)]) {
        return [dataSource tableView:tableView targetIndexPathForMoveFromRowAtIndexPath:sourceIndexPath toProposedIndexPath:proposedDestinationIndexPath];
    }
    
    NSAssert(tableView.hd_tableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathBlock, @"hd_tableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathBlock must be set to return to NSIndexPath!!!");
    return nil;
}

+ (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.hd_tableViewIndentationLevelForRowAtIndexPathBlock) {
        return tableView.hd_tableViewIndentationLevelForRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:indentationLevelForRowAtIndexPath:)]) {
        return [dataSource tableView:tableView indentationLevelForRowAtIndexPath:indexPath];
    }
    
    return 0;
}

+ (BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(5_0) {
    if (tableView.hd_tableViewShouldShowMenuForRowAtIndexPathBlock) {
        return tableView.hd_tableViewShouldShowMenuForRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:shouldShowMenuForRowAtIndexPath:)]) {
        return [dataSource tableView:tableView shouldShowMenuForRowAtIndexPath:indexPath];
    }
    
    return NO; // 默认不显示编辑菜单
}

+ (BOOL)tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender NS_AVAILABLE_IOS(5_0) {
    if (tableView.hd_tableViewCanPerformActionForRowAtIndexPathWithSenderBlock) {
        return tableView.hd_tableViewCanPerformActionForRowAtIndexPathWithSenderBlock(tableView, action, indexPath, sender);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:canPerformAction:forRowAtIndexPath:withSender:)]) {
        return [dataSource tableView:tableView canPerformAction:action forRowAtIndexPath:indexPath withSender:sender];
    }
    
    return NO; // 默认不能执行每一行菜单方法
}

+ (void)tableView:(UITableView *)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender NS_AVAILABLE_IOS(5_0) {
    if (tableView.hd_tableViewPerformActionForRowAtIndexPathWithSenderBlock) {
        return tableView.hd_tableViewPerformActionForRowAtIndexPathWithSenderBlock(tableView, action, indexPath, sender);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:performAction:forRowAtIndexPath:withSender:)]) {
        return [dataSource tableView:tableView performAction:action forRowAtIndexPath:indexPath withSender:sender];
    }
}

+ (BOOL)tableView:(UITableView *)tableView canFocusRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(9_0) {
    if (tableView.hd_tableViewCanFocusRowAtIndexPathBlock) {
        return tableView.hd_tableViewCanFocusRowAtIndexPathBlock(tableView, indexPath);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:canFocusRowAtIndexPath:)]) {
        return [dataSource tableView:tableView canFocusRowAtIndexPath:indexPath];
    }
    
    return YES;
}

+ (BOOL)tableView:(UITableView *)tableView shouldUpdateFocusInContext:(UITableViewFocusUpdateContext *)context NS_AVAILABLE_IOS(9_0) {
    if (tableView.hd_tableViewShouldUpdateFocusInContextBlock) {
        return tableView.hd_tableViewShouldUpdateFocusInContextBlock(tableView, context);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:shouldUpdateFocusInContext:)]) {
        return [dataSource tableView:tableView shouldUpdateFocusInContext:context];
    }
    
    return YES;
}

+ (void)tableView:(UITableView *)tableView didUpdateFocusInContext:(UITableViewFocusUpdateContext *)context withAnimationCoordinator:(UIFocusAnimationCoordinator *)coordinator NS_AVAILABLE_IOS(9_0) {
    if (tableView.hd_tableViewDidUpdateFocusInContextWithAnimationCoordinatorBlock) {
        return tableView.hd_tableViewDidUpdateFocusInContextWithAnimationCoordinatorBlock(tableView, context, coordinator);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(tableView:didUpdateFocusInContext:withAnimationCoordinator:)]) {
        return [dataSource tableView:tableView didUpdateFocusInContext:context withAnimationCoordinator:coordinator];
    }
}

+ (nullable NSIndexPath *)indexPathForPreferredFocusedViewInTableView:(UITableView *)tableView NS_AVAILABLE_IOS(9_0) {
    if (tableView.hd_indexPathForPreferredFocusedViewInTableViewBlock) {
        return tableView.hd_indexPathForPreferredFocusedViewInTableViewBlock(tableView);
    }
    
    id dataSource = objc_getAssociatedObject(self, UITableViewDelegateKey);
    
    if ([dataSource respondsToSelector:@selector(indexPathForPreferredFocusedViewInTableView:)]) {
        return [dataSource indexPathForPreferredFocusedViewInTableView:tableView];
    }
    
    return nil;
}

#pragma mark - UITableViewDelegateBlock
//_______________________________________________________________________________________________________________
// this represents the display and behaviour of the cells.
static const void *UITableViewDelegateKey                                          = &UITableViewDelegateKey;

static const void *UITableViewWillDisplayCellForRowAtIndexPathKey                  = &UITableViewWillDisplayCellForRowAtIndexPathKey;
static const void *UITableViewWillDisplayHeaderViewForSectionKey                   = &UITableViewWillDisplayHeaderViewForSectionKey;
static const void *UITableViewWillDisplayFooterViewForSectionKey                   = &UITableViewWillDisplayFooterViewForSectionKey;
static const void *UITableViewDidEndDisplayingCellForRowAtIndexPathKey             = &UITableViewDidEndDisplayingCellForRowAtIndexPathKey;
static const void *UITableViewDidEndDisplayingHeaderViewForSectionKey              = &UITableViewDidEndDisplayingHeaderViewForSectionKey;
static const void *UITableViewDidEndDisplayingFooterViewForSectionKey              = &UITableViewDidEndDisplayingFooterViewForSectionKey;
static const void *UITableViewHeightForRowAtIndexPathKey                           = &UITableViewHeightForRowAtIndexPathKey;
static const void *UITableViewHeightForHeaderInSectionKey                          = &UITableViewHeightForHeaderInSectionKey;
static const void *UITableViewHeightForFooterInSectionKey                          = &UITableViewHeightForFooterInSectionKey;
static const void *UITableViewEstimatedHeightForRowAtIndexPathKey                  = &UITableViewEstimatedHeightForRowAtIndexPathKey;
static const void *UITableViewEstimatedHeightForHeaderInSectionKey                 = &UITableViewEstimatedHeightForHeaderInSectionKey;
static const void *UITableViewEstimatedHeightForFooterInSectionKey                 = &UITableViewEstimatedHeightForFooterInSectionKey;
static const void *UITableViewViewForHeaderInSectionKey                            = &UITableViewViewForHeaderInSectionKey;
static const void *UITableViewViewForFooterInSectionKey                            = &UITableViewViewForFooterInSectionKey;
//static const void *UITableViewAccessoryTypeForRowWithIndexPathKey                  = &UITableViewAccessoryTypeForRowWithIndexPathKey;
static const void *UITableViewAccessoryButtonTappedForRowWithIndexPathKey          = &UITableViewAccessoryButtonTappedForRowWithIndexPathKey;
static const void *UITableViewShouldHighlightRowAtIndexPathKey                     = &UITableViewShouldHighlightRowAtIndexPathKey;
static const void *UITableViewDidHighlightRowAtIndexPathKey                        = &UITableViewDidHighlightRowAtIndexPathKey;
static const void *UITableViewDidUnhighlightRowAtIndexPathKey                      = &UITableViewDidUnhighlightRowAtIndexPathKey;
static const void *UITableViewWillSelectRowAtIndexPathKey                          = &UITableViewWillSelectRowAtIndexPathKey;
static const void *UITableViewWillDeselectRowAtIndexPathKey                        = &UITableViewWillDeselectRowAtIndexPathKey;
static const void *UITableViewDidSelectRowAtIndexPathKey                           = &UITableViewDidSelectRowAtIndexPathKey;
static const void *UITableViewDidDeselectRowAtIndexPathKey                         = &UITableViewDidDeselectRowAtIndexPathKey;
static const void *UITableViewEditingStyleForRowAtIndexPathKey                     = &UITableViewEditingStyleForRowAtIndexPathKey;
//static const void *UITableViewTitleForDeleteConfirmationButtonForRowAtIndexPathKey = &UITableViewTitleForDeleteConfirmationButtonForRowAtIndexPathKey;
//static const void *UITableViewEditActionsForRowAtIndexPathKey                      = &UITableViewEditActionsForRowAtIndexPathKey;
static const void *UITableViewShouldIndentWhileEditingRowAtIndexPathKey            = &UITableViewShouldIndentWhileEditingRowAtIndexPathKey;
//static const void *UITableViewWillBeginEditingRowAtIndexPathKey                    = &UITableViewWillBeginEditingRowAtIndexPathKey;
//static const void *UITableViewDidEndEditingRowAtIndexPathKey                       = &UITableViewDidEndEditingRowAtIndexPathKey;
static const void *UITableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathKey = &UITableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathKey;
static const void *UITableViewIndentationLevelForRowAtIndexPathKey                 = &UITableViewIndentationLevelForRowAtIndexPathKey;
static const void *UITableViewShouldShowMenuForRowAtIndexPathKey                   = &UITableViewShouldShowMenuForRowAtIndexPathKey;
static const void *UITableViewCanPerformActionForRowAtIndexPathWithSenderKey       = &UITableViewCanPerformActionForRowAtIndexPathWithSenderKey;
static const void *UITableViewPerformActionForRowAtIndexPathWithSenderKey          = &UITableViewPerformActionForRowAtIndexPathWithSenderKey;
static const void *UITableViewCanFocusRowAtIndexPathKey                            = &UITableViewCanFocusRowAtIndexPathKey;
static const void *UITableViewShouldUpdateFocusInContextKey                        = &UITableViewShouldUpdateFocusInContextKey;
static const void *UITableViewDidUpdateFocusInContextWithAnimationCoordinatorKey   = &UITableViewDidUpdateFocusInContextWithAnimationCoordinatorKey;
static const void *UITableViewIndexPathForPreferredFocusedViewInTableViewKey       = &UITableViewIndexPathForPreferredFocusedViewInTableViewKey;

/******* @optional *******/
// Display customization
- (void (^)(UITableView *tableView, UITableViewCell *cell, NSIndexPath *indexPath))hd_tableViewWillDisplayCellForRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewWillDisplayCellForRowAtIndexPathKey);
}

- (instancetype)hd_tableViewWillDisplayCellForRowAtIndexPathBlock:(void (^)(UITableView *tableView, UITableViewCell *cell, NSIndexPath *indexPath))hd_tableViewWillDisplayCellForRowAtIndexPathBlock {
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewWillDisplayCellForRowAtIndexPathKey, hd_tableViewWillDisplayCellForRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (void (^)(UITableView *tableView, UIView *view, NSInteger section))hd_tableViewWillDisplayHeaderViewForSectionBlock {
    return objc_getAssociatedObject(self, UITableViewWillDisplayHeaderViewForSectionKey);
}

- (instancetype)hd_tableViewWillDisplayHeaderViewForSectionBlock:(void (^)(UITableView *tableView, UIView *view, NSInteger section))hd_tableViewWillDisplayHeaderViewForSectionBlock NS_AVAILABLE_IOS(6_0) {
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewWillDisplayHeaderViewForSectionKey, hd_tableViewWillDisplayHeaderViewForSectionBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (void (^)(UITableView *tableView, UIView *view, NSInteger section))hd_tableViewWillDisplayFooterViewForSectionBlock {
    return objc_getAssociatedObject(self, UITableViewWillDisplayFooterViewForSectionKey);
}

- (instancetype)hd_tableViewWillDisplayFooterViewForSectionBlock:(void (^)(UITableView *tableView, UIView *view, NSInteger section))hd_tableViewWillDisplayFooterViewForSectionBlock NS_AVAILABLE_IOS(6_0) {
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewWillDisplayFooterViewForSectionKey, hd_tableViewWillDisplayFooterViewForSectionBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (void (^)(UITableView *tableView, UITableViewCell *cell, NSIndexPath *indexPath))hd_tableViewDidEndDisplayingCellForRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewDidEndDisplayingCellForRowAtIndexPathKey);
}

- (instancetype)hd_tableViewDidEndDisplayingCellForRowAtIndexPathBlock:(void (^)(UITableView *tableView, UITableViewCell *cell, NSIndexPath *indexPath))hd_tableViewDidEndDisplayingCellForRowAtIndexPathBlock NS_AVAILABLE_IOS(6_0) {
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewDidEndDisplayingCellForRowAtIndexPathKey, hd_tableViewDidEndDisplayingCellForRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (void (^)(UITableView *tableView, UIView *view, NSInteger section))hd_tableViewDidEndDisplayingHeaderViewForSectionBlock {
    return objc_getAssociatedObject(self, UITableViewDidEndDisplayingHeaderViewForSectionKey);
}

- (instancetype)hd_tableViewDidEndDisplayingHeaderViewForSectionBlock:(void (^)(UITableView *tableView, UIView *view, NSInteger section))hd_tableViewDidEndDisplayingHeaderViewForSectionBlock NS_AVAILABLE_IOS(6_0) {
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewDidEndDisplayingHeaderViewForSectionKey, hd_tableViewDidEndDisplayingHeaderViewForSectionBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (void (^)(UITableView *tableView, UIView *view, NSInteger section))hd_tableViewDidEndDisplayingFooterViewForSectionBlock {
    return objc_getAssociatedObject(self, UITableViewDidEndDisplayingFooterViewForSectionKey);
}

- (instancetype)hd_tableViewDidEndDisplayingFooterViewForSectionBlock:(void (^)(UITableView *tableView, UIView *view, NSInteger section))hd_tableViewDidEndDisplayingFooterViewForSectionBlock NS_AVAILABLE_IOS(6_0) {
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewDidEndDisplayingFooterViewForSectionKey, hd_tableViewDidEndDisplayingFooterViewForSectionBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// Variable height support
- (CGFloat (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewHeightForRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewHeightForRowAtIndexPathKey);
}

- (instancetype)hd_tableViewHeightForRowAtIndexPathBlock:(CGFloat (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewHeightForRowAtIndexPathBlock {
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewHeightForRowAtIndexPathKey, hd_tableViewHeightForRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (CGFloat (^)(UITableView *tableView, NSInteger section))hd_tableViewHeightForHeaderInSectionBlock {
    return objc_getAssociatedObject(self, UITableViewHeightForHeaderInSectionKey);
}

- (instancetype)hd_tableViewHeightForHeaderInSectionBlock:(CGFloat (^)(UITableView *tableView, NSInteger section))hd_tableViewHeightForHeaderInSectionBlock {
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewHeightForHeaderInSectionKey, hd_tableViewHeightForHeaderInSectionBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (CGFloat (^)(UITableView *tableView, NSInteger section))hd_tableViewHeightForFooterInSectionBlock {
    return objc_getAssociatedObject(self, UITableViewHeightForFooterInSectionKey);
}

- (instancetype)hd_tableViewHeightForFooterInSectionBlock:(CGFloat (^)(UITableView *tableView, NSInteger section))hd_tableViewHeightForFooterInSectionBlock {
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewHeightForFooterInSectionKey, hd_tableViewHeightForFooterInSectionBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// Use the estimatedHeight methods to quickly calcuate guessed values which will allow for fast load times of the table.
// If these methods are implemented, the above -tableView:heightForXXX calls will be deferred until views are ready to be displayed, so more expensive logic can be placed there.
- (CGFloat (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewEstimatedHeightForRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewEstimatedHeightForRowAtIndexPathKey);
}

- (instancetype)hd_tableViewEstimatedHeightForRowAtIndexPathBlock:(CGFloat (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewEstimatedHeightForRowAtIndexPathBlock NS_AVAILABLE_IOS(7_0) {
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewEstimatedHeightForRowAtIndexPathKey, hd_tableViewEstimatedHeightForRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (CGFloat (^)(UITableView *tableView, NSInteger section))hd_tableViewEstimatedHeightForHeaderInSectionBlock {
    return objc_getAssociatedObject(self, UITableViewEstimatedHeightForHeaderInSectionKey);
}

- (instancetype)hd_tableViewEstimatedHeightForHeaderInSectionBlock:(CGFloat (^)(UITableView *tableView, NSInteger section))hd_tableViewEstimatedHeightForHeaderInSectionBlock NS_AVAILABLE_IOS(7_0) {
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewEstimatedHeightForHeaderInSectionKey, hd_tableViewEstimatedHeightForHeaderInSectionBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (CGFloat (^)(UITableView *tableView, NSInteger section))hd_tableViewEstimatedHeightForFooterInSectionBlock {
    return objc_getAssociatedObject(self, UITableViewEstimatedHeightForFooterInSectionKey);
}

- (instancetype)hd_tableViewEstimatedHeightForFooterInSectionBlock:(CGFloat (^)(UITableView *tableView, NSInteger section))hd_tableViewEstimatedHeightForFooterInSectionBlock NS_AVAILABLE_IOS(7_0) {
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewEstimatedHeightForFooterInSectionKey, hd_tableViewEstimatedHeightForFooterInSectionBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// Section header & footer information. Views are preferred over title should you decide to provide both
- (nullable UIView * (^)(UITableView *tableView, NSInteger section))hd_tableViewViewForHeaderInSectionBlock {
    return objc_getAssociatedObject(self, UITableViewViewForHeaderInSectionKey);
}

- (instancetype)hd_tableViewViewForHeaderInSectionBlock:(nullable UIView * (^)(UITableView *tableView, NSInteger section))hd_tableViewViewForHeaderInSectionBlock { // custom view for header. will be adjusted to default or specified header height
    objc_setAssociatedObject(self, UITableViewViewForHeaderInSectionKey, hd_tableViewViewForHeaderInSectionBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (nullable UIView * (^)(UITableView *tableView, NSInteger section))hd_tableViewViewForFooterInSectionBlock {
    return objc_getAssociatedObject(self, UITableViewViewForFooterInSectionKey);
}

- (instancetype)hd_tableViewViewForFooterInSectionBlock:(nullable UIView * (^)(UITableView *tableView, NSInteger section))hd_tableViewViewForFooterInSectionBlock { // custom view for footer. will be adjusted to default or specified footer height
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewViewForFooterInSectionKey, hd_tableViewViewForFooterInSectionBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// Accessories (disclosures).
//- (UITableViewCellAccessoryType (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewAccessoryTypeForRowWithIndexPathBlock {
//    return objc_getAssociatedObject(self, UITableViewAccessoryTypeForRowWithIndexPathKey);
//}
//
//- (instancetype)hd_tableViewAccessoryTypeForRowWithIndexPathBlock:(UITableViewCellAccessoryType (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewAccessoryTypeForRowWithIndexPathBlock NS_DEPRECATED_IOS(2_0, 3_0) __TVOS_PROHIBITED {
//    [self hd_setDelegateIfDelegateSet];
//    objc_setAssociatedObject(self, UITableViewAccessoryTypeForRowWithIndexPathKey, hd_tableViewAccessoryTypeForRowWithIndexPathBlock, OBJC_ASSOCIATION_COPY);
//    
//    return self;
//}

- (void (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewAccessoryButtonTappedForRowWithIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewAccessoryButtonTappedForRowWithIndexPathKey);
}

- (instancetype)hd_tableViewAccessoryButtonTappedForRowWithIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewAccessoryButtonTappedForRowWithIndexPathBlock {
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewAccessoryButtonTappedForRowWithIndexPathKey, hd_tableViewAccessoryButtonTappedForRowWithIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// Selection

// -tableView:shouldHighlightRowAtIndexPath: is called when a touch comes down on a row.
// Returning NO to that message halts the selection process and does not cause the currently selected row to lose its selected look while the touch is down.
- (BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewShouldHighlightRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewShouldHighlightRowAtIndexPathKey);
}

- (instancetype)hd_tableViewShouldHighlightRowAtIndexPathBlock:(BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewShouldHighlightRowAtIndexPathBlock NS_AVAILABLE_IOS(6_0) {
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewShouldHighlightRowAtIndexPathKey, hd_tableViewShouldHighlightRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (void (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewDidHighlightRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewDidHighlightRowAtIndexPathKey);
}

- (instancetype)hd_tableViewDidHighlightRowAtIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewDidHighlightRowAtIndexPathBlock NS_AVAILABLE_IOS(6_0) {
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewDidHighlightRowAtIndexPathKey, hd_tableViewDidHighlightRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (void (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewDidUnhighlightRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewDidUnhighlightRowAtIndexPathKey);
}

- (instancetype)hd_tableViewDidUnhighlightRowAtIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewDidUnhighlightRowAtIndexPathBlock NS_AVAILABLE_IOS(6_0) {
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewDidUnhighlightRowAtIndexPathKey, hd_tableViewDidUnhighlightRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
- (nullable NSIndexPath * (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewWillSelectRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewWillSelectRowAtIndexPathKey);
}

- (instancetype)hd_tableViewWillSelectRowAtIndexPathBlock:(nullable NSIndexPath * (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewWillSelectRowAtIndexPathBlock {
    objc_setAssociatedObject(self, UITableViewWillSelectRowAtIndexPathKey, hd_tableViewWillSelectRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (nullable NSIndexPath * (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewWillDeselectRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewWillDeselectRowAtIndexPathKey);
}

- (instancetype)hd_tableViewWillDeselectRowAtIndexPathBlock:(nullable NSIndexPath * (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewWillDeselectRowAtIndexPathBlock NS_AVAILABLE_IOS(3_0) {
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewWillDeselectRowAtIndexPathKey, hd_tableViewWillDeselectRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// Called after the user changes the selection.
- (void (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewDidSelectRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewDidSelectRowAtIndexPathKey);
}

- (instancetype)hd_tableViewDidSelectRowAtIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewDidSelectRowAtIndexPathBlock {
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewDidSelectRowAtIndexPathKey, hd_tableViewDidSelectRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (void (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewDidDeselectRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewDidDeselectRowAtIndexPathKey);
}

- (instancetype)hd_tableViewDidDeselectRowAtIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewDidDeselectRowAtIndexPathBlock NS_AVAILABLE_IOS(3_0) {
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewDidDeselectRowAtIndexPathKey, hd_tableViewDidDeselectRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// Editing

// Allows customization of the editingStyle for a particular cell located at 'indexPath'. If not implemented, all editable cells will have UITableViewCellEditingStyleDelete set for them when the table has editing property set to YES.
- (UITableViewCellEditingStyle (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewEditingStyleForRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewEditingStyleForRowAtIndexPathKey);
}

- (instancetype)hd_tableViewEditingStyleForRowAtIndexPathBlock:(UITableViewCellEditingStyle (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewEditingStyleForRowAtIndexPathBlock {
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewEditingStyleForRowAtIndexPathKey, hd_tableViewEditingStyleForRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

//- (nullable NSString * (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewTitleForDeleteConfirmationButtonForRowAtIndexPathBlock {
//    return objc_getAssociatedObject(self, UITableViewTitleForDeleteConfirmationButtonForRowAtIndexPathKey);
//}

//- (instancetype)hd_tableViewTitleForDeleteConfirmationButtonForRowAtIndexPathBlock:(nullable NSString * (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewTitleForDeleteConfirmationButtonForRowAtIndexPathBlock NS_AVAILABLE_IOS(3_0) __TVOS_PROHIBITED {
//    [self hd_setDelegateIfDelegateSet];
//    objc_setAssociatedObject(self, UITableViewTitleForDeleteConfirmationButtonForRowAtIndexPathKey, hd_tableViewTitleForDeleteConfirmationButtonForRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
//    
//    return self;
//}

//- (nullable NSArray<UITableViewRowAction *> * (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewEditActionsForRowAtIndexPathBlock {
//    return objc_getAssociatedObject(self, UITableViewEditActionsForRowAtIndexPathKey);
//}

//- (instancetype)hd_tableViewEditActionsForRowAtIndexPathBlock:(nullable NSArray<UITableViewRowAction *> * (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewEditActionsForRowAtIndexPathBlock NS_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED { // supercedes -tableView:titleForDeleteConfirmationButtonForRowAtIndexPath: if return value is non-nil
//    [self hd_setDelegateIfDelegateSet];
//    objc_setAssociatedObject(self, UITableViewEditActionsForRowAtIndexPathKey, hd_tableViewEditActionsForRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
//    
//    return self;
//}

// Controls whether the background is indented while editing.  If not implemented, the default is YES.  This is unrelated to the indentation level below.  This method only applies to grouped style table views.
- (BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewShouldIndentWhileEditingRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewShouldIndentWhileEditingRowAtIndexPathKey);
}

- (instancetype)hd_tableViewShouldIndentWhileEditingRowAtIndexPathBlock:(BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewShouldIndentWhileEditingRowAtIndexPathBlock {
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewShouldIndentWhileEditingRowAtIndexPathKey, hd_tableViewShouldIndentWhileEditingRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// The willBegin/didEnd methods are called whenever the 'editing' property is automatically changed by the table (allowing insert/delete/move). This is done by a swipe activating a single row
//- (void (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewWillBeginEditingRowAtIndexPathBlock {
//    return objc_getAssociatedObject(self, UITableViewWillBeginEditingRowAtIndexPathKey);
//}

//- (instancetype)hd_tableViewWillBeginEditingRowAtIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewWillBeginEditingRowAtIndexPathBlock __TVOS_PROHIBITED {
//    [self hd_setDelegateIfDelegateSet];
//    objc_setAssociatedObject(self, UITableViewWillBeginEditingRowAtIndexPathKey, hd_tableViewWillBeginEditingRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
//    
//    return self;
//}

//- (void (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewDidEndEditingRowAtIndexPathBlock {
//    return objc_getAssociatedObject(self, UITableViewDidEndEditingRowAtIndexPathKey);
//}

//- (instancetype)hd_tableViewDidEndEditingRowAtIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewDidEndEditingRowAtIndexPathBlock __TVOS_PROHIBITED {
//    [self hd_setDelegateIfDelegateSet];
//    objc_setAssociatedObject(self, UITableViewDidEndEditingRowAtIndexPathKey, hd_tableViewDidEndEditingRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
//    
//    return self;
//}

// Moving/reordering

// Allows customization of the target row for a particular row as it is being moved/reordered
- (NSIndexPath * (^)(UITableView *tableView, NSIndexPath *sourceIndexPath, NSIndexPath *proposedDestinationIndexPath))hd_tableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathKey);
}

- (instancetype)hd_tableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathBlock:(NSIndexPath * (^)(UITableView *tableView, NSIndexPath *sourceIndexPath, NSIndexPath *proposedDestinationIndexPath))hd_tableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathBlock {
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathKey, hd_tableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// Indentation
- (NSInteger (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewIndentationLevelForRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewIndentationLevelForRowAtIndexPathKey);
}

- (instancetype)hd_tableViewIndentationLevelForRowAtIndexPathBlock:(NSInteger (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewIndentationLevelForRowAtIndexPathBlock { // return 'depth' of row for hierarchies
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewIndentationLevelForRowAtIndexPathKey, hd_tableViewIndentationLevelForRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// Copy/Paste.  All three methods must be implemented by the delegate.
- (BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewShouldShowMenuForRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewShouldShowMenuForRowAtIndexPathKey);
}

- (instancetype)hd_tableViewShouldShowMenuForRowAtIndexPathBlock:(BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewShouldShowMenuForRowAtIndexPathBlock NS_AVAILABLE_IOS(5_0) {
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewShouldShowMenuForRowAtIndexPathKey, hd_tableViewShouldShowMenuForRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (BOOL (^)(UITableView *tableView, SEL action, NSIndexPath *indexPath, __nullable id sender))hd_tableViewCanPerformActionForRowAtIndexPathWithSenderBlock {
    return objc_getAssociatedObject(self, UITableViewCanPerformActionForRowAtIndexPathWithSenderKey);
}

- (instancetype)hd_tableViewCanPerformActionForRowAtIndexPathWithSenderBlock:(BOOL (^)(UITableView *tableView, SEL action, NSIndexPath *indexPath, __nullable id sender))hd_tableViewCanPerformActionForRowAtIndexPathWithSenderBlock NS_AVAILABLE_IOS(5_0) {
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewCanPerformActionForRowAtIndexPathWithSenderKey, hd_tableViewCanPerformActionForRowAtIndexPathWithSenderBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (void (^)(UITableView *tableView, SEL action, NSIndexPath *indexPath, __nullable id sender))hd_tableViewPerformActionForRowAtIndexPathWithSenderBlock {
    return objc_getAssociatedObject(self, UITableViewPerformActionForRowAtIndexPathWithSenderKey);
}

- (instancetype)hd_tableViewPerformActionForRowAtIndexPathWithSenderBlock:(void (^)(UITableView *tableView, SEL action, NSIndexPath *indexPath, __nullable id sender))hd_tableViewPerformActionForRowAtIndexPathWithSenderBlock NS_AVAILABLE_IOS(5_0) {
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewPerformActionForRowAtIndexPathWithSenderKey, hd_tableViewPerformActionForRowAtIndexPathWithSenderBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

// Focus
- (BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewCanFocusRowAtIndexPathBlock {
    return objc_getAssociatedObject(self, UITableViewCanFocusRowAtIndexPathKey);
}

- (instancetype)hd_tableViewCanFocusRowAtIndexPathBlock:(BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewCanFocusRowAtIndexPathBlock NS_AVAILABLE_IOS(9_0) {
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewCanFocusRowAtIndexPathKey, hd_tableViewCanFocusRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (BOOL (^)(UITableView *tableView, UITableViewFocusUpdateContext *context))hd_tableViewShouldUpdateFocusInContextBlock {
    return objc_getAssociatedObject(self, UITableViewShouldUpdateFocusInContextKey);
}

- (instancetype)hd_tableViewShouldUpdateFocusInContextBlock:(BOOL (^)(UITableView *tableView, UITableViewFocusUpdateContext *context))hd_tableViewShouldUpdateFocusInContextBlock NS_AVAILABLE_IOS(9_0) {
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewShouldUpdateFocusInContextKey, hd_tableViewShouldUpdateFocusInContextBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (void (^)(UITableView *tableView, UITableViewFocusUpdateContext *context, UIFocusAnimationCoordinator *coordinator))hd_tableViewDidUpdateFocusInContextWithAnimationCoordinatorBlock {
    return objc_getAssociatedObject(self, UITableViewDidUpdateFocusInContextWithAnimationCoordinatorKey);
}

- (instancetype)hd_tableViewDidUpdateFocusInContextWithAnimationCoordinatorBlock:(void (^)(UITableView *tableView, UITableViewFocusUpdateContext *context, UIFocusAnimationCoordinator *coordinator))hd_tableViewDidUpdateFocusInContextWithAnimationCoordinatorBlock NS_AVAILABLE_IOS(9_0) {
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewDidUpdateFocusInContextWithAnimationCoordinatorKey, hd_tableViewDidUpdateFocusInContextWithAnimationCoordinatorBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (nullable NSIndexPath * (^)(UITableView *tableView))hd_indexPathForPreferredFocusedViewInTableViewBlock {
    return objc_getAssociatedObject(self, UITableViewIndexPathForPreferredFocusedViewInTableViewKey);
}

- (instancetype)hd_indexPathForPreferredFocusedViewInTableViewBlock:(nullable NSIndexPath * (^)(UITableView *tableView))hd_indexPathForPreferredFocusedViewInTableViewBlock NS_AVAILABLE_IOS(9_0) {
    [self hd_setDelegateIfDelegateSet];
    objc_setAssociatedObject(self, UITableViewIndexPathForPreferredFocusedViewInTableViewKey, hd_indexPathForPreferredFocusedViewInTableViewBlock, OBJC_ASSOCIATION_COPY);
    
    return self;
}

/**
 *  避免使用UITableView-block而没有设置delegate将自己设置为delegate
 */
- (void)hd_setDelegateIfDelegateSet {
    if (self.delegate != (id<UITableViewDelegate>)[self class]) {
        objc_setAssociatedObject(self, UITableViewDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        self.delegate = (id<UITableViewDelegate>)[self class];
    }
}

@end
