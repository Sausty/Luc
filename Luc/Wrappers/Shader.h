//
//  Shader.h
//  Luc
//
//  Created by Milo Heinrich on 25/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

@import MetalKit;

@interface Shader : NSObject

@property NSString* _Nonnull shaderName;
@property NSString* _Nonnull entryPoint;
@property id<MTLFunction> _Nonnull metalFunctionWrapper;

- (nonnull instancetype)init:(nonnull id<MTLLibrary>)library;

@end
