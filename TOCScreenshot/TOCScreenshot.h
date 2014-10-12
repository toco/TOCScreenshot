//
//  TOCScreenshot.h
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

#import <UIKit/UIKit.h>

@interface TOCScreenshot : NSObject

// set to YES to crop the status bar region (when status bar is visible)
+ (void)setCropStatusBar:(BOOL)cropStatusBar;
+ (BOOL)cropStatusBar;

// folder path of the screen shot directory
// default is NSDocumentDirectory
+ (void)setScreenshotGroupFolderPath:(NSString *)groupFolderPath;
+ (NSString *)screenshotGroupFolderPath;

// folder name for screenshots
// defaults is determined by locale, screen size and screen scale
// e.g. en_US-375x667@2x
+ (void)setScreenshotFolderName:(NSString *)folderName;
+ (NSString *)screenshotFolderName;

// take a screen shot and return it as an UIImage
+ (UIImage *)screenshot;
// take a screen shot and save it to screenshotGroupFolderPath/screenshotFolderName/NAME_screenshotFolderName.png
+ (void)takeScreenshotNamed:(NSString *)name;

@end
