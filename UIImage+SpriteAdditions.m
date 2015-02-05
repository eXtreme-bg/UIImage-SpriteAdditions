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
    assert(self);
    assert(!CGSizeEqualToSize(size, CGSizeZero));

    NSMutableArray *sprites = [NSMutableArray array];

    size = CGSizeMake(size.width * kDisplayScaleFactor, size.width * kDisplayScaleFactor);

    CGImageRef spriteSheetRef = self.CGImage;

    CGFloat width = CGImageGetWidth(spriteSheetRef);
    CGFloat height = CGImageGetHeight(spriteSheetRef);

    // Warning: this doesn't works for iPhone 6+ in zoomed mode
    assert(size.height == height);
    assert((int)width % (int)size.width == 0);

    for (NSInteger idx = 0; idx < width / size.width; idx++) {
        CGImageRef spriteRef = CGImageCreateWithImageInRect(spriteSheetRef, CGRectMake(idx * size.width , 0, size.width, size.height));

        [sprites addObject:[UIImage imageWithCGImage:spriteRef scale:kDisplayScaleFactor orientation:UIImageOrientationUp]];
    }

    assert(sprites.count > 0);

    return [sprites copy];
}

@end