//
//  VertexDescriptor.h
//  Luc
//
//  Created by Milo Heinrich on 25/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

@import MetalKit;

@interface DescriptorData : NSObject

@property MTLVertexFormat format;
@property NSUInteger bufferIndex;
@property NSUInteger offset;

@end

@interface VertexDescriptor : NSObject

@property  MTLVertexDescriptor* _Nonnull  vertexDescriptor;
@property  NSMutableArray* _Nonnull attributes;
@property  NSUInteger layoutStride;

- (nonnull instancetype)init;
- (void)addAttribute:(nonnull DescriptorData*)data;
- (void)setStride:(NSUInteger)stride;
- (void)initialiseData;

@end
