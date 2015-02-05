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

        UIImage *image = [UIImage imageWithCGImage:spriteRef scale:kDisplayScaleFactor orientation:UIImageOrientationUp];

        [sprites addObject:image];
    }

    assert(sprites.count != 0);

    return [sprites copy];
}

@end