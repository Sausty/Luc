//
//  Mesh.h
//  Luc
//
//  Created by Milo Heinrich on 25/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "VertexBuffer.h"
#import "Transform.h"

@import MetalKit;

@interface Mesh : NSObject

@property VertexBuffer* _Nonnull meshVBO;
@property Transform* _Nonnull transform;

- (nonnull instancetype)init;
- (void)addVertexBuffer:(nonnull VertexBuffer*)vbo;
- (void)render;

- (nonnull Transform*)getTransform;

@end
