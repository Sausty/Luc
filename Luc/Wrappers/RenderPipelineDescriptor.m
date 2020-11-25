//
//  RenderPipelineState.m
//  Luc
//
//  Created by Milo Heinrich on 25/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "RenderPipelineDescriptor.h"

@implementation RenderPipelineDescriptor

- (nonnull instancetype)initWithShadersAndDescriptor:(nonnull Shader*)vertexShader:(nonnull Shader*)fragmentShader:(nonnull VertexDescriptor*)vertexDescriptor
{
    self = [super init];
    
    self.renderPipelineDescriptor = [[MTLRenderPipelineDescriptor alloc] init];
    self.renderPipelineDescriptor.colorAttachments[0].pixelFormat = MTLPixelFormatBGRA8Unorm;
    self.renderPipelineDescriptor.vertexFunction = [vertexShader metalFunctionWrapper];
    self.renderPipelineDescriptor.fragmentFunction = [fragmentShader metalFunctionWrapper];
    self.renderPipelineDescriptor.vertexDescriptor = [vertexDescriptor vertexDescriptor];
    
    return self;
}

@end
