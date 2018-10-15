//
//  ViewController.h
//  AnotherAppleMapView
//
//  Created by lab on 10/15/18.
//  Copyright © 2018 com.digicon.www. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Mapkit/Mapkit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate,UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)MKMapView *mapView;
@property(nonatomic,strong)CLLocationManager *locationManager;
@property(nonatomic,strong)UISegmentedControl *segmentUS;
@property(nonatomic,strong)UITableView *tableView;

@property(nonnull,strong)NSMutableArray *array;

@end

