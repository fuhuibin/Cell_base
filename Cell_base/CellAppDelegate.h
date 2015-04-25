//
//  CellAppDelegate.h
//  Cell_base
//
//  Created by 付绘彬 on 15-4-24.
//  Copyright (c) 2015年 ___FULLUSERNAME___. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CellAppDelegate : NSObject <NSApplicationDelegate>
{
    
    NSArray *listData ;
    IBOutlet NSTableView *BaseList;

    IBOutlet NSWindow *window;
}
@end
