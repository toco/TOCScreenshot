//
//  TOCScreenshot.m
//
//  Copyright (c) 2014 Tobias Conradi
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "TOCScreenshot.h"

static BOOL TOCCropStatusBar = NO;
static NSString *TOCScreenshotGroupFolderPath = nil;
static NSString *TOCScreenshotFolderName = nil;

@implementation TOCScreenshot

+ (void)setCropStatusBar:(BOOL)cropStatusBar
{
    TOCCropStatusBar = cropStatusBar;
}
+ (BOOL)cropStatusBar
{
    return TOCCropStatusBar;
}

+ (void)setScreenshotGroupFolderPath:(NSString *)groupFolderPath
{
    TOCScreenshotGroupFolderPath = groupFolderPath;
}
+ (NSString *)screenshotGroupFolderPath
{
    if (!TOCScreenshotGroupFolderPath) {
        TOCScreenshotGroupFolderPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    }
    return TOCScreenshotGroupFolderPath;
}

+ (void)setScreenshotFolderName:(NSString *)folderName
{
    TOCScreenshotFolderName = folderName;
}
+ (NSString *)screenshotFolderName {
    if (!TOCScreenshotFolderName) {
        TOCScreenshotFolderName = [self automaticScreenshotFolderName];
    }
    return TOCScreenshotFolderName;
}

+ (NSString *)automaticScreenshotFolderName
{
    NSString *localeString = [NSLocale currentLocale].localeIdentifier;
    CGSize screenSize = [UIScreen mainScreen].fixedCoordinateSpace.bounds.size;
    CGFloat scale = [UIScreen mainScreen].scale;
    // DE_de-320x640-@2x
    NSString *folderName = [NSString stringWithFormat:@"%@-%.0fx%.0f",localeString,screenSize.width,screenSize.height];
    if (scale > 1.0)
    {
        folderName = [folderName stringByAppendingFormat:@"@%.0fx",scale];
    }
    return folderName;
}

+ (NSString *)fullScreenshotPath
{
    return [[self screenshotGroupFolderPath] stringByAppendingPathComponent:[self screenshotFolderName]];
}


+ (UIImage *)screenshot
{
    
    CGFloat topInset = 0;
    CGSize imageSize = [UIScreen mainScreen].bounds.size;
	
    if ([self cropStatusBar]) {
        const CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
        topInset =  MIN(CGRectGetMaxX(statusBarFrame), CGRectGetMaxY(statusBarFrame));
        imageSize.height -= topInset;
    }
    
    UIView *view = [[UIScreen mainScreen] snapshotViewAfterScreenUpdates:NO];
    
    UIGraphicsBeginImageContextWithOptions(imageSize, YES, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 0, -topInset);
    
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:YES];
    
    CGContextRestoreGState(context);
    
    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snapshotImage;
}

+ (void)takeScreenshotNamed:(NSString *)name
{
    NSParameterAssert(name);
    
    NSString *fileName = [name stringByAppendingFormat:@"_%@.png",[self screenshotFolderName]];
    NSString *filePath = [[self fullScreenshotPath] stringByAppendingPathComponent:fileName];
    [self createDirectoryIfNeeded];
    
    UIImage *screenshot = [self screenshot];
    NSData *screenshotData = UIImagePNGRepresentation(screenshot);
	
	NSError *error;
	if (![screenshotData writeToFile:filePath options:NSDataWritingAtomic error:&error]) {
		NSLog(@"%s failed to write screenshot with error %@",__PRETTY_FUNCTION__,error);
	}
}

+ (void)createDirectoryIfNeeded
{
    NSString *path = [self fullScreenshotPath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
}

@end
