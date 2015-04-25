//
//  CellAppDelegate.m
//  Cell_base
//
//  Created by 付绘彬 on 15-4-24.
//  Copyright (c) 2015年 ___FULLUSERNAME___. All rights reserved.
//

#import "CellAppDelegate.h"
#import "AAPLImageAndTextCell.h"
#import "Celltest.h"
@implementation CellAppDelegate

-(id)init{
    self = [super init];
    if(self){
       NSString *number1 = @"12345";
       NSString *string1 = @"123344";
       listData = [[NSArray alloc]initWithObjects:number1,string1, nil];}
    return self;
}

-(void)dealloc{
    [super dealloc];
}


-(void)awakeFromNib{
    
// 
//     BaseList = [[NSTableView alloc] initWithFrame:NSMakeRect(0, 0, 544, 540)];
//    // create tableview style
//    //设置水平，坚直线
//  [BaseList setGridStyleMask:NSTableViewSolidVerticalGridLineMask | NSTableViewSolidHorizontalGridLineMask];
//    //线条色
 //  [BaseList setGridColor:[NSColor redColor]];
//    //设置背景色
//   [BaseList setBackgroundColor:[NSColor greenColor]];
//    //设置每个cell的换行模式，显不下时用...
//  //  [[BaseList cell]setLineBreakMode:NSLineBreakByTruncatingTail];
// //   [[BaseList cell]setTruncatesLastVisibleLine:YES];
//    
//   // [BaseList sizeLastColumnToFit];
//    [BaseList setColumnAutoresizingStyle:NSTableViewUniformColumnAutoresizingStyle];
//    
//    //[tableView setAllowsTypeSelect:YES];
//    //设置允许多选
 //   [BaseList setAllowsMultipleSelection:YES];
//    
//    //[BaseList setAllowsExpansionToolTips:YES];
//  //  [BaseList setAllowsEmptySelection:YES];
//  //  [BaseList setAllowsColumnSelection:YES];
// //   [BaseList setAllowsColumnResizing:YES];
// //   [BaseList setAllowsColumnReordering:YES];
//    //双击
     [BaseList setDoubleAction:@selector(ontableviewrowdoubleClicked)];
////    [tableView setAction:@selector(ontablerowclicked:)];
//    
//    //选中高亮色模式
//    //显示背景色
//  [BaseList setSelectionHighlightStyle:NSTableViewSelectionHighlightStyleRegular];
//    //会把背景色去掉
//    //[tableView setSelectionHighlightStyle:NSTableViewSelectionHighlightStyleSourceList];
//    //NSTableViewSelectionHighlightStyleNone
//    
//    //不需要列表头
//    //[tableView setHeaderView:nil];
//    //使用隐藏的效果会出现表头的高度
//    //[tableView.headerView setHidden:YES];
//    
//    // create columns for our table
//    NSTableColumn * column1 = [[NSTableColumn alloc] initWithIdentifier:@"col1"];
//    [column1.headerCell setTitle:@"第一列"];
//    //[column1 setResizingMask:NSTableColumnAutoresizingMask];
////    
////    NSTableColumn * column2 = [[NSTableColumn alloc] initWithIdentifier:@"col2"];
////    [column2.headerCell setTitle:@"第二列"];
////    //[column2 setResizingMask:NSTableColumnAutoresizingMask];
////    
//    [column1 setWidth:250];
////    [column2 setWidth:250];
//    
//    // generally you want to add at least one column to the table view.
//    [BaseList addTableColumn:column1];
// //   [tableView addTableColumn:column2];
////    [BaseList reloadData];
}
-(void)ontableviewrowdoubleClicked{
    NSRunAlertPanel(@"my son", @"this is my son", @"ok", @"cancle", nil);
}
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row
  {
    NSImage *image = [NSImage imageNamed:@"1"];
// //   NSTableColumn *column = [[tableView tableColumns] objectAtIndex:0];
//    NSCell *dycell = [tableView preparedCellAtColumn:0 row:row];
//    NSRect cellBounds = NSZeroRect;
//    cellBounds.size.width = [image size].width;
//    cellBounds.size.height = [image size].height;
//    NSSize cellSize = [dycell cellSizeForBounds:cellBounds];
    return [image size].height+5;
  }

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return listData.count;
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
  //  if ([tableColumn.identifier isEqualToString:@"col1"]) {
    
     NSString *str = [listData objectAtIndex:row];
     return str;
 //   }
   // return nil;
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification{
    if([BaseList selectedRowIndexes].count==1){
        NSString *str = [listData objectAtIndex:[BaseList selectedRow]];
        NSLog(@"one row is selected: %@",str);
    }
}



//we use this method to display our image.or we can display our image by add the image in AAPLImageAndTextCell.m. then this willdisplay method no need to be used.

- (void)tableView:(NSTableView *)tableView willDisplayCell:(id)cell forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    
    AAPLImageAndTextCell *imageAndTextCell = (AAPLImageAndTextCell *)cell;
    // Set the image here since the value returned from outlineView:objectValueForTableColumn:... didn't specify the image part...
    imageAndTextCell.myImage = [NSImage imageNamed:@"1"];

}



- (NSCell *)tableView:(NSTableView *)tableView dataCellForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    
    AAPLImageAndTextCell *dycell = [[AAPLImageAndTextCell alloc]init];
    return dycell;
            //一定要写判断条件，原来只有一个else 显示的不对，不写的话永远不会进第一列
//       else if ([tableColumn.identifier isEqualToString:@"col2"])
//       {
//           FSCell *customCell = [[[FSCell alloc]init]autorelease];
//    //
//    //        [customCell setSelectionBKColor:[NSColor lightGrayColor]];
//    //        [customCell setSelectionFontColor:[NSColor redColor]];
//    //        return customCell;
//    //    }
    return nil;
}

/*==========================================================================================
 *    设置某行是否可以被选中，返回YES,则可以选中，返回NO 则不可选中，即没有高亮选中
 *    用于控制某一行是否可以被选中，前提是selectionShouldChangeInTableView:必须返回YES
 *===========================================================================================*/
- (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row
{
    if (row == 1)
    {
        return NO;
    }
    
    return YES;
}
/*==================================================================================
1。让tableView支持mouseMove事件。
2。想办法把mouseMove事件中的鼠标坐标点转换为tableView对应的行和列。
先解决第一点，要想有mouseＭove事件，先得让tableView有焦点。有时候自己手工创建的tableView 由于窗口上有好多View而使得tableView当前不在焦点上，因此可以借住第一响就这个方式来使之成为第一响应。
 
 * Returns the column index at 'point', or -1 if 'point' is outside of all table columns.

- (NSInteger)columnAtPoint:(NSPoint)point;

- (NSInteger)rowAtPoint:(NSPoint)point;
 但注意这里的point，与鼠标的坐标不同，鼠标是相对于screen的，需要转换到app上来，怎么转？
 NSPoint p = [self convertPoint:[theEvent locationInWindow] fromView:nil];
*==================================================================================*/

- (void)focus:(NSWindow *) owner
{
    [owner makeFirstResponder:BaseList];
    [BaseList.window setAcceptsMouseMovedEvents:YES];
}




@end


