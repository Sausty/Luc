//
//  RendererCore.m
//  Luc
//
//  Created by Milo Heinrich on 25/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "RendererCore.h"

static id<MTLDevice> device;
static id<MTLCommandQueue> commandQueue;
static id<MTLCommandBuffer> currentCommandBuffer;
static id<MTLRenderCommandEncoder> currentRenderCommandEncoder;

@implementation RendererCore

- (nonnull instancetype)InitWithDevice:(id<MTLDevice>)dEvice
{
    device = dEvice;
    commandQueue = [device newCommandQueue];
    
    return self;
}

+ (nonnull id<MTLDevice>)device
{
    return device;
}

+ (nonnull id<MTLCommandQueue>)commandQueue
{
    return commandQueue;
}

+ (void)createCommandBuffer
{
    currentCommandBuffer = [commandQueue commandBuffer];
}

+ (nonnull id<MTLCommandBuffer>)currentCommandBuffer
{
    return currentCommandBuffer;
}

+ (void)createRenderCommandEncoder:(nonnull MTLRenderPassDescriptor*)descriptor
{
    currentRenderCommandEncoder = [currentCommandBuffer renderCommandEncoderWithDescriptor:descriptor];
}

+ (nonnull id<MTLRenderCommandEncoder>)currentRenderCommandEncoder
{
    return currentRenderCommandEncoder;
}

@end
