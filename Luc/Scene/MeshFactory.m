//
//  MeshFactory.m
//  Luc
//
//  Created by Milo Heinrich on 26/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "MeshFactory.h"
#import "RendererCore.h"
#import "VertexBuffer.h"

@implementation MeshFactory

+ (nonnull Mesh*)BuildTriangle:(vector_float3)color
{
    Mesh* result = [[Mesh alloc] init];
    
    Vertex vertices[] = {
        {{0, 0.5, 0}, {color.x, color.y, color.z, 1}},
        {{-0.5, -0.5, 0}, {color.x, color.y, color.z, 1}},
        {{0.5, -0.5, 0}, {color.x, color.y, color.z, 1}}
    };
    
    VertexBuffer* meshBuffer = [[VertexBuffer alloc] init:vertices :(sizeof vertices) * sizeof(Vertex) :0];
    
    result = [result init];
    [result setMeshVBO:meshBuffer];
    
    return result;
}


@end
