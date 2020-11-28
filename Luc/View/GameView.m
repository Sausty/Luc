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
#import "RenderPipelineState.h"
#import "Mesh.h"
#import "Renderer.h"
#import "MeshFactory.h"
#import "Scene.h"
#import <simd/simd.h>

@implementation GameView
{
    RendererCore* engine;
    Renderer* renderer;
    
    Scene* defaultScene;
    
    ShaderLibrary* library;
    DefaultVertexShader* vertexShader;
    DefaultFragmentShader* fragmentShader;
    
    VertexDescriptor* vertexDescriptor;
    RenderPipelineState* renderPipelineState;
    
    Mesh* triangleMesh;
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
        renderer = [[Renderer alloc] init];
        
        self.delegate = renderer;
        
        [self createPipelineState];
        [self createVertexBuffer];
        [self createDefaultScene];
        
        [renderer setActiveScene:defaultScene];
        
    }
    
    return self;
}

- (void)createDefaultScene
{
    defaultScene = [[Scene alloc] init];
    [defaultScene addGameObject:triangleMesh];
    [defaultScene setRenderPipelineState:renderPipelineState];
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
    
    renderPipelineState = [[RenderPipelineState alloc] initWithDeviceAndDescriptor:self.device :descriptor];
}

- (void)createVertexBuffer
{
    vector_float3 color = {1, 0, 1};
    triangleMesh = [MeshFactory BuildTriangle:color];
}

@end
