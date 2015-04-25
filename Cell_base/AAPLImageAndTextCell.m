/*
 Copyright (C) 2015 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 Subclass of NSTextFieldCell which can display text and an image simultaneously.
 */

#import "AAPLImageAndTextCell.h"

#define kImageOriginXOffset     3
#define kImageOriginYOffset     1

#define kTextOriginXOffset      2
#define kTextOriginYOffset      2
#define kTextHeightAdjust       4


@implementation AAPLImageAndTextCell

// -------------------------------------------------------------------------------
//	initTextCell:aString
// -------------------------------------------------------------------------------
- (id)initTextCell:(NSString *)aString
{
    self = [super initTextCell:aString];
	if (self != nil)
    {
        // we want a smaller font
        [self setFont:[NSFont systemFontOfSize:28]];
    }
	return self;
}

// -------------------------------------------------------------------------------
//	copyWithZone:zone
// -------------------------------------------------------------------------------
- (id)copyWithZone:(NSZone *)zone
{
    
    AAPLImageAndTextCell *cell = (AAPLImageAndTextCell *)[super copyWithZone:zone];
    cell.myImage = self.myImage;
    return cell;
}


// -------------------------------------------------------------------------------
//	drawWithFrame:cellFrame:controlView
// -------------------------------------------------------------------------------
- (void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView
{
    NSRect newCellFrame = cellFrame;
//    self.myImage = [NSImage imageNamed:@"1"];
    if (self.myImage != nil)
    {
        NSSize imageSize;
        NSRect imageFrame;
        
        imageSize = [self.myImage size];
        NSDivideRect(newCellFrame, &imageFrame, &newCellFrame, imageSize.width, NSMinXEdge);
        if ([self drawsBackground])
        {
            [[self backgroundColor] set];
            NSRectFill(imageFrame);
        }
        
        imageFrame.origin.y += 2;
        imageFrame.size = imageSize;
        
        [self.myImage drawInRect:imageFrame
                      fromRect:NSZeroRect
                     operation:NSCompositeSourceOver
                      fraction:1.0
                respectFlipped:YES
                         hints:nil];
    }
    
    [super drawWithFrame:newCellFrame inView:controlView];
}


//- (void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView
//{
//    //选中高亮色这种只能改变某个Cell的背景色不能整行改变
//    if ([self isHighlighted]) {
//        [self highlightColorWithFrame:cellFrame inView:controlView];
//    }
//
//    NSColor* primaryColor   = [self isHighlighted] ? [NSColor alternateSelectedControlTextColor] : [NSColor textColor];
//
//    NSDictionary* primaryTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys: primaryColor, NSForegroundColorAttributeName,
//                                           [NSFont systemFontOfSize:13], NSFontAttributeName, nil];
//    NSMutableAttributedString *string = [[[NSMutableAttributedString alloc]initWithString:@"hello world" attributes:primaryTextAttributes]autorelease];
//    [string setAttributes:@{NSForegroundColorAttributeName:[NSColor redColor]} range:NSMakeRange(0, 5)];
//    //[string drawAtPoint:NSMakePoint(cellFrame.origin.x+cellFrame.size.height+10, cellFrame.origin.y+20)];
//    //用下面这个可以使用省略属性
//
//    NSMutableParagraphStyle *ps = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
//    [ps setLineBreakMode:NSLineBreakByTruncatingTail];
//    NSRange range = NSMakeRange(0, [string length]);
//    [string addAttribute:NSParagraphStyleAttributeName value:ps range:range];
//    [ps release];
//    [string drawInRect:NSMakeRect(cellFrame.origin.x+cellFrame.size.height+15, cellFrame.origin.y+10,40,15)];
//
//    NSImage *icon = [NSImage imageNamed:@"1"];
//
//    //icon = [self roundCorners:icon];圆形
//
//    //这句很重要，如果没有Y轴的移偏，看到的只有第一行有头像
//    float yOffset = cellFrame.origin.y;
//
//    [icon drawInRect:NSMakeRect(cellFrame.origin.x+5,yOffset + 3,cellFrame.size.height-6, cellFrame.size.height-6)
//            fromRect:NSMakeRect(0,0,[icon size].width, [icon size].height)
//           operation:NSCompositeSourceOver
//            fraction:1.0 respectFlipped:YES hints:nil];
//}
//


@end

