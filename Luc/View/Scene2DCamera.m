//
//  Scene2DCamera.m
//  Luc
//
//  Created by Milo Heinrich on 29/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "Scene2DCamera.h"

@implementation Scene2DCamera

- (nonnull instancetype)init:(float)width:(float)height
{
    self = [super init];

    self.projectionMatrix = [PerspectiveCamera Perspective:45.0 :width / height :0.1 :1000];
    self.viewMatrix = [[Transform alloc] init];
    [self.viewMatrix setPosition:simd_make_float3(0, 0, -2)];
    
    return self;
}

- (matrix_float4x4)GetViewProjection
{
    matrix_float4x4 result;
    
    result = matrix_multiply(self.projectionMatrix, [self.viewMatrix getMatrix]);
    
    return result;
}

- (void)OnResize:(CGSize)size
{
    float width = size.width;
    float height = size.height;
    
    self.projectionMatrix = [PerspectiveCamera Perspective:45.0 :width / height :0.1 :1000];
}

- (void)Update
{
    
}

@end
