//
//  AppDelegate.h
//  MAPR
//
//  Created by Sean Warren on 4/18/16.
//  Copyright © 2016 Sean Warren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : NSObject{
    NSString *latitude;
    NSString *longitute;

}
@property (nonatomic, retain) NSString *latitude;
@property (nonatomic, retain) NSString *longitute;

@property (strong, nonatomic) UIWindow *window;


@end

