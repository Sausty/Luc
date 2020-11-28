//
//  Transform.m
//  Luc
//
//  Created by Milo Heinrich on 28/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "Transform.h"

@implementation Transform
{
    float _angle;
}

- (nonnull instancetype)init
{
    self = [super init];
    
    self.TransformPosition = vector3(0.0f, 0.0f, 0.0f);
    self.TransformRotation = vector3(0.0f, 0.0f, 0.0f);
    self.TransformScale = vector3(1.0f, 1.0f, 1.0f);
    self.TransformMatrix = matrix_identity_float4x4;
    
    return self;
}

- (void)setPosition:(vector_float3)pos
{
    self.TransformPosition = pos;
}

- (void)setRotation:(vector_float3)rot:(float)angle
{
    self.TransformRotation = rot;
    _angle = angle;
}

- (void)setScale:(vector_float3)scale
{
    self.TransformScale = scale;
}

- (vector_float3)getPosition { return _TransformPosition; }
- (vector_float3)getRotation { return _TransformRotation; }
- (vector_float3)getScale    { return _TransformScale;    }

- (matrix_float4x4)getMatrix
{
    matrix_float4x4 result = matrix_identity_float4x4;
    
    // Process position
    matrix_float4x4 transformResult = matrix_identity_float4x4;
    float x = self.TransformPosition.x;
    float y = self.TransformPosition.y;
    float z = self.TransformPosition.z;
    transformResult.columns[0] = simd_make_float4(1, 0, 0, 0);
    transformResult.columns[1] = simd_make_float4(0, 1, 0, 0);
    transformResult.columns[2] = simd_make_float4(0, 0, 1, 0);
    transformResult.columns[3] = simd_make_float4(x, y, z, 1);
    
    // Process scale
    matrix_float4x4 scaleResult = matrix_identity_float4x4;
    float scaleX = self.TransformScale.x;
    float scaleY = self.TransformScale.y;
    float scaleZ = self.TransformScale.z;
    scaleResult.columns[0] = simd_make_float4(scaleX, 0, 0, 0);
    scaleResult.columns[1] = simd_make_float4(0, scaleY, 0, 0);
    scaleResult.columns[2] = simd_make_float4(0, 0, scaleZ, 0);
    scaleResult.columns[3] = simd_make_float4(0, 0, 0, 1);
    
    // Process rotation
    matrix_float4x4 rotResult = matrix_identity_float4x4;
    float rotX = self.TransformRotation.x;
    float rotY = self.TransformRotation.y;
    float rotZ = self.TransformRotation.z;
    
    float c = cos(_angle);
    float s = sin(_angle);
    float mc = (1 - c);
    
    float r1c1 = rotX * rotX * mc + c;
    float r2c1 = rotX * rotY * mc + rotZ * s;
    float r3c1 = rotX * rotZ * mc - rotY * s;
    float r4c1 = 0.0;
    
    float r1c2 = rotY * rotX * mc - rotZ * s;
    float r2c2 = rotY * rotY * mc + c;
    float r3c2 = rotY * rotZ * mc + rotX * s;
    float r4c2 = 0.0;
    
    float r1c3 = rotZ * rotX * mc + rotY * s;
    float r2c3 = rotZ * rotY * mc - rotX * s;
    float r3c3 = rotZ * rotZ * mc + c;
    float r4c3 = 0.0;
    
    float r1c4 = 0.0;
    float r2c4 = 0.0;
    float r3c4 = 0.0;
    float r4c4 = 1.0;
    
    rotResult.columns[0] = simd_make_float4(r1c1, r1c2, r1c3, r1c4);
    rotResult.columns[1] = simd_make_float4(r2c1, r2c2, r2c3, r2c4);
    rotResult.columns[2] = simd_make_float4(r3c1, r3c2, r3c3, r3c4);
    rotResult.columns[3] = simd_make_float4(r4c1, r4c2, r4c3, r4c4);
    
    result = matrix_multiply(result, transformResult);
    result = matrix_multiply(result, scaleResult);
    result = matrix_multiply(result, rotResult);
    return result;
}

@end
