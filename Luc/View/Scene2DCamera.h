//
//  Scene2DCamera.h
//  Luc
//
//  Created by Milo Heinrich on 29/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "SceneCamera.h"

@interface Scene2DCamera : SceneCamera

- (nonnull instancetype)init:(float)width:(float)height;
- (matrix_float4x4)GetViewProjection;
- (void)OnResize:(CGSize)size;
- (void)Update;

@end
