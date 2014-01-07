//
//  DPCalendarMonthlyCell.m
//  DPCalendar
//
//  Created by Ethan Fang on 23/12/13.
//  Copyright (c) 2013 Ethan Fang. All rights reserved.
//

#import "DPCalendarMonthlyCell.h"

void DPContextDrawLine(CGContextRef c, CGPoint start, CGPoint end, CGColorRef color, CGFloat lineWidth) {
    CGContextSetAllowsAntialiasing(c, false);
    CGContextSetStrokeColorWithColor(c, color);
    CGContextSetLineWidth(c, lineWidth);
    CGContextMoveToPoint(c, start.x, start.y - (lineWidth/2.f));
    CGContextAddLineToPoint(c, end.x, end.y - (lineWidth/2.f));
    CGContextStrokePath(c);
    CGContextSetAllowsAntialiasing(c, true);
}

@implementation DPCalendarMonthlyCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
//        self.selectedBackgroundView = [UIView new];
//        self.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:224/255.0f green:242/255.0f blue:1 alpha:1];
    }
    return self;
}

-(void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorRef separatorColor = self.separatorColor.CGColor;
    
    CGFloat pixel = 1.f / [UIScreen mainScreen].scale;
    DPContextDrawLine(context,
                      CGPointMake(0.f, self.bounds.size.height),
                      CGPointMake(self.bounds.size.width, self.bounds.size.height),
                      separatorColor,
                      pixel);
}

- (void) drawCellWithColor:(UIColor *)color InRect: (CGRect)rect context: (CGContextRef)context{
    CGContextSaveGState(context);
    CGContextBeginPath(context);
    [color setFill];
    CGContextFillRect(context, rect);
    CGContextRestoreGState(context);
}


@end
