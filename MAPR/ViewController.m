//
//  ViewController.m
//  MAPR
//
//  Created by Sean Warren on 4/18/16.
//  Copyright © 2016 Sean Warren. All rights reserved.
//

#import "ViewController.h"
#import "mapAnnotation.h"
#import "AppDelegate.h"

@interface ViewController () <CLLocationManagerDelegate>
@property (strong, nonatomic) CLLocationManager *locationManager;
@end

@implementation ViewController
@synthesize  coordinate;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mapVIew.delegate = self;
    
    counter = 0;
    
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = 2.0; //user needs to press for 2 seconds
    [self.mapVIew addGestureRecognizer:lpgr];
    
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];

        CLLocationCoordinate2D zoomLocation;
        zoomLocation.latitude = self.locationManager.location.coordinate.latitude;
        zoomLocation.longitude = self.locationManager.location.coordinate.longitude;
    
    
        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
        
    
    [self.mapVIew setRegion:viewRegion animated:YES];

}
- (MKPinAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if([annotation isKindOfClass:[mapAnnotation class]]){
        mapAnnotation *location = (mapAnnotation *) annotation;
        
        MKPinAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"mapAnnotation"];
        
        annotationView.pinTintColor = [UIColor redColor];


        
        if (annotationView == nil)
            annotationView = location.annotationView;
        
        
        else
            annotationView.annotation = annotation;
        
        return annotationView;
    }
    else
        return nil;
    
}
- (void)handleLongPress:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateBegan)
        return;
    
    CGPoint touchPoint = [gestureRecognizer locationInView:self.mapVIew];
    CLLocationCoordinate2D touchMapCoordinate =
    [self.mapVIew convertPoint:touchPoint toCoordinateFromView:self.mapVIew];
    
    //for (id<MKAnnotation> ann in self.mapVIew.selectedAnnotations)
    //{
      //  [self.mapVIew deselectAnnotation:ann animated:NO];
   // }
    
    MKPointAnnotation *annot = [[MKPointAnnotation alloc] init];
    annot.coordinate = touchMapCoordinate;
  
    
   //[annot setTitle:@"Your M.A.P.S Location"];
   // [annot setSubtitle:@"Your First Place"];    //[annot setSubtitle:(@"%@",annot.coordinate.latitude)];

    
    
    if (counter < 1){
        mapAnnotation *newLocation = [[mapAnnotation alloc]initWithTitle:@"Your Activity Location" subtitle:@""
                                                                Location:touchMapCoordinate];
      //newLocation.pinTintColor = ;
                                      
        [self.mapVIew addAnnotation:newLocation];
        
        [self.mapVIew selectAnnotation:newLocation animated:FALSE];
        
        AppDelegate *window2 = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        NSNumber *myDoubleNumber = [NSNumber numberWithDouble:touchMapCoordinate.latitude];
        NSNumber *myDoubleNumber2 = [NSNumber numberWithDouble:touchMapCoordinate.longitude];

        
        NSString *cLat =  [myDoubleNumber stringValue];
        NSString *clong =  [myDoubleNumber2 stringValue];

        window2.latitude = cLat;
        window2.longitute = clong;
        
        
        CLLocationCoordinate2D zoomLocation;
        zoomLocation.latitude = touchMapCoordinate.latitude;
        zoomLocation.longitude = touchMapCoordinate.longitude;
        
        
        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
        
        
        [self.mapVIew setRegion:viewRegion animated:YES];
        

    counter++;
    }
    else{
        NSLog(@"PAID VERSION");
          [self addAlertView];
    }
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view
calloutAccessoryControlTapped:(UIControl *)control
{
    [self performSegueWithIdentifier:@"detailView" sender:self];
  

   
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
  //  NSLog(@"Source Controller = %@", [segue sourceViewController]);
   // NSLog(@"Destination Controller = %@", [segue destinationViewController]);
 //   NSLog(@"Segue Identifier = %@", [segue identifier]);

    
    
    if([segue.identifier isEqualToString:@"detailView"])
    {
       // detailView *transferViewController = [segue destinationViewController ];
       
       // transferViewController.coordinates = @"chiicken,Gravy";
   // transferViewController.LDATA2 = @"HEY";

        
     //  transferViewController.LDATA = @"hey";
        
    }

  
}


-(void)addAlertView{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:
                              @"Please purchase M.A.P.S" message:@"With the free version of M.A.P.S you, can only place one location. To get multiple location please purchase our full version." delegate:self
                                             cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    [alertView show];
}


#pragma mark - Alert view delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:
(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            NSLog(@"Cancel button clicked");
            break;
        case 1:
            NSLog(@"OK button clicked");
            break;
            
        default:
            break;
    }
}

// Location Manager Delegate Methods
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
 //   NSLog(@"%@", [locations lastObject]);
}

@end
