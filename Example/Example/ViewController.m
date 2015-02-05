//
// ViewController.m
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

#import "ViewController.h"
#import "UIImage+SpriteAdditions.h"

@interface ViewController () {
    // User interface
    __weak IBOutlet UIImageView *animatedImageView;
}

@end

@implementation ViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    // Create the array with sprites from sprite sheet image
    NSArray *sprites = [[UIImage imageNamed:@"SpriteSheet"] spritesWithSize:CGSizeMake(64.0f, 64.0f)];

    // Set the images
    animatedImageView.image = [sprites firstObject];
    animatedImageView.animationImages = sprites;

    // Setup animation
    animatedImageView.animationImages = sprites;
    animatedImageView.animationDuration = 1.0f;
    animatedImageView.animationRepeatCount = 3;
}

#pragma mark - IB Actions

- (IBAction)startAnimationButtonPressed:(id)sender {
    if (animatedImageView.isAnimating) {
        return;
    }

    [animatedImageView startAnimating];
}

- (IBAction)stopAnimationButtonPressed:(id)sender {
    if (!animatedImageView.isAnimating) {
        return;
    }

    [animatedImageView stopAnimating];
}

@end