//
//  LabelBlog.m
//  PersonalCapitalBlog
//
//  Created by Shashi Kant on 12/7/19.
//  Copyright © 2019 Shashi Kant. All rights reserved.
//

#import "LabelBlog.h"

@implementation LabelBlog
- (NSArray*)splitTextToLines:(NSUInteger)maxLines {
    float width = self.frame.size.width;

    NSArray* blogWords = [self.text componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSMutableArray* lines = [NSMutableArray array];

    NSMutableString* buffer = [NSMutableString string];
    NSMutableString* currentLine = [NSMutableString string];

    for (NSString* word in blogWords) {
        if ([buffer length] > 0) {
            [buffer appendString:@" "];
        }

        [buffer appendString:word];

        if (maxLines > 0 && [lines count] == maxLines - 1) {
            [currentLine setString:buffer];
            continue;
        }
        
        float bufferWidth = [buffer sizeWithAttributes:
                             @{
                             NSFontAttributeName: self.font,
                             }
                             ].width;

        if (bufferWidth < width) {
            [currentLine setString:buffer];
        }
        else {
            [lines addObject:[NSString stringWithString:currentLine]];

            [buffer setString:word];
            [currentLine setString:buffer];
        }
    }

    if ([currentLine length] > 0) {
        [lines addObject:[NSString stringWithString:currentLine]];
    }

    return lines;
}

- (void)drawRect:(CGRect)rect {
    if ([self.text length] == 0) {
        return;
    }

    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, self.textColor.CGColor);
    CGContextSetShadowWithColor(context, self.shadowOffset, 0.0f, self.shadowColor.CGColor);

    NSArray* lines = [self splitTextToLines:self.numberOfLines];
    NSUInteger numLines = [lines count];

    CGSize size = self.frame.size;
    CGPoint origin = CGPointMake(0.0f, 0.0f);

    for (NSUInteger i = 0; i < numLines; i++) {
        NSString* line = [lines objectAtIndex:i];

        if (i == numLines - 1) {
            [line drawAtPoint:origin forWidth:size.width withFont:self.font lineBreakMode:UILineBreakModeTailTruncation];
        }
        else {
            
            NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
                       [style setLineBreakMode:NSLineBreakByClipping];
                        [line drawAtPoint:origin withAttributes:
                         @{
                         NSFontAttributeName: self.font,
                         NSParagraphStyleAttributeName: style
                         }
                         ];
        
        }

        origin.y += self.font.lineHeight;

        if (origin.y >= size.height) {
            return;
        }
    }
}

@end
