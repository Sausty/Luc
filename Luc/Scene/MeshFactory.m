//
//  MeshFactory.m
//  Luc
//
//  Created by Milo Heinrich on 26/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "MeshFactory.h"
#import "RendererCore.h"

@implementation MeshFactory

+ (nonnull Mesh*)BuildTriangle:(vector_float3)color
{
    Mesh* result = [[Mesh alloc] init];
    
    Vertex vertices[] = {
        {{0, 0.5, 0}, {color.x, color.y, color.z, 1}},
        {{-0.5, -0.5, 0}, {color.x, color.y, color.z, 1}},
        {{0.5, -0.5, 0}, {color.x, color.y, color.z, 1}}
    };
    
    result = [result initWithDeviceAndVertices:[RendererCore device] :vertices :sizeof(Vertex) * (sizeof vertices) : (sizeof vertices)];
    
    return result;
}


@end
