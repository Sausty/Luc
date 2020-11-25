//
//  DefaultShaderClass.m
//  Luc
//
//  Created by Milo Heinrich on 25/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "DefaultShaderClass.h"

@implementation DefaultVertexShader

- (nonnull instancetype)init:(nonnull id<MTLLibrary>)library
{
    self = [super init];
    
    self.shaderName = @"Default Vertex Shader";
    self.entryPoint = @"DefaultVertexMain";
    self.metalFunctionWrapper = [library newFunctionWithName:self.entryPoint];
    self.metalFunctionWrapper.label = self.shaderName;
    
    return self;
}

@end

@implementation DefaultFragmentShader

- (nonnull instancetype)init:(nonnull id<MTLLibrary>)library
{
    self = [super init];
    
    self.shaderName = @"Default Fragment Shader";
    self.entryPoint = @"DefaultFragmentMain";
    self.metalFunctionWrapper = [library newFunctionWithName:self.entryPoint];
    self.metalFunctionWrapper.label = self.shaderName;
    
    return self;
}

@end
