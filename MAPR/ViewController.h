//
//  ViewController.h
//  MAPR
//
//  Created by Sean Warren on 4/18/16.
//  Copyright © 2016 Sean Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "detailView.h"

#define METERS_PER_MILE 1609.344
int counter;


@interface ViewController : UIViewController <UIAlertViewDelegate, MKMapViewDelegate, MKAnnotation>

@property (strong, nonatomic) IBOutlet MKMapView *mapVIew;

@end

