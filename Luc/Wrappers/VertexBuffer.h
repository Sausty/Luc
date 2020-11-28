//
//  VertexBuffer.h
//  Luc
//
//  Created by Milo Heinrich on 28/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

@import MetalKit;

@interface VertexBuffer : NSObject

@property id<MTLBuffer> _Nonnull bufferHandle;
@property NSUInteger bufferSize;
@property NSUInteger bufferIndex;

- (nonnull instancetype)init:(nonnull void*)vertices:(NSUInteger)buffSize:(NSUInteger)bufferIndex;
- (void)bind;

@end
