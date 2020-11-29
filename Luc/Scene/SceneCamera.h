//
//  SceneCamera.h
//  Luc
//
//  Created by Milo Heinrich on 29/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "PerspectiveCamera.h"
#import "Transform.h"

@interface SceneCamera : NSObject

@property matrix_float4x4 projectionMatrix;
@property Transform* _Nonnull viewMatrix;

- (nonnull instancetype)init;

@end
