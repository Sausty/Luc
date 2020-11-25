//
//  GameView.m
//  Luc
//
//  Created by Milo Heinrich on 25/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "GameView.h"
#import "RendererCore.h"
#include "ShaderLibrary.h"
#include "DefaultShaderClass.h"
#include <simd/simd.h>

typedef struct {
    vector_float3 position;
    vector_float4 color;
} Vertex;

@implementation GameView
{
    RendererCore* engine;
    ShaderLibrary* library;
    
    DefaultVertexShader* vertexShader;
    DefaultFragmentShader* fragmentShader;
    
    id<MTLRenderPipelineState> m_RenderPipelineState;
    
    id<MTLBuffer> m_VertexBuffer;
    MTLVertexDescriptor* m_VertexDescriptor;
}

- (nonnull instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    
    if (self)
    {
        self.device = MTLCreateSystemDefaultDevice();
        
        self.clearColor = MTLClearColorMake(0.1, 0.1, 0.1, 1.0);
        
        self.colorPixelFormat = MTLPixelFormatBGRA8Unorm;
        
        engine = [[RendererCore alloc] InitWithDevice:self.device];
        
        [self createPipelineState];
    }
    
    return self;
}

- (void)createPipelineState
{
    id<MTLLibrary> defaultLibrary = [self.device newDefaultLibrary];
    id<MTLFunction> vertexFunction = [defaultLibrary newFunctionWithName:@"DefaultVertexMain"];
    id<MTLFunction> fragmentFunction = [defaultLibrary newFunctionWithName:@"DefaultFragmentMain"];
    
    m_VertexDescriptor = [[MTLVertexDescriptor alloc] init];
    
    m_VertexDescriptor.attributes[0].format = MTLVertexFormatFloat3;
    m_VertexDescriptor.attributes[0].bufferIndex = 0;
    m_VertexDescriptor.attributes[0].offset = 0;
    
    m_VertexDescriptor.attributes[1].format = MTLVertexFormatFloat4;
    m_VertexDescriptor.attributes[1].bufferIndex = 0;
    m_VertexDescriptor.attributes[1].offset = sizeof(vector_float3);
    
    m_VertexDescriptor.layouts[0].stride = sizeof(Vertex);
    
    library = [[ShaderLibrary alloc] init:self.device];
    vertexShader = [[DefaultVertexShader alloc] init:library.library];
    fragmentShader = [[DefaultFragmentShader alloc] init:library.library];
    
    MTLRenderPipelineDescriptor* descriptor =  [[MTLRenderPipelineDescriptor alloc] init];
    descriptor.colorAttachments[0].pixelFormat = MTLPixelFormatBGRA8Unorm;
    descriptor.vertexFunction = [vertexShader metalFunctionWrapper];
    descriptor.fragmentFunction = [fragmentShader metalFunctionWrapper];
    descriptor.vertexDescriptor = m_VertexDescriptor;
    
    NSError* error;
    m_RenderPipelineState = [self.device newRenderPipelineStateWithDescriptor:descriptor error:&error];
    NSAssert(m_RenderPipelineState, @"Failed to create render pipeline state");
}

- (void)createVertexBuffer
{
    
}

- (void)drawRect:(NSRect)dirtyRect
{
    id<CAMetalDrawable> drawable = self.currentDrawable;
    MTLRenderPassDescriptor* descriptor = self.currentRenderPassDescriptor;

    NSAssert(drawable, @"Nothing to draw!");
    NSAssert(descriptor, @"No current render pass descriptor!");
    
    id<MTLCommandBuffer> commandBuffer = [engine.commandQueue commandBuffer];
    id<MTLRenderCommandEncoder> commandEncoder = [commandBuffer renderCommandEncoderWithDescriptor:descriptor];
    
    Vertex vertices[] = {
        {{0, 1, 0}, {1, 0, 0, 1}},
        {{-1, -1, 0}, {0, 1, 0, 1}},
        {{1, -1, 0}, {0, 0, 1, 1}}
    };
    
    size_t length = (sizeof vertices) / (sizeof vertices[0]);
    m_VertexBuffer = [self.device newBufferWithBytes:vertices length:length * sizeof(Vertex) options:NULL];
    
    [commandEncoder setRenderPipelineState:m_RenderPipelineState];
    
    [commandEncoder setVertexBuffer:m_VertexBuffer offset:0 atIndex:0];
    [commandEncoder drawPrimitives:MTLPrimitiveTypeTriangle vertexStart:0 vertexCount:sizeof(vertices)];
    
    [commandEncoder endEncoding];
    [commandBuffer presentDrawable:drawable];
    [commandBuffer commit];
}

@end
