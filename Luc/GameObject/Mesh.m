//
//  Mesh.m
//  Luc
//
//  Created by Milo Heinrich on 25/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "Mesh.h"

@implementation Mesh

- (nonnull instancetype)initWithDeviceAndVertices:(nonnull id<MTLDevice>)device:(nonnull void*)vertices:(NSUInteger)size:(NSUInteger)buffSize;
{
    self = [super init];
    
    self.bufferSize = buffSize;
    self.vertexBuffer = [device newBufferWithBytes:vertices length:size options:NULL];

    return self;
}

- (void)render:(nonnull id<MTLRenderCommandEncoder>)encoder
{
    [encoder setVertexBuffer:self.vertexBuffer offset:0 atIndex:0];
    [encoder drawPrimitives:MTLPrimitiveTypeTriangle vertexStart:0 vertexCount:self.bufferSize];
}

@end
