/*
 * The MIT License (MIT)
 *
 * Copyright (c) 2013-2019 Jeevanandam M.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

//
//  NSMutableAttributedString+MailHeader.m
//  ReplyWithHeader
//
//  Created by Jeevanandam M. on 9/23/13.
//
//

#import "NSMutableAttributedString+MailHeader.h"

@implementation NSMutableAttributedString (MailHeader)

+ (void)trimLeadingWhitespaceAndNewLine:(NSMutableAttributedString *)attString
{
    NSCharacterSet *charSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSRange range = [attString.string rangeOfCharacterFromSet:charSet];
    
    while (range.length != 0 && range.location == 0)
    {
        [attString replaceCharactersInRange:range withString:@""];
        range = [attString.string rangeOfCharacterFromSet:charSet];
    }
}

+ (void)trimTrailingWhitespaceAndNewLine:(NSMutableAttributedString *)attString
{
    NSCharacterSet *charSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSRange range = [attString.string rangeOfCharacterFromSet:charSet
             options:NSBackwardsSearch];
    
    while (range.length != 0 && NSMaxRange(range) == attString.length)
    {
        [attString replaceCharactersInRange:range withString:@""];
        range = [attString.string rangeOfCharacterFromSet:charSet options:NSBackwardsSearch];
    }
}

@end
