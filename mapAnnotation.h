//
//  mapAnnotation.h
//  MAPR
//
//  Created by Sean Warren on 4/20/16.
//  Copyright © 2016 Sean Warren. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <MapKit/MapKit.h>

@interface mapAnnotation : NSObject <MKAnnotation>
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (copy, nonatomic) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, assign) MKPinAnnotationView *pinTintColor;



- (id)initWithTitle:(NSString *)newTitle subtitle:(NSString *)newSubtitle Location:(CLLocationCoordinate2D)location;
- (MKPinAnnotationView *) annotationView;


@end

