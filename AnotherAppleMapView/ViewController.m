//
//  ViewController.m
//  AnotherAppleMapView
//
//  Created by lab on 10/15/18.
//  Copyright © 2018 com.digicon.www. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self annotations];
    [self segmentedControlCreate];
    [self mapViewCreate];
    [self tableViewCreate];
    [self setUpLocation];
    
}

-(void) annotations{
    
    if(self.array==nil){
        
        self.array = [NSMutableArray array];
    }
    MKPointAnnotation *point0 = [[MKPointAnnotation alloc]init];
    point0.coordinate = CLLocationCoordinate2DMake(23.8103, 90.4125);
    point0.title = @"Dhaka";
    point0.subtitle = @"Capital City";
    [self.array addObject:point0];
    
    MKPointAnnotation *point1 = [[MKPointAnnotation alloc]init];
    point1.coordinate = CLLocationCoordinate2DMake(23.8907, 89.1099);
    point1.title = @"Kushtia";
    point1.subtitle = @"Khulna Division";
    [self.array addObject:point1];
    
    MKPointAnnotation *point2 = [[MKPointAnnotation alloc]init];
    point2.coordinate = CLLocationCoordinate2DMake(22.6602, 89.7895);
    point2.title = @"Bagerhat";
    point2.subtitle = @"Khulna";
    [self.array addObject:point2];
    
    MKPointAnnotation *point3 = [[MKPointAnnotation alloc]init];
    point3.coordinate = CLLocationCoordinate2DMake(24.8949, 91.8687);
    point3.title = @"Sylhet";
    point3.subtitle = @"Tea Gardens";
    [self.array addObject:point3];
    
    MKPointAnnotation *point4 = [[MKPointAnnotation alloc]init];
    point4.coordinate = CLLocationCoordinate2DMake(22.7324, 92.2985);
    point4.title = @"Rangamati";
    point4.subtitle = @"Hills";
    [self.array addObject:point4];
}

-(void) segmentedControlCreate{
    
    self.segmentUS = [[UISegmentedControl alloc]initWithItems:@[@"Map",@"List"]];
    [self.segmentUS setSelectedSegmentIndex:0];
    [self.segmentUS addTarget:self action:@selector(switchOverViews:) forControlEvents:(UIControlEventValueChanged)];
    self.segmentUS.selectedSegmentIndex=0;
    self.navigationItem.titleView = self.segmentUS;
}

-(void) mapViewCreate{
    
    self.mapView = [[MKMapView alloc]initWithFrame:self.view.frame];
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    self.mapView.mapType = MKMapTypeSatelliteFlyover;
    __weak ViewController *weakSelf = self;
    [self.array enumerateObjectsUsingBlock:^(MKPointAnnotation *_Nonnull point, NSUInteger idx, BOOL * _Nonnull stop) {
        [weakSelf.mapView addAnnotation:point];
    }];
    [self.view addSubview:self.mapView];
}

-(void) tableViewCreate{
    
    CGRect rect = [UIScreen mainScreen].bounds;
    self.tableView = [[UITableView alloc]initWithFrame:rect style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

-(void) setUpLocation{
    
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.delegate = self;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
}

-(void) switchOverViews:(UISegmentedControl*)paramSender{
    
    self.mapView.hidden = YES;
    self.tableView.hidden = YES;
    
    switch (paramSender.selectedSegmentIndex) {
        case 0:
            self.mapView.hidden = NO;
            self.tableView.hidden = YES;
            break;
            
        case 1:
            self.mapView.hidden = YES;
            self.tableView.hidden = NO;
            break;
            
        default:
            break;
    }
}

-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    
}

-(void) locationManager:(CLLocationManager *)manager didFinishDeferredUpdatesWithError:(NSError *)error{
    
    
}

-(void) mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 400000, 400000);
    [mapView setRegion:[mapView regionThatFits:region] animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"sampleIdentifier";
    UITableViewCell *cell = (UITableViewCell*) [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell==nil){
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = @"Nabab Khan";
    return cell;
}

@end
