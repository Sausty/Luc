//
//  GameView.m
//  Luc
//
//  Created by Milo Heinrich on 25/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "GameView.h"
#import "RendererCore.h"
#import "ShaderLibrary.h"
#import "DefaultShaderClass.h"
#import "VertexDescriptor.h"
#import "RenderPipelineDescriptor.h"
#import <simd/simd.h>

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
    
    VertexDescriptor* vertexDescriptor;
    
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
    vertexDescriptor = [[VertexDescriptor alloc] init];
    
    DescriptorData* posData = [DescriptorData alloc];
    posData.format = MTLVertexFormatFloat3;
    posData.bufferIndex = 0;
    posData.offset = 0;
    
    DescriptorData* colorData = [DescriptorData alloc];;
    colorData.format = MTLVertexFormatFloat3;
    colorData.bufferIndex = 0;
    colorData.offset = sizeof(vector_float3);
    
    [vertexDescriptor addAttribute:posData];
    [vertexDescriptor addAttribute:colorData];
    [vertexDescriptor setStride:sizeof(Vertex)];
    [vertexDescriptor initialiseData];
    
    library = [[ShaderLibrary alloc] init:self.device];
    vertexShader = [[DefaultVertexShader alloc] init:library.library];
    fragmentShader = [[DefaultFragmentShader alloc] init:library.library];
    
    RenderPipelineDescriptor* descriptor = [[RenderPipelineDescriptor alloc] initWithShadersAndDescriptor:vertexShader :fragmentShader :vertexDescriptor];
    
    NSError* error;
    m_RenderPipelineState = [self.device newRenderPipelineStateWithDescriptor:[descriptor renderPipelineDescriptor] error:&error];
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
