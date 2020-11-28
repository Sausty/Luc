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
    
    return self;
}

- (void)addVertexBuffer:(nonnull VertexBuffer*)vbo
{
    self.meshVBO = vbo;
}

- (void)render;
{
    [_meshVBO bind];
    [RendererCore.currentRenderCommandEncoder drawPrimitives:MTLPrimitiveTypeTriangle vertexStart:0 vertexCount:self.meshVBO.bufferSize];
}

@end
