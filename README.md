# TOCScreenshot

TOCScreenshot is a simple helper to take screenshots in code. You can optionally crop the status bar region.

In default configuration it saves the screenshots in a folder named with locale, screen size and screen resolution in the application documents directory.
The group path can be changed to e.g. the project source path (see example project).


## Usage

To run the example project, clone the repo, and open TOCScreenshot.xcworkspace from the Example directory first.


To crop the status bar region:

	[TOCScreenshot setCropStatusBar:YES];

To take a screenshot and save it to a file: 

	[TOCScreenshot takeScreenshotNamed:@"ScreenshotName"];

To get a screenshot as a UIImage:

	UIImage *screenshot = [TOCScreenshot screenshot];


![Screenshot1](https://raw.githubusercontent.com/toco/TOCScreenshot/master/Example/Screenshots/en_US-375x667@2x/2014-10-12_18-26-24-181_en_US-375x667@2x.png)

For other configuration options have a look into the [header file](https://github.com/toco/TOCScreenshot/blob/master/TOCScreenshot/TOCScreenshot.h).

## Requirements

- iOS 8

## Installation

### CocoaPods 
TOCScreenshot is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "TOCScreenshot"

### submodules
Add this repository as a submodule then add the two files from the TOCScreenshot folder to your project.

## Author

Tobias Conradi

## License

TOCScreenshot is available under the MIT license. See the LICENSE file for more info.

