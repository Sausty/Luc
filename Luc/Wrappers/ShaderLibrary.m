//
//  ShaderLibrary.m
//  Luc
//
//  Created by Milo Heinrich on 25/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "ShaderLibrary.h"

@implementation ShaderLibrary

- (nonnull instancetype)init:(nonnull id<MTLDevice>)device
{
    self = [super init];
    
    self.library = [device newDefaultLibrary];
    self.vertexShaders = [[NSMutableDictionary alloc] init];
    self.fragmentShaders = [[NSMutableDictionary alloc] init];
    
    return self;
}

- (void)addVertexShader:(Shader *)shader
{
    [_vertexShaders insertValue:shader inPropertyWithKey:shader.shaderName];
}

- (void)addFragmentShader:(Shader*)shader
{
    [_fragmentShaders insertValue:shader inPropertyWithKey:shader.shaderName];
}

- (nonnull Shader*)getVertexShader:(NSString*)key
{
    return [_vertexShaders valueForKey:key];
}

- (nonnull Shader*)getFragmentShader:(NSString*)key
{
    return [_fragmentShaders valueForKey:key];
}

@end
