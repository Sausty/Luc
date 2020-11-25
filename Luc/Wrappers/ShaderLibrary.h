//
//  ShaderLibrary.h
//  Luc
//
//  Created by Milo Heinrich on 25/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

@import MetalKit;

#import "Shader.h"

@interface ShaderLibrary : NSObject

@property _Nonnull id<MTLLibrary> library;
@property _Nonnull NSMutableDictionary<NSString*, Shader*>* vertexShaders;
@property _Nonnull NSMutableDictionary<NSString*, Shader*>* fragmentShaders;

- (nonnull instancetype)init:(nonnull id<MTLDevice>)device;
- (void)addVertexShader:(nonnull Shader*)shader;
- (void)addFragmentShader:(nonnull Shader*)shader;
- (Shader*)getVertexShader:(nonnull NSString*)key;
- (Shader*)getFragmentShader:(nonnull NSString*)key;

@end
