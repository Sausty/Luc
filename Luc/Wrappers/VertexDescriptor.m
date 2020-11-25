//
//  VertexDescriptor.m
//  Luc
//
//  Created by Milo Heinrich on 25/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "VertexDescriptor.h"

@implementation DescriptorData

@end

@implementation VertexDescriptor

- (nonnull instancetype)init
{
    self = [super init];
    
    self.vertexDescriptor = [[MTLVertexDescriptor alloc] init];
    self.attributes = [[NSMutableArray alloc] init];
    
    return self;
}

- (void)addAttribute:(nonnull DescriptorData*)data
{
    [self.attributes addObject:data];
}

- (void)setStride:(NSUInteger)stride
{
    _layoutStride = stride;
    self.vertexDescriptor.layouts[0].stride = stride;
}

- (void)initialiseData
{
    for (size_t i = 0; i < [self.attributes count]; i++)
    {
        DescriptorData* object = self.attributes[i];
        self.vertexDescriptor.attributes[i].format = object.format;
        self.vertexDescriptor.attributes[i].bufferIndex = object.bufferIndex;
        self.vertexDescriptor.attributes[i].offset = object.offset;
    }
}

@end
