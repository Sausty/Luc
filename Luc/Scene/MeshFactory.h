//
//  MeshFactory.h
//  Luc
//
//  Created by Milo Heinrich on 26/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "Mesh.h"
#import <simd/simd.h>

typedef struct {
    vector_float3 position;
    vector_float4 color;
} Vertex;

@interface MeshFactory : NSObject

+ (nonnull Mesh*)BuildTriangle:(vector_float3)color;
+ (nonnull Mesh*)BuildQuad:(vector_float3)color;
+ (nonnull Mesh*)BuildRainbowQuad;

@end
