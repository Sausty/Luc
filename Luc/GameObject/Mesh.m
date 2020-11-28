//
//  Mesh.m
//  Luc
//
//  Created by Milo Heinrich on 25/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "Mesh.h"
#import "RendererCore.h"

@implementation Mesh

- (nonnull instancetype)init
{
    self = [super init];
    
    _transform = [[Transform alloc] init];
    
    return self;
}

- (void)addVertexBuffer:(nonnull VertexBuffer*)vbo
{
    self.meshVBO = vbo;
}

- (void)render;
{
    [_meshVBO bind];
    matrix_float4x4 transform = [_transform getMatrix];
    [RendererCore.currentRenderCommandEncoder setVertexBytes:&transform length:sizeof(_transform.TransformMatrix) atIndex:1];
    [RendererCore.currentRenderCommandEncoder drawPrimitives:MTLPrimitiveTypeTriangle vertexStart:0 vertexCount:self.meshVBO.bufferSize];
}

- (nonnull Transform*)getTransform
{
    return _transform;
}

@end
