//
//  UITableView+HDExtension.h
//  PortableTreasure
//
//  Created by HeDong on 15/7/30.
//  Copyright © 2015年 hedong. All rights reserved.
//  避免Block循环引用!!!
//  __weak typeof(self) weakSelf = self;
//  __strong typeof(weakSelf) strongSelf = weakSelf;
//  __TVOS_PROHIBITED 苹果不建议使用的方法都已经注释!!!


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (HDExtension)

#pragma mark - UITableViewDataSourceBlcok
//_______________________________________________________________________________________________________________
// this protocol represents the data model object. as such, it supplies no information about appearance (including the cells)

/******* @required *******/
- (instancetype)hd_tableViewNumberOfRowsInSectionBlock:(NSInteger (^)(UITableView *tableView, NSInteger section))hd_tableViewNumberOfRowsInSectionBlock;

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
- (instancetype)hd_tableViewCellForRowAtIndexPathBlock:(UITableViewCell * (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewCellForRowAtIndexPathBlock;

/******* @optional *******/
- (instancetype)hd_numberOfSectionsInTableViewBlock:(NSInteger (^)(UITableView *tableView))hd_numberOfSectionsInTableViewBlock; // Default is 1 if not implemented

// fixed font style. use custom view (UILabel) if you want something different
- (instancetype)hd_tableViewTitleForHeaderInSectionBlock:(NSString * (^)(UITableView *tableView, NSInteger section))hd_tableViewTitleForHeaderInSectionBlock;
- (instancetype)hd_tableViewTitleForFooterInSectionBlock:(NSString * (^)(UITableView *tableView, NSInteger section))hd_tableViewTitleForFooterInSectionBlock;

// Editing

// Individual rows can opt out of having the -editing property set for them. If not implemented, all rows are assumed to be editable.
- (instancetype)hd_tableViewCanEditRowAtIndexPathBlock:(BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewCanEditRowAtIndexPathBlock;

// Moving/reordering

// Allows the reorder accessory view to optionally be shown for a particular row. By default, the reorder control will be shown only if the datasource implements -tableView:moveRowAtIndexPath:toIndexPath:
- (instancetype)hd_tableViewCanMoveRowAtIndexPathBlock:(BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewCanMoveRowAtIndexPathBlock;

// Index

// return list of section titles to display in section index view (e.g. "ABCD...Z#")
//- (instancetype)hd_sectionIndexTitlesForTableViewBlock:(NSArray<NSString *> * (^)(UITableView *tableView))hd_sectionIndexTitlesForTableViewBlock __TVOS_PROHIBITED;

// tell table which section corresponds to section title/index (e.g. "B",1))
//- (instancetype)hd_tableViewSectionForSectionIndexTitleAtIndexBlock:(NSInteger (^)(UITableView *tableView, NSString *title, NSInteger index))hd_tableViewSectionForSectionIndexTitleAtIndexBlock __TVOS_PROHIBITED;

// Data manipulation - insert and delete support

// After a row has the minus or plus button invoked (based on the UITableViewCellEditingStyle for the cell), the dataSource must commit the change
// Not called for edit actions using UITableViewRowAction - the action's handler will be invoked instead
- (instancetype)hd_tableViewCommitEditingStyleForRowAtIndexPathBlock:(void (^)(UITableView *tableView, UITableViewCellEditingStyle editingStyle, NSIndexPath *indexPath))hd_tableViewCommitEditingStyleForRowAtIndexPathBlock;

// Data manipulation - reorder / moving support
- (instancetype)hd_tableViewMoveRowAtIndexPathToIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *sourceIndexPath, NSIndexPath *destinationIndexPath))hd_tableViewMoveRowAtIndexPathToIndexPathBlock;

#pragma mark - UITableViewDelegateBlcok
//_______________________________________________________________________________________________________________
// this represents the display and behaviour of the cells.

/******* @optional *******/
// Display customization
- (instancetype)hd_tableViewWillDisplayCellForRowAtIndexPathBlock:(void (^)(UITableView *tableView, UITableViewCell *cell, NSIndexPath *indexPath))hd_tableViewWillDisplayCellForRowAtIndexPathBlock;
- (instancetype)hd_tableViewWillDisplayHeaderViewForSectionBlock:(void (^)(UITableView *tableView, UIView *view, NSInteger section))hd_tableViewWillDisplayHeaderViewForSectionBlock NS_AVAILABLE_IOS(6_0);
- (instancetype)hd_tableViewWillDisplayFooterViewForSectionBlock:(void (^)(UITableView *tableView, UIView *view, NSInteger section))hd_tableViewWillDisplayFooterViewForSectionBlock NS_AVAILABLE_IOS(6_0);
- (instancetype)hd_tableViewDidEndDisplayingCellForRowAtIndexPathBlock:(void (^)(UITableView *tableView, UITableViewCell *cell, NSIndexPath *indexPath))hd_tableViewDidEndDisplayingCellForRowAtIndexPathBlock NS_AVAILABLE_IOS(6_0);
- (instancetype)hd_tableViewDidEndDisplayingHeaderViewForSectionBlock:(void (^)(UITableView *tableView, UIView *view, NSInteger section))hd_tableViewDidEndDisplayingHeaderViewForSectionBlock NS_AVAILABLE_IOS(6_0);
- (instancetype)hd_tableViewDidEndDisplayingFooterViewForSectionBlock:(void (^)(UITableView *tableView, UIView *view, NSInteger section))hd_tableViewDidEndDisplayingFooterViewForSectionBlock NS_AVAILABLE_IOS(6_0);

// Variable height support
- (instancetype)hd_tableViewHeightForRowAtIndexPathBlock:(CGFloat (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewHeightForRowAtIndexPathBlock;
- (instancetype)hd_tableViewHeightForHeaderInSectionBlock:(CGFloat (^)(UITableView *tableView, NSInteger section))hd_tableViewHeightForHeaderInSectionBlock;
- (instancetype)hd_tableViewHeightForFooterInSectionBlock:(CGFloat (^)(UITableView *tableView, NSInteger section))hd_tableViewHeightForFooterInSectionBlock;

// Use the estimatedHeight methods to quickly calcuate guessed values which will allow for fast load times of the table.
// If these methods are implemented, the above -tableView:heightForXXX calls will be deferred until views are ready to be displayed, so more expensive logic can be placed there.
- (instancetype)hd_tableViewEstimatedHeightForRowAtIndexPathBlock:(CGFloat (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewEstimatedHeightForRowAtIndexPathBlock NS_AVAILABLE_IOS(7_0);
- (instancetype)hd_tableViewEstimatedHeightForHeaderInSectionBlock:(CGFloat (^)(UITableView *tableView, NSInteger section))hd_tableViewEstimatedHeightForHeaderInSectionBlock NS_AVAILABLE_IOS(7_0);
- (instancetype)hd_tableViewEstimatedHeightForFooterInSectionBlock:(CGFloat (^)(UITableView *tableView, NSInteger section))hd_tableViewEstimatedHeightForFooterInSectionBlock NS_AVAILABLE_IOS(7_0);

// Section header & footer information. Views are preferred over title should you decide to provide both
- (instancetype)hd_tableViewViewForHeaderInSectionBlock:(nullable UIView * (^)(UITableView *tableView, NSInteger section))hd_tableViewViewForHeaderInSectionBlock; // custom view for header. will be adjusted to default or specified header height
- (instancetype)hd_tableViewViewForFooterInSectionBlock:(nullable UIView * (^)(UITableView *tableView, NSInteger section))hd_tableViewViewForFooterInSectionBlock; // custom view for footer. will be adjusted to default or specified footer height

// Accessories (disclosures).
//- (instancetype)hd_tableViewAccessoryTypeForRowWithIndexPathBlock:(UITableViewCellAccessoryType (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewAccessoryTypeForRowWithIndexPathBlock NS_DEPRECATED_IOS(2_0, 3_0) __TVOS_PROHIBITED;

- (instancetype)hd_tableViewAccessoryButtonTappedForRowWithIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewAccessoryButtonTappedForRowWithIndexPathBlock;

// Selection

// -tableView:shouldHighlightRowAtIndexPath: is called when a touch comes down on a row.
// Returning NO to that message halts the selection process and does not cause the currently selected row to lose its selected look while the touch is down.
- (instancetype)hd_tableViewShouldHighlightRowAtIndexPathBlock:(BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewShouldHighlightRowAtIndexPathBlock NS_AVAILABLE_IOS(6_0);
- (instancetype)hd_tableViewDidHighlightRowAtIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewDidHighlightRowAtIndexPathBlock NS_AVAILABLE_IOS(6_0);
- (instancetype)hd_tableViewDidUnhighlightRowAtIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewDidUnhighlightRowAtIndexPathBlock NS_AVAILABLE_IOS(6_0);

// Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
- (instancetype)hd_tableViewWillSelectRowAtIndexPathBlock:(nullable NSIndexPath * (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewWillSelectRowAtIndexPathBlock;
- (instancetype)hd_tableViewWillDeselectRowAtIndexPathBlock:(nullable NSIndexPath * (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewWillDeselectRowAtIndexPathBlock NS_AVAILABLE_IOS(3_0);

// Called after the user changes the selection.
- (instancetype)hd_tableViewDidSelectRowAtIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewDidSelectRowAtIndexPathBlock;
- (instancetype)hd_tableViewDidDeselectRowAtIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewDidDeselectRowAtIndexPathBlock NS_AVAILABLE_IOS(3_0);

// Editing

// Allows customization of the editingStyle for a particular cell located at 'indexPath'. If not implemented, all editable cells will have UITableViewCellEditingStyleDelete set for them when the table has editing property set to YES.
- (instancetype)hd_tableViewEditingStyleForRowAtIndexPathBlock:(UITableViewCellEditingStyle (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewEditingStyleForRowAtIndexPathBlock;
//- (instancetype)hd_tableViewTitleForDeleteConfirmationButtonForRowAtIndexPathBlock:(nullable NSString * (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewTitleForDeleteConfirmationButtonForRowAtIndexPathBlock NS_AVAILABLE_IOS(3_0) __TVOS_PROHIBITED;
//- (instancetype)hd_tableViewEditActionsForRowAtIndexPathBlock:(nullable NSArray<UITableViewRowAction *> * (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewEditActionsForRowAtIndexPathBlock NS_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED; // supercedes -tableView:titleForDeleteConfirmationButtonForRowAtIndexPath: if return value is non-nil

// Controls whether the background is indented while editing.  If not implemented, the default is YES.  This is unrelated to the indentation level below.  This method only applies to grouped style table views.
- (instancetype)hd_tableViewShouldIndentWhileEditingRowAtIndexPathBlock:(BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewShouldIndentWhileEditingRowAtIndexPathBlock;

// The willBegin/didEnd methods are called whenever the 'editing' property is automatically changed by the table (allowing insert/delete/move). This is done by a swipe activating a single row
//- (instancetype)hd_tableViewWillBeginEditingRowAtIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewWillBeginEditingRowAtIndexPathBlock __TVOS_PROHIBITED;
//- (instancetype)hd_tableViewDidEndEditingRowAtIndexPathBlock:(void (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewDidEndEditingRowAtIndexPathBlock __TVOS_PROHIBITED;

// Moving/reordering

// Allows customization of the target row for a particular row as it is being moved/reordered
- (instancetype)hd_tableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathBlock:(NSIndexPath * (^)(UITableView *tableView, NSIndexPath *sourceIndexPath, NSIndexPath *proposedDestinationIndexPath))hd_tableViewTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathBlock;

// Indentation

- (instancetype)hd_tableViewIndentationLevelForRowAtIndexPathBlock:(NSInteger (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewIndentationLevelForRowAtIndexPathBlock; // return 'depth' of row for hierarchies

// Copy/Paste.  All three methods must be implemented by the delegate.

- (instancetype)hd_tableViewShouldShowMenuForRowAtIndexPathBlock:(BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewShouldShowMenuForRowAtIndexPathBlock NS_AVAILABLE_IOS(5_0);
- (instancetype)hd_tableViewCanPerformActionForRowAtIndexPathWithSenderBlock:(BOOL (^)(UITableView *tableView, SEL action, NSIndexPath *indexPath, __nullable id sender))hd_tableViewCanPerformActionForRowAtIndexPathWithSenderBlock NS_AVAILABLE_IOS(5_0);
- (instancetype)hd_tableViewPerformActionForRowAtIndexPathWithSenderBlock:(void (^)(UITableView *tableView, SEL action, NSIndexPath *indexPath, __nullable id sender))hd_tableViewPerformActionForRowAtIndexPathWithSenderBlock NS_AVAILABLE_IOS(5_0);

// Focus

- (instancetype)hd_tableViewCanFocusRowAtIndexPathBlock:(BOOL (^)(UITableView *tableView, NSIndexPath *indexPath))hd_tableViewCanFocusRowAtIndexPathBlock NS_AVAILABLE_IOS(9_0);
- (instancetype)hd_tableViewShouldUpdateFocusInContextBlock:(BOOL (^)(UITableView *tableView, UITableViewFocusUpdateContext *context))hd_tableViewShouldUpdateFocusInContextBlock NS_AVAILABLE_IOS(9_0);
- (instancetype)hd_tableViewDidUpdateFocusInContextWithAnimationCoordinatorBlock:(void (^)(UITableView *tableView, UITableViewFocusUpdateContext *context, UIFocusAnimationCoordinator *coordinator))hd_tableViewDidUpdateFocusInContextWithAnimationCoordinatorBlock NS_AVAILABLE_IOS(9_0);
- (instancetype)hd_indexPathForPreferredFocusedViewInTableViewBlock:(nullable NSIndexPath * (^)(UITableView *tableView))hd_indexPathForPreferredFocusedViewInTableViewBlock NS_AVAILABLE_IOS(9_0);

@end

NS_ASSUME_NONNULL_END
