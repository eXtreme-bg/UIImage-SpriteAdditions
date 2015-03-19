//
// UIImage+SpriteAdditions.m
//
// Copyright (c) 2015 Bogdan Kovachev (http://1337.bg)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

#import "UIImage+SpriteAdditions.h"

#define kDisplayScaleFactor [[UIScreen mainScreen] scale]

@implementation UIImage (SpriteAdditions)

- (NSArray *)spritesWithSize:(CGSize)size {
    assert(size.width > 0.0f);
    assert(size.height > 0.0f);

    NSMutableArray *sprites = [NSMutableArray array];

    size = CGSizeMake(size.width * kDisplayScaleFactor, size.width * kDisplayScaleFactor);

    // Workaround for iPhone 6+ in zoomed mode
    if ([UIScreen mainScreen].nativeScale == 3.0f && [UIScreen mainScreen].scale == 2.0f) {
        size = CGSizeMake(size.width * 1.5f, size.width * 1.5f);
    }

    CGImageRef spriteSheetRef = self.CGImage;

    CGFloat width = CGImageGetWidth(spriteSheetRef);
    CGFloat height = CGImageGetHeight(spriteSheetRef);

    assert(size.height == height);
    assert((int)width % (int)size.width == 0);

    for (NSInteger idx = 0; idx < width / size.width; idx++) {
        CGImageRef spriteRef = CGImageCreateWithImageInRect(spriteSheetRef, CGRectMake(idx * size.width , 0, size.width, size.height));

        [sprites addObject:[UIImage imageWithCGImage:spriteRef scale:kDisplayScaleFactor orientation:UIImageOrientationUp]];
    }

    assert(sprites.count > 0);

    return [sprites copy];
}

- (NSArray *)spritesWithSize:(CGSize)size inRange:(NSRange)range {
    assert(size.width > 0.0f);
    assert(size.height > 0.0f);

    assert(range.location >= 0);
    assert(range.length > 0);

    NSMutableArray *sprites = [NSMutableArray array];

    size = CGSizeMake(size.width * kDisplayScaleFactor, size.height * kDisplayScaleFactor);

    // Workaround for iPhone 6+ in zoomed mode
    if ([UIScreen mainScreen].nativeScale == 3.0f && [UIScreen mainScreen].scale == 2.0f) {
        size = CGSizeMake(size.width * 1.5f, size.width * 1.5f);
    }

    CGImageRef spriteSheetRef = self.CGImage;

    CGFloat width = CGImageGetWidth(spriteSheetRef);
    CGFloat height = CGImageGetHeight(spriteSheetRef);

    assert(size.height == height);
    assert((int)width % (int)size.width == 0);

    for (NSInteger idx = range.location; idx < range.length; idx++) {
        CGImageRef spriteRef = CGImageCreateWithImageInRect(spriteSheetRef, CGRectMake(idx * size.width , 0, size.width, size.height));

        [sprites addObject:[UIImage imageWithCGImage:spriteRef scale:kDisplayScaleFactor orientation:UIImageOrientationUp]];
    }

    assert(sprites.count > 0);

    return [sprites copy];
}

@end