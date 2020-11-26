//
//  Mesh.h
//  Luc
//
//  Created by Milo Heinrich on 25/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

@import MetalKit;

@interface Mesh : NSObject

@property id<MTLBuffer> _Nonnull vertexBuffer;
@property NSUInteger bufferSize;

- (nonnull instancetype)initWithDeviceAndVertices:(nonnull id<MTLDevice>)device:(nonnull void*)vertices:(NSUInteger)size:(NSUInteger)buffSize;
- (void)render:(nonnull id<MTLRenderCommandEncoder>)encoder;

@end
