//
//  mapAnnotation.m
//  MAPR
//
//  Created by Sean Warren on 4/20/16.
//  Copyright © 2016 Sean Warren. All rights reserved.
//

#import "mapAnnotation.h"

@implementation mapAnnotation

- (id)initWithTitle:(NSString *)newTitle subtitle:(NSString *)newSubtitle Location:(CLLocationCoordinate2D)location
{
    self = [super init];
    if(self)
    {
        _title = newTitle;
        _coordinate = location;
    }
    return self;
}

- (MKPinAnnotationView *) annotationView
{
    MKPinAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:self reuseIdentifier:@"mapAnnotation"];
        
    annotationView.enabled = YES;
    annotationView.canShowCallout = YES;
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    //NSLog(@"im being called");
    
    
    return annotationView;

}


@end





