//
//  detailView.m
//  MAPR
//
//  Created by Sean Warren on 4/20/16.
//  Copyright © 2016 Sean Warren. All rights reserved.
//

#import "detailView.h"
#import "AppDelegate.h"

@interface detailView ()

@end

@implementation detailView

- (void)viewDidLoad {
    [super viewDidLoad];

    AppDelegate *window2 = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSLog(@"The Longitute %@", window2.longitute);
    NSLog(@"The Latitude %@ ", window2.latitude);

  

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
