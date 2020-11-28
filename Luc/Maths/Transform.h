//
//  Transform.h
//  Luc
//
//  Created by Milo Heinrich on 28/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <simd/simd.h>

@interface Transform : NSObject

@property vector_float3 TransformPosition;
@property vector_float3 TransformRotation;
@property vector_float3 TransformScale;
@property matrix_float4x4 TransformMatrix;

- (nonnull instancetype)init;

- (void)setPosition:(vector_float3)pos;
- (void)setRotation:(vector_float3)rot:(float)angle;
- (void)setScale:(vector_float3)scale;

- (vector_float3)getPosition;
- (vector_float3)getRotation;
- (vector_float3)getScale;

- (matrix_float4x4)getMatrix;

@end
