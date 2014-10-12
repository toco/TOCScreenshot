//
//  TOCViewController.m
//  TOCScreenshot
//
//  Created by Tobias Conradi on 10/12/2014.
//  Copyright (c) 2014 Tobias Conradi. All rights reserved.
//

#import "TOCViewController.h"
#import <TOCScreenshot/TOCScreenshot.h>

@interface TOCViewController ()
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@end

@implementation TOCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setupDateFormatter];
	[TOCScreenshot setScreenshotGroupFolderPath:SCREENSHOT_DIR];
}


- (IBAction)setCropStatusBar:(UISwitch *)sender {
	[TOCScreenshot setCropStatusBar:sender.isOn];
}

- (IBAction)updateScreenshot:(id)sender {
	self.imageView.image = [TOCScreenshot screenshot];
}

- (IBAction)saveScreenshot:(UIButton *)sender {
	NSString *screenshotName = [self.dateFormatter stringFromDate:[NSDate date]];
	[TOCScreenshot takeScreenshotNamed:screenshotName];
}


- (void)setupDateFormatter {
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"Y-MM-d_HH-mm-ss-SSS"];
	self.dateFormatter = dateFormatter;
}
@end
