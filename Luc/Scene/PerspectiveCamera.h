//
//  PerspectiveCamera.h
//  Luc
//
//  Created by Milo Heinrich on 29/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

@import MetalKit;

@interface PerspectiveCamera : NSObject

+ (matrix_float4x4)Perspective:(float)fov:(float)aspectRatio:(float)near:(float)far;

@end
