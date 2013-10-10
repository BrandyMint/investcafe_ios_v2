//
//  ViewController.h
//  JSONExample
//
//  Created by Eugene Romanishin on 23.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SectionManagerDelegate<NSObject>

@optional
- (void) sectionArray:(NSArray*)sectionArray;
@end

@interface SectionManager : NSObject

@property (nonatomic, assign) id <SectionManagerDelegate> delegate;



@end
