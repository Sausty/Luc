//
//  RenderPipelineState.h
//  Luc
//
//  Created by Milo Heinrich on 25/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "VertexDescriptor.h"
#import "Shader.h"

@import MetalKit;

@interface RenderPipelineDescriptor : NSObject

@property MTLRenderPipelineDescriptor* _Nonnull renderPipelineDescriptor;

- (nonnull instancetype)initWithShadersAndDescriptor:(nonnull Shader*)vertexShader:(nonnull Shader*)fragmentShader:(nonnull VertexDescriptor*)vertexDescriptor;

@end
