//
//  PerspectiveCamera.m
//  Luc
//
//  Created by Milo Heinrich on 29/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "PerspectiveCamera.h"
#import <Foundation/Foundation.h>
#import <simd/simd.h>

@implementation PerspectiveCamera

+ (matrix_float4x4)Perspective:(float)fov:(float)aspectRatio:(float)near:(float)far
{
    float fovRadians = (fov * 3.14159) / 180;
    
    float t = tan(fovRadians / 2);
    
    float x = 1 / (aspectRatio * t);
    float y = 1 / t;
    float z = -((far + near) / (far - near));
    float w = -((2 * far * near) / (far - near));
    
    matrix_float4x4 result = matrix_identity_float4x4;
    
    result.columns[0] = simd_make_float4(x, 0, 0, 0);
    result.columns[1] = simd_make_float4(0, y, 0, 0);
    result.columns[2] = simd_make_float4(0, 0, z, -1);
    result.columns[3] = simd_make_float4(0, 0, w, 0);
    
    return result;
}

@end
