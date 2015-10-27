//
//  EXMAMapView+GestureSwizzle.m
//
//  Created by doluvor on 15/10/25.
//  Copyright © 2015年 doluvor. All rights reserved.
//

#import "EXMAMapView+GestureSwizzle.h"
#import "objc/runtime.h"

@implementation EXMAMapView (GestureSwizzle)

+ (void)load
{
    [[self class] swizzleMethod:@"zoomInGesture:"];
    [[self class] swizzleMethod:@"zoomOutGesture:"];
    [[self class] swizzleMethod:@"pinchGesture:"];
    [[self class] swizzleMethod:@"panGesture:"];
    [[self class] swizzleMethod:@"pullGesture:"];
    [[self class] swizzleMethod:@"rotateGesture:"];
    [[self class] swizzleMethod:@"singleTapGesture:"];
}

+ (void)swizzleMethod:(NSString *)methodName {
    
    Method original, swizzled;
    
    original = class_getInstanceMethod(self, NSSelectorFromString(methodName));
    swizzled = class_getInstanceMethod(self, NSSelectorFromString([NSString stringWithFormat:@"swizzled_%@", methodName]));
    
    method_exchangeImplementations(original, swizzled);
}

- (void)swizzled_zoomInGesture:(UITapGestureRecognizer *)zoomInGesture {
    
    if (!self.disableOriginalGesture) {
        [self swizzled_zoomInGesture:zoomInGesture];
    }
    
    if ([self.gestureDelegate respondsToSelector:@selector(mapView:zoomInGesture:)]) {
        [self.gestureDelegate mapView:self zoomInGesture:zoomInGesture];
    }
}

- (void)swizzled_zoomOutGesture:(UITapGestureRecognizer *)zoomOutGesture {
    
    if (!self.disableOriginalGesture) {
        [self swizzled_zoomOutGesture:zoomOutGesture];
    }
    
    if ([self.gestureDelegate respondsToSelector:@selector(mapView:zoomOutGesture:)]) {
        [self.gestureDelegate mapView:self zoomOutGesture:zoomOutGesture];
    }
}

- (void)swizzled_pinchGesture:(UIPinchGestureRecognizer *)pinchGesture {
    
    if ([self.gestureDelegate respondsToSelector:@selector(mapView:pinchGesture:)]) {
        [self.gestureDelegate mapView:self pinchGesture:pinchGesture];
    }
    
    if (!self.disableOriginalGesture) {
        [self swizzled_pinchGesture:pinchGesture];
    }
}

- (void)swizzled_panGesture:(UIPanGestureRecognizer *)panGesture {
    
    if (!self.disableOriginalGesture) {
        [self swizzled_panGesture:panGesture];
    }
    
    if ([self.gestureDelegate respondsToSelector:@selector(mapView:panGesture:)]) {
        [self.gestureDelegate mapView:self panGesture:panGesture];
    }
}

- (void)swizzled_pullGesture:(UIPanGestureRecognizer *)pullGesture {
    
    if (!self.disableOriginalGesture) {
        [self swizzled_pullGesture:pullGesture];
    }
    
    if ([self.gestureDelegate respondsToSelector:@selector(mapView:pullGesture:)]) {
        [self.gestureDelegate mapView:self pullGesture:pullGesture];
    }
}

- (void)swizzled_rotateGesture:(UIRotationGestureRecognizer *)rotateGesture {
    
    if (!self.disableOriginalGesture) {
        [self swizzled_rotateGesture:rotateGesture];
    }
    
    if ([self.gestureDelegate respondsToSelector:@selector(mapView:rotateGesture:)]) {
        [self.gestureDelegate mapView:self rotateGesture:rotateGesture];
    }
}

- (void)swizzled_singleTapGesture:(UITapGestureRecognizer *)singleTapGesture {
    
    if (!self.disableOriginalGesture) {
        [self swizzled_singleTapGesture:singleTapGesture];
    }
    
    if ([self.gestureDelegate respondsToSelector:@selector(mapView:singleTapGesture:)]) {
        [self.gestureDelegate mapView:self singleTapGesture:singleTapGesture];
    }
}

@end
