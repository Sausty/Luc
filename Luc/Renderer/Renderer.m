//
//  Renderer.m
//  Luc
//
//  Created by Milo Heinrich on 25/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "Renderer.h"
#import "RendererCore.h"

#include "Mesh.h"

@implementation Renderer

- (void)setActiveScene:(nonnull Scene*)scene
{
    self.activeRendererScene = scene;
}

- (void)mtkView:(MTKView *)view drawableSizeWillChange:(CGSize)size
{
    // Handle resizing
}

- (void)drawInMTKView:(MTKView *)view
{
    id<CAMetalDrawable> drawable = view.currentDrawable;
    MTLRenderPassDescriptor* descriptor = view.currentRenderPassDescriptor;

    NSAssert(drawable, @"Nothing to draw!");
    NSAssert(descriptor, @"No current render pass descriptor!");
    
    [RendererCore createCommandBuffer];
    [RendererCore createRenderCommandEncoder:descriptor];

    [_activeRendererScene render];
    
    [RendererCore.currentRenderCommandEncoder endEncoding];
    [RendererCore.currentCommandBuffer presentDrawable:drawable];
    [RendererCore.currentCommandBuffer commit];
}

@end
