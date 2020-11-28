//
//  VertexBuffer.m
//  Luc
//
//  Created by Milo Heinrich on 28/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "VertexBuffer.h"
#import "RendererCore.h"

@implementation VertexBuffer

- (nonnull instancetype)init:(nonnull void*)vertices:(NSUInteger)buffSize:(NSUInteger)bufferIndex
{
    self = [super init];
    
    self.bufferSize = buffSize;
    self.bufferHandle = [RendererCore.device newBufferWithBytes:vertices length:buffSize options:NULL];
    
    return self;
}

- (void)bind
{
    //[RendererCore.currentRenderCommandEncoder setVertexBuffer:self.bufferHandle offset:0 atIndex:_bufferIndex];
    [RendererCore.currentRenderCommandEncoder setVertexBuffer:self.bufferHandle offset:0 atIndex:0];
}

@end
