//
//  EXMAMapView.h
//
//  Created by doluvor on 15/10/25.
//  Copyright © 2015年 doluvor. All rights reserved.
//

#import <AMapNaviKit/AMapNaviKit.h>

@class EXMAMapView;

@protocol EXMAMapViewGestureDelegate <NSObject>

@optional
- (void)mapView:(EXMAMapView *)mapView zoomInGesture:(UITapGestureRecognizer *)zoomInGesture;

- (void)mapView:(EXMAMapView *)mapView zoomOutGesture:(UITapGestureRecognizer *)zoomOutGesture;

- (void)mapView:(EXMAMapView *)mapView pinchGesture:(UIPinchGestureRecognizer *)pinchGesture;

- (void)mapView:(EXMAMapView *)mapView panGesture:(UIPanGestureRecognizer *)panGesture;

- (void)mapView:(EXMAMapView *)mapView pullGesture:(UIPanGestureRecognizer *)pullGesture;

- (void)mapView:(EXMAMapView *)mapView rotateGesture:(UIRotationGestureRecognizer *)rotateGesture;

- (void)mapView:(EXMAMapView *)mapView singleTapGesture:(UITapGestureRecognizer *)singleTapGesture;

@end

@interface EXMAMapView : MAMapView

@property (weak, nonatomic) id<EXMAMapViewGestureDelegate> gestureDelegate;

@property (assign, nonatomic) BOOL disableOriginalGesture;

@end
