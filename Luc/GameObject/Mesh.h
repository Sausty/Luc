//
//  Mesh.h
//  Luc
//
//  Created by Milo Heinrich on 25/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "VertexBuffer.h"

@import MetalKit;

@interface Mesh : NSObject

@property VertexBuffer* meshVBO;

- (nonnull instancetype)init;
- (void)addVertexBuffer:(nonnull VertexBuffer*)vbo;
- (void)render;

@end
